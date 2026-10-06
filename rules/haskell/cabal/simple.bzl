"""
Build rules that reproduce what Cabal does for `build-type: Simple`.

The attributes of cabal_simple_library and cabal_simple_executable are the
fields of the corresponding stanza of a package description, with underscores
in place of dashes. What Cabal's conditionals do is left to `select`.

Cabal's build goes through a few steps, and so do we:

configure
  Query the compiler and resolve build-depends to units. The libraries that
  come with the compiler are only known by name during analysis: their version
  and unit-id come from the global package db (see toolchain.bzl and unit.bzl
  in root//rules/haskell).

preprocess
  Find the source of each module in hs-source-dirs and run alex, happy and
  hsc2hs where needed. Which file a module comes from can only be known by
  looking at the source tree, which could well be the output of another rule
  (e.g. an unpacked sdist).

build
  Generate cabal_macros.h, Paths_<pkg> and PackageInfo_<pkg>, compile the C
  sources, call `ghc --make` and link.

register
  Write the package registration of a library into a package db of its own.
  There is no copy step: the registration refers to the outputs of the build
  where they are.

Everything that depends on the first two steps happens in a dynamic action,
whose outcome (the unit-id, the modules a library exposes, ...) is a dynamic
value that the components depending on it wait for.

Like Cabal, we run the tools from the root of the package, so relative paths
in the package description (and in Template Haskell splices) mean what the
package author expects.

A library can also be a dependency of the Haskell rules of the prelude, which
have a different idea of what a library is: see prelude.bzl.
"""

load("@prelude//:paths.bzl", "paths")
load("@prelude//cxx:cxx_toolchain_types.bzl", "CxxToolchainInfo")
load("@prelude//decls:toolchains_common.bzl", "toolchains_common")
load("//rules/haskell:toolchain.bzl", "GhcDynamicInfo", "GhcToolchainInfo", "ghc_toolchain_attrs")
load(":macros.bzl", "CabalMacroContext", "Versioned", "cabal_macros_gen")
load(":paths.bzl", "PathsModuleCtx", "mk_package_info_module", "mk_paths_module")
load(":prelude.bzl", "prelude_library_attrs", "prelude_library_providers")
load(
    ":providers.bzl",
    "CabalExecutableInfo",
    "CabalLibraryInfo",
    "CabalPackageInfo",
    "CabalUnit",
    "CabalUnitInfo",
    "CabalUnitTSet",
    "mangle",
)

# See knownSuffixHandlers in Distribution.Simple.PreProcess
_PREPROCESSOR_EXTS = ["chs", "hsc", "x", "y", "ly", "cpphs"]

##
## Attributes
##

def _strings():
    return attrs.list(attrs.string(), default = [])

# The BuildInfo fields we give a meaning to.
_build_info_string_fields = [
    "hs_source_dirs",
    "other_modules",
    "autogen_modules",
    "default_extensions",
    "other_extensions",
    "other_languages",
    "ghc_options",
    "ghc_shared_options",
    "cpp_options",
    "cc_options",
    "cxx_options",
    "asm_options",
    "cmm_options",
    "ld_options",
    "hsc2hs_options",
    "c_sources",
    "cxx_sources",
    "asm_sources",
    "cmm_sources",
    "include_dirs",
    "includes",
    "install_includes",
    "extra_libraries",
    "extra_lib_dirs",
]

# The BuildInfo fields we know about but cannot honour yet. Better to stop
# than to build something different from what Cabal would.
_build_info_unsupported_fields = [
    "autogen_includes",
    "extra_bundled_libraries",
    "extra_framework_dirs",
    "extra_ghci_libraries",
    "frameworks",
    "js_sources",
    "mixins",
    "pkgconfig_depends",
]

_build_info_attrs = {
    field: _strings()
    for field in _build_info_string_fields + _build_info_unsupported_fields
} | {
    "build_depends": attrs.list(attrs.dep(providers = [CabalLibraryInfo]), default = []),
    "build_tool_depends": attrs.list(attrs.exec_dep(providers = [RunInfo]), default = []),
    "buildable": attrs.bool(default = True),
    "default_language": attrs.option(attrs.string(), default = None),
    # Profiling is not supported yet, the options are accepted and ignored.
    "ghc_prof_options": _strings(),
    "package": attrs.dep(providers = [CabalPackageInfo]),
    "_find_modules": attrs.default_only(attrs.source(default = "root//rules/haskell/cabal:find_modules.sh")),
    "_register": attrs.default_only(attrs.source(default = "root//rules/haskell/cabal:register.sh")),
    "_run": attrs.default_only(attrs.source(default = "root//rules/haskell/cabal:run.sh")),
} | ghc_toolchain_attrs

def _check_supported(ctx: AnalysisContext, fields: list[str]):
    if not ctx.attrs.buildable:
        fail("{}: this component is not buildable".format(ctx.label))
    for field in fields:
        if getattr(ctx.attrs, field):
            fail("{}: `{}` is not supported yet".format(ctx.label, field.replace("_", "-")))

##
## Analysis: what is known from the package description alone
##

def _unit_id(ctx: AnalysisContext, pkg: CabalPackageInfo, component: str | None) -> str:
    """Make up the unit-id of a component.

    A unit-id has to tell a unit from every other unit that can end up in the
    same package db. cabal-install gets there by hashing what goes into the
    build; here buck2 already tells builds apart, and the label of the
    configured target (the target and the configuration it is built in) is
    what identifies one.

    Args:
      ctx: the context of the component's rule
      pkg: its package
      component: the name of the component, None for the main library
    Returns:
      <package>-<version>[-<component>]-<hash>
    """
    parts = [pkg.name, pkg.version] + ([component] if component else [])
    return "-".join(parts + [sha256(str(ctx.label))[:8]])

def _find_modules(ctx: AnalysisContext, srcdir: Artifact, source_dirs: list[str], modules: list[str], main_is: str | None) -> Artifact:
    located = ctx.actions.declare_output("modules.json")
    ctx.actions.run(
        cmd_args(
            "sh",
            ctx.attrs._find_modules,
            srcdir,
            located.as_output(),
            ["--dir=" + d for d in source_dirs],
            ["--module=" + m for m in modules],
            ["--main=" + main_is] if main_is else [],
        ),
        category = "cabal_find_modules",
    )
    return located

def _component(
        ctx: AnalysisContext,
        kind: str,
        unit_id: str,
        modules: list[str],
        outputs: dict[str, Artifact],
        **kwargs) -> DynamicValue:
    """Start the build of a component.

    Args:
      ctx: the context of the component's rule
      kind: "lib" or "exe"
      unit_id: Cabal makes one up for executables too
      modules: every module of the component
      outputs: the artifacts the dynamic action has to produce, by role
      **kwargs: what else is specific to the kind of component
    Returns:
      what resolves to the CabalUnitInfo of the component
    """
    pkg = ctx.attrs.package[CabalPackageInfo]

    source_dirs = ctx.attrs.hs_source_dirs or ["."]
    located = _find_modules(ctx, pkg.srcdir, source_dirs, modules, kwargs.get("main_is"))

    # Cabal puts build tools in PATH and tells them where their data is.
    tools = {}
    tool_exes = []
    tool_env = {}
    for dep in ctx.attrs.build_tool_depends:
        if CabalExecutableInfo in dep:
            info = dep[CabalExecutableInfo]
            tools[info.name] = cmd_args(info.exe)
            tool_exes.append(info.exe)
            tool_env.update(info.env)
        else:
            tools[dep.label.name] = cmd_args(dep[RunInfo])

    fields = {field: getattr(ctx.attrs, field) for field in _build_info_string_fields}
    fields["hs_source_dirs"] = source_dirs

    return ctx.actions.dynamic_output_new(_build(
        ghc = ctx.attrs._ghc[GhcToolchainInfo].dynamic,
        deps = [dep[CabalLibraryInfo].unit for dep in ctx.attrs.build_depends],
        located = located,
        outputs = {role: artifact.as_output() for role, artifact in outputs.items()},
        arg = struct(
            # The same artifacts, for the actions that consume them.
            artifacts = outputs,
            label = ctx.label,
            kind = kind,
            pkg = pkg,
            unit_id = unit_id,
            modules = modules,
            bi = struct(default_language = ctx.attrs.default_language, **fields),
            units = _dep_units(ctx),
            tools = tools,
            tool_exes = tool_exes,
            tool_env = tool_env,
            toolchain = ctx.attrs._ghc[GhcToolchainInfo],
            run = ctx.attrs._run,
            register = ctx.attrs._register,
            **kwargs
        ),
    ))

def _dep_units(ctx: AnalysisContext, value: CabalUnit | None = None) -> CabalUnitTSet:
    children = [dep[CabalLibraryInfo].units for dep in ctx.attrs.build_depends]
    if value:
        return ctx.actions.tset(CabalUnitTSet, value = value, children = children)
    return ctx.actions.tset(CabalUnitTSet, children = children)

def _dedupe(xs: list[str]) -> list[str]:
    return list({x: None for x in xs}.keys())

def _dedupe_any(xs: list[typing.Any]) -> list[typing.Any]:
    return list({x: None for x in xs}.keys())

def _data_dir(pkg: CabalPackageInfo) -> cmd_args:
    if pkg.data_dir in ("", "."):
        return cmd_args(pkg.srcdir)
    return cmd_args(pkg.srcdir, "/", pkg.data_dir, delimiter = "")

def _data_dir_env(pkg: CabalPackageInfo) -> (str, cmd_args):
    """What `cabal run` and build-tool-depends do for the Paths_ module."""
    return (mangle(pkg.name) + "_datadir", _data_dir(pkg))

##
## The dynamic part: configure, preprocess, build, register
##

def _run(actions: AnalysisActions, arg, cmd: cmd_args, category: str, identifier: str | None = None, mkdirs: list[OutputArtifact] = []):
    """Run a command from the root of the package."""
    srcdir = arg.pkg.srcdir
    opts = cmd_args()
    opts.add([cmd_args(exe, parent = 1, format = "--path={}") for exe in arg.tool_exes])
    opts.add([cmd_args(name + "=", value, delimiter = "") for name, value in arg.tool_env.items()])
    opts.add([cmd_args(d, format = "--mkdir={}") for d in mkdirs])
    actions.run(
        cmd_args("sh", arg.run, srcdir, cmd_args(opts, "--", cmd, relative_to = srcdir)),
        category = category,
        identifier = identifier,
    )

def _autogen(actions: AnalysisActions, arg, deps: list[CabalUnitInfo], ghc_info: GhcDynamicInfo):
    """Generate cabal_macros.h, Paths_<pkg>.hs and PackageInfo_<pkg>.hs"""
    pkg = arg.pkg
    mangled = mangle(pkg.name)

    macros_h = actions.write("cabal_macros.h", cabal_macros_gen(CabalMacroContext(
        package_version = pkg.version,
        package_key = arg.unit_id if arg.kind == "lib" else None,
        component_id = arg.unit_id,
        packages = [Versioned(name = pkg.name, version = pkg.version)] +
                   [Versioned(name = d.name, version = d.version) for d in deps],
        tools = [Versioned(name = "ghc", version = ghc_info.version)],
    )))

    paths_hs = actions.write("Paths_{}.hs".format(mangled), mk_paths_module(PathsModuleCtx(
        package_name = pkg.name,
        package_version = pkg.version,
        # There is no installation prefix, and no absolute path either: these
        # are relative to the root of the project. The environment variables
        # (<pkg>_datadir etc.) take precedence, see CabalExecutableInfo.
        bindir = "bin",
        libdir = "lib",
        dynlibdir = "lib",
        datadir = _data_dir(pkg),
        libexecdir = "libexec",
        sysconfdir = "etc",
    )))

    package_info_hs = actions.write("PackageInfo_{}.hs".format(mangled), mk_package_info_module(
        package_name = pkg.name,
        package_version = pkg.version,
        synopsis = pkg.metadata.get("synopsis", ""),
        copyright = pkg.metadata.get("copyright", ""),
        homepage = pkg.metadata.get("homepage", ""),
    ))

    return struct(
        # Cabal's dist/build/autogen
        dir = actions.symlinked_dir("autogen", {
            artifact.basename: artifact
            for artifact in [macros_h, paths_hs, package_info_hs]
        }),
        macros_h = macros_h,
        modules = ["Paths_" + mangled, "PackageInfo_" + mangled],
    )

def _include_dirs(arg, autogen) -> list[typing.Any]:
    return [autogen.dir] + arg.bi.include_dirs

def _package_args(arg, deps: list[CabalUnitInfo]) -> cmd_args:
    args = cmd_args("-hide-all-packages", "-no-user-package-db")
    args.add(arg.units.project_as_args("package_db"))
    args.add(cmd_args(hidden = arg.units.project_as_args("artifacts")))
    for d in deps:
        args.add("-package-id", d.id)
    return args

def _ghc_args(arg, deps: list[typing.Any], autogen, pp_dir: Artifact | None, cpp_options: bool = True) -> cmd_args:
    """The options common to every invocation of GHC, see componentGhcOptions."""
    bi = arg.bi
    args = cmd_args("-fbuilding-cabal-package", "-O")

    # Where the sources are, in Cabal's order: hs-source-dirs, what the
    # preprocessors produced, the autogenerated modules.
    args.add("-i")
    args.add(["-i" + d for d in bi.hs_source_dirs])
    if pp_dir:
        args.add(cmd_args(pp_dir, format = "-i{}"))
    args.add(cmd_args(autogen.dir, format = "-i{}"))

    args.add(cmd_args(_include_dirs(arg, autogen), format = "-I{}"))
    args.add("-optP-include", cmd_args(autogen.macros_h, format = "-optP{}"))

    args.add("-this-unit-id", arg.unit_id)
    args.add(_package_args(arg, deps))
    args.add("-Wmissing-home-modules")

    args.add("-X" + (bi.default_language or "Haskell98"))
    args.add(["-X" + e for e in bi.default_extensions])

    if cpp_options:
        args.add(["-optP" + o for o in bi.cpp_options])
    args.add(["-optc" + o for o in bi.cc_options])
    args.add(["-optcxx" + o for o in bi.cxx_options])
    args.add(["-opta" + o for o in bi.asm_options])
    args.add(bi.ghc_options)
    args.add(bi.cmm_options)
    return args

def _link_args(arg) -> cmd_args:
    bi = arg.bi
    return cmd_args(
        ["-optl" + o for o in bi.ld_options],
        ["-L" + d for d in bi.extra_lib_dirs],
        ["-l" + l for l in bi.extra_libraries],
    )

def _tool(arg, name: str) -> cmd_args:
    if name in arg.tools:
        return arg.tools[name]
    if name == "hsc2hs":
        return cmd_args(arg.toolchain.hsc2hs)

    # Cabal would look for it in PATH too.
    return cmd_args(name)

def _hsc2hs_args(arg, deps: list[typing.Any], autogen, ghc_info: GhcDynamicInfo) -> cmd_args:
    bi = arg.bi
    major, minor = ghc_info.version.split(".")[:2]
    cflags = cmd_args(
        "-D__GLASGOW_HASKELL__={}".format(int(major) * 100 + int(minor)),
        cmd_args(_include_dirs(arg, autogen), format = "-I{}"),
        ["-I" + d for d in _dedupe([d for dep in deps for d in dep.global_include_dirs])],
        bi.cpp_options,
        bi.cc_options,
        "-include",
        autogen.macros_h,
    )
    lflags = cmd_args(
        ["-L" + d for d in bi.extra_lib_dirs],
        ["-l" + l for l in bi.extra_libraries],
        bi.ld_options,
    )
    return cmd_args(
        cmd_args(cflags, format = "--cflag={}"),
        cmd_args(lflags, format = "--lflag={}"),
        bi.hsc2hs_options,
    )

def _preprocess(actions: AnalysisActions, arg, deps: list[typing.Any], autogen, ghc_info: GhcDynamicInfo, located: dict, module_path: str) -> Artifact:
    """Turn the source of a module into Haskell, see Distribution.Simple.PreProcess"""
    src = paths.join(located["dir"], located["file"])
    out = actions.declare_output("preprocess", module_path + ".hs")
    ext = located["ext"]
    if ext == "x":
        cmd = cmd_args(_tool(arg, "alex"), "-g")
    elif ext in ("y", "ly"):
        cmd = cmd_args(_tool(arg, "happy"), "-agc")
    elif ext == "hsc":
        cmd = cmd_args(_tool(arg, "hsc2hs"), _hsc2hs_args(arg, deps, autogen, ghc_info))
    else:
        fail("{}: {}: no preprocessor for `.{}` files yet".format(arg.label, src, ext))
    cmd.add("-o", out.as_output(), src)
    _run(actions, arg, cmd, category = "cabal_preprocess", identifier = src)
    return out

def _compile_extra_sources(actions: AnalysisActions, arg, ghc_args: cmd_args) -> list[Artifact]:
    """Compile c-sources and friends, see Distribution.Simple.GHC.Build.ExtraSources

    Cabal compiles them once for each way. We make position independent code
    and use it for both the static and the shared library.
    """
    bi = arg.bi
    common = cmd_args(arg.toolchain.ghc, "-c", ghc_args, "-fPIC")
    objs = []
    for srcs, options in [
        # See optimizationCFlags
        (bi.c_sources, ["-optc-O2"]),
        (bi.cxx_sources, ["-optcxx-O2"]),
        (bi.asm_sources, []),
        (bi.cmm_sources, []),
    ]:
        for src in srcs:
            obj = actions.declare_output("extra-objs", src + ".o")
            _run(
                actions,
                arg,
                cmd_args(common, options, "-o", obj.as_output(), src),
                category = "cabal_compile_extra_source",
                identifier = src,
            )
            objs.append(obj)
    return objs

def _ipi_field(name: str, value: str) -> str:
    lines = value.strip().split("\n")
    return "\n".join(["{}: {}".format(name, lines[0])] + ["    {}".format(l.strip() or ".") for l in lines[1:]])

def _ipi_path(name: str, *path) -> cmd_args:
    """A field that refers to artifacts, see register.sh"""
    return cmd_args(name + ":", [cmd_args("${projectroot}/", p, delimiter = "") for p in path], delimiter = " ")

def _resolve_reexports(arg, deps: list[CabalUnitInfo]) -> dict[str, (str, str)]:
    """What a library exposes: its own modules and those it passes on.

    An item of reexported-modules is `[pkg:]Module [as Name]`.
    """
    exposed = {m: (arg.unit_id, m) for m in arg.exposed_modules}
    for item in arg.reexported_modules:
        words = item.split()
        if len(words) == 3 and words[1] == "as":
            original, name = words[0], words[2]
        elif len(words) == 1:
            original = words[0]
            name = original.rpartition(":")[2]
        else:
            fail("{}: cannot make sense of `{}` in reexported-modules".format(arg.label, item))
        pkg, _, original = original.rpartition(":")

        if not pkg and original in arg.modules:
            exposed[name] = (arg.unit_id, original)
            continue

        candidates = _dedupe_any([
            dep.exposed_modules[original]
            for dep in deps
            if original in dep.exposed_modules and (not pkg or dep.name == pkg)
        ])
        if len(candidates) != 1:
            fail("{}: reexported-modules: `{}` is {}".format(
                arg.label,
                item,
                "exposed by more than one dependency" if candidates else "not a module of this library nor one exposed by its dependencies",
            ))
        exposed[name] = candidates[0]
    return exposed

def _prelude_package_name(pkg_name: str, lib_name: str | None) -> str:
    """The package name a library has for the Haskell rules of the prelude.

    They name a dependency by package (`-package <name>`), and for GHC a
    sublibrary goes by the name of its package like the main library does: it
    would pick one of the two. So for the prelude a sublibrary is a package of
    its own. Its name cannot be the munged one of its registration
    (z-<package>-z-<library>), which ghc-pkg takes apart again.

    Args:
      pkg_name: the name of the package
      lib_name: the name of the sublibrary, None for the main library
    Returns:
      what `-package` selects the library and nothing else with
    """
    return "{}-z-{}".format(pkg_name, lib_name) if lib_name else pkg_name

def _registration(arg, deps: list[CabalUnitInfo], exposed: dict[str, (str, str)], for_prelude: bool = False) -> cmd_args:
    """The InstalledPackageInfo of a library, see Distribution.Simple.Register

    Like the registration Cabal makes for a package it built in place, it
    refers to the outputs of the build where they are.

    Args:
      arg: the component
      deps: the units it depends on
      exposed: the modules it exposes
      for_prelude: register a sublibrary as a package of its own, see
        _prelude_package_name
    Returns:
      the lines of the registration
    """
    pkg = arg.pkg
    bi = arg.bi
    artifacts = arg.artifacts

    fields = []
    if arg.lib_name and not for_prelude:
        fields += [
            ("name", "z-{}-z-{}".format(pkg.name, arg.lib_name)),
            ("version", pkg.version),
            ("package-name", pkg.name),
            ("lib-name", arg.lib_name),
        ]
    elif arg.lib_name:
        fields += [
            ("name", _prelude_package_name(pkg.name, arg.lib_name)),
            ("version", pkg.version),
        ]
    else:
        fields += [
            ("name", pkg.name),
            ("version", pkg.version),
        ]
    fields += [
        ("visibility", arg.visibility),
        ("id", arg.unit_id),
        ("key", arg.unit_id),
    ]
    fields += pkg.metadata.items()
    fields += [
        ("exposed", "True"),
        ("exposed-modules", ", ".join([
            name if (unit_id, original) == (arg.unit_id, name) else "{} from {}:{}".format(name, unit_id, original)
            for name, (unit_id, original) in exposed.items()
        ])),
        ("hidden-modules", " ".join(bi.other_modules)),
        ("extra-libraries", " ".join(bi.extra_libraries)),
        ("includes", " ".join(bi.includes)),
        ("depends", " ".join([d.id for d in deps])),
        ("cc-options", " ".join(bi.cc_options)),
        ("ld-options", " ".join(bi.ld_options)),
    ]
    lines = [_ipi_field(name, value) for name, value in fields if value]

    if arg.modules:
        lines.append(_ipi_path("import-dirs", artifacts["hi"]))
    if "static_lib" in artifacts:
        lines += [
            "hs-libraries: HS" + arg.unit_id,
            _ipi_path("library-dirs", cmd_args(artifacts["static_lib"], parent = 1)),
            _ipi_path("dynamic-library-dirs", artifacts["dynlib"]),
        ]
    if bi.include_dirs:
        lines.append(_ipi_path("include-dirs", *[cmd_args(pkg.srcdir, "/", d, delimiter = "") for d in bi.include_dirs]))
    return cmd_args(lines)

def _build_library(actions: AnalysisActions, arg, outputs: dict[str, OutputArtifact], deps: list[CabalUnitInfo], ghc_info: GhcDynamicInfo, ghc_args: cmd_args, extra_objs: list[Artifact]) -> dict[str, (str, str)]:
    tc = arg.toolchain
    objs = arg.artifacts["objs"]
    hi = arg.artifacts["hi"]

    # Cabal builds the vanilla and the dynamic way in one go when it can.
    compile = cmd_args(tc.ghc)
    if arg.modules:
        compile.add("--make", ghc_args)
        compile.add("-static", "-dynamic-too", "-dynosuf", "dyn_o", "-dynhisuf", "dyn_hi")
        compile.add("-odir", outputs["objs"], "-hidir", outputs["hi"], "-stubdir", outputs["objs"])
        compile.add(arg.modules)
    else:
        compile.add("--version")
    _run(actions, arg, compile, category = "cabal_build", identifier = "ghc --make", mkdirs = [outputs["objs"], outputs["hi"]])

    if "static_lib" in outputs:
        module_objs = [m.replace(".", "/") for m in arg.modules]

        actions.run(
            cmd_args(
                arg.ar,
                "rcs",
                outputs["static_lib"],
                [cmd_args(objs, format = "{}/" + o + ".o") for o in module_objs],
                extra_objs,
            ),
            category = "cabal_link",
            identifier = "static",
        )

        dynlib = outputs["dynlib"]
        _run(
            actions,
            arg,
            cmd_args(
                tc.ghc,
                "-shared",
                "-dynamic",
                "-fPIC",
                "-dynload",
                "deploy",
                "-no-auto-link-packages",
                "-this-unit-id",
                arg.unit_id,
                _package_args(arg, deps),
                arg.bi.ghc_options,
                arg.bi.ghc_shared_options,
                _link_args(arg),
                [cmd_args(objs, format = "{}/" + o + ".dyn_o") for o in module_objs],
                extra_objs,
                "-o",
                cmd_args(dynlib, format = "{{}}/libHS{}-ghc{}.so".format(arg.unit_id, ghc_info.version)),
            ),
            category = "cabal_link",
            identifier = "shared",
            mkdirs = [dynlib],
        )

    # register

    exposed = _resolve_reexports(arg, deps)
    conf = actions.write("registration.conf", _registration(arg, deps, exposed))

    if arg.exposed_modules:
        abi_hash = actions.declare_output("abi-hash")
        _run(
            actions,
            arg,
            cmd_args(
                "sh",
                "-c",
                'exec "$@" > "$0"',
                abi_hash.as_output(),
                tc.ghc,
                "--abi-hash",
                ghc_args,
                "-hidir",
                hi,
                arg.exposed_modules,
            ),
            category = "cabal_register",
            identifier = "abi-hash",
        )
    else:
        abi_hash = actions.write("abi-hash", "")

    actions.run(
        cmd_args("sh", arg.register, outputs["package_db"], arg.unit_id, conf, abi_hash, tc.ghc_pkg),
        category = "cabal_register",
        identifier = "package db",
    )

    # A sublibrary has a second registration, see _prelude_package_name.
    if "prelude_package_db" in outputs:
        prelude_conf = actions.write("prelude-registration.conf", _registration(arg, deps, exposed, for_prelude = True))
        actions.run(
            cmd_args("sh", arg.register, outputs["prelude_package_db"], arg.unit_id, prelude_conf, abi_hash, tc.ghc_pkg),
            category = "cabal_register",
            identifier = "package db for the prelude",
        )
    return exposed

def _build_executable(actions: AnalysisActions, arg, outputs: dict[str, OutputArtifact], ghc_args: cmd_args, extra_objs: list[Artifact], main: Artifact | str):
    # Only the executable is of interest, but the rest has to go somewhere.
    objs = actions.declare_output("objs", dir = True)
    hi = actions.declare_output("hi", dir = True)
    _run(
        actions,
        arg,
        cmd_args(
            arg.toolchain.ghc,
            "--make",
            ghc_args,
            "-odir",
            objs.as_output(),
            "-hidir",
            hi.as_output(),
            "-stubdir",
            objs.as_output(),
            _link_args(arg),
            "-o",
            outputs["exe"],
            main,
            arg.bi.other_modules,
            extra_objs,
        ),
        category = "cabal_build",
        identifier = "ghc --make",
        mkdirs = [objs.as_output(), hi.as_output()],
    )

def _build_impl(
        actions: AnalysisActions,
        ghc: ResolvedDynamicValue,
        deps: list[ResolvedDynamicValue],
        located: ArtifactValue,
        outputs: dict[str, OutputArtifact],
        arg: typing.Any) -> list[Provider]:
    ghc_info = ghc.providers[GhcDynamicInfo]
    located = located.read_json()

    # configure: by now build-depends are pinned down to units, as
    # `--dependency=pkg=unit-id` would

    deps = [dep.providers[CabalUnitInfo] for dep in deps]
    autogen = _autogen(actions, arg, deps, ghc_info)

    # preprocess

    preprocessed = {}
    for module in arg.modules:
        if module in located["modules"]:
            source = located["modules"][module]
            if source["ext"] in _PREPROCESSOR_EXTS:
                module_path = module.replace(".", "/")
                preprocessed[module_path + ".hs"] = _preprocess(actions, arg, deps, autogen, ghc_info, source, module_path)
        elif module not in autogen.modules:
            fail("{}: could not find module `{}` in hs-source-dirs ({}). If it is autogenerated, note that only {} are.".format(
                arg.label,
                module,
                ", ".join(arg.bi.hs_source_dirs),
                " and ".join(autogen.modules),
            ))

    main = None
    if arg.kind == "exe":
        source = located.get("main")
        if not source:
            fail("{}: could not find main-is `{}` in hs-source-dirs ({})".format(arg.label, arg.main_is, ", ".join(arg.bi.hs_source_dirs)))
        if source["ext"] in _PREPROCESSOR_EXTS:
            # Out of the way of the modules, whatever the file is called.
            main = _preprocess(actions, arg, deps, autogen, ghc_info, source, "main-is/" + paths.split_extension(source["file"])[0])
        else:
            main = paths.join(source["dir"], source["file"])

    # Where Cabal would have put them: dist/build
    pp_dir = actions.symlinked_dir("preprocessed", preprocessed) if preprocessed else None

    # build

    ghc_args = _ghc_args(arg, deps, autogen, pp_dir)
    extra_objs = _compile_extra_sources(actions, arg, _ghc_args(arg, deps, autogen, pp_dir, cpp_options = False))

    if arg.kind == "lib":
        exposed = _build_library(actions, arg, outputs, deps, ghc_info, ghc_args, extra_objs)
    else:
        _build_executable(actions, arg, outputs, ghc_args, extra_objs, main)
        exposed = {}

    return [
        CabalUnitInfo(
            id = arg.unit_id,
            name = arg.pkg.name,
            version = arg.pkg.version,
            exposed_modules = exposed,
            global_include_dirs = _dedupe([d for dep in deps for d in dep.global_include_dirs]),
        ),
    ]

_build = dynamic_actions(
    impl = _build_impl,
    attrs = {
        "arg": dynattrs.value(typing.Any),
        "deps": dynattrs.list(dynattrs.dynamic_value()),
        "ghc": dynattrs.dynamic_value(),
        "located": dynattrs.artifact_value(),
        "outputs": dynattrs.dict(str, dynattrs.output()),
    },
)

##
## Rules
##

def _cabal_simple_library_impl(ctx: AnalysisContext) -> list[Provider]:
    _check_supported(ctx, _build_info_unsupported_fields + ["signatures"])

    pkg = ctx.attrs.package[CabalPackageInfo]
    lib_name = ctx.attrs.library_name

    unit_id = ctx.attrs.unit_id or _unit_id(ctx, pkg, lib_name)

    modules = _dedupe(ctx.attrs.exposed_modules + ctx.attrs.other_modules)

    package_db = ctx.actions.declare_output("package.conf.d", dir = True)
    hi = ctx.actions.declare_output("hi", dir = True)
    outputs = {
        "hi": hi,
        "objs": ctx.actions.declare_output("objs", dir = True),
        "package_db": package_db,
    }

    # What the registration points to, i.e. what using the unit takes.
    artifacts = [hi]
    if ctx.attrs.include_dirs:
        artifacts.append(pkg.srcdir)

    # Without code there is no library to speak of, only a registration.
    if modules or ctx.attrs.c_sources or ctx.attrs.cxx_sources or ctx.attrs.asm_sources or ctx.attrs.cmm_sources:
        outputs["static_lib"] = ctx.actions.declare_output("lib", "libHS{}.a".format(unit_id))

        # The name of the shared library has the version of GHC in it, which
        # we only know later.
        outputs["dynlib"] = ctx.actions.declare_output("dynlib", dir = True)
        artifacts += [outputs["static_lib"], outputs["dynlib"]]

    if lib_name:
        outputs["prelude_package_db"] = ctx.actions.declare_output("prelude", "package.conf.d", dir = True)

    unit = _component(
        ctx,
        kind = "lib",
        unit_id = unit_id,
        modules = modules,
        outputs = outputs,
        lib_name = lib_name,
        # The archiver is the one the C and C++ rules use, and the Haskell
        # rules of the prelude with them.
        ar = ctx.attrs._cxx_toolchain[CxxToolchainInfo].linker_info.archiver,
        exposed_modules = ctx.attrs.exposed_modules,
        reexported_modules = ctx.attrs.reexported_modules,
        visibility = ctx.attrs.library_visibility or ("private" if lib_name else "public"),
    )

    # The name of the shared library is only known here when the version of
    # GHC is.
    shared_lib = None
    ghc_version = ctx.attrs._ghc[GhcToolchainInfo].version
    if "dynlib" in outputs and ghc_version:
        soname = "libHS{}-ghc{}.so".format(unit_id, ghc_version)
        shared_lib = (soname, outputs["dynlib"].project(soname))

    return [
        DefaultInfo(
            default_outputs = [package_db] + artifacts,
            sub_targets = {role: [DefaultInfo(default_output = artifact)] for role, artifact in outputs.items()},
        ),
        CabalLibraryInfo(
            name = pkg.name,
            lib_name = lib_name,
            unit = unit,
            units = _dep_units(ctx, CabalUnit(
                id = unit_id,
                package_db = package_db,
                artifacts = artifacts,
                data_dir = _data_dir_env(pkg),
            )),
        ),
    ] + prelude_library_providers(
        ctx,
        name = _prelude_package_name(pkg.name, lib_name),
        version = pkg.version,
        unit_id = unit_id,
        package_db = outputs.get("prelude_package_db", package_db),
        hi = hi,
        inputs = artifacts[1:],
        static_lib = outputs.get("static_lib"),
        shared_lib = shared_lib,
        linker_flags =
            ctx.attrs.ld_options +
            [cmd_args("-L", d if paths.is_absolute(d) else cmd_args(pkg.srcdir, "/", d, delimiter = ""), delimiter = "") for d in ctx.attrs.extra_lib_dirs] +
            ["-l" + lib for lib in ctx.attrs.extra_libraries],
        deps = ctx.attrs.build_depends,
    )

cabal_simple_library = rule(
    doc = "A `library` stanza of a package with `build-type: Simple`.",
    impl = _cabal_simple_library_impl,
    # @unsorted-dict-items
    attrs = {
        # The name of a sublibrary, None for the main library of the package.
        "library_name": attrs.option(attrs.string(), default = None),
        # What GHC knows the library by. Not a field of a package
        # description: cabal-install makes one up, and so do we when it is
        # not given (see _unit_id).
        "unit_id": attrs.option(attrs.string(), default = None),
        "_cxx_toolchain": toolchains_common.cxx(),
        "exposed_modules": _strings(),
        "reexported_modules": _strings(),
        "signatures": _strings(),
        # The `visibility` field; buck2 has its own idea of what visibility is.
        "library_visibility": attrs.option(attrs.enum(["public", "private"]), default = None),
    } | _build_info_attrs | prelude_library_attrs,
)

def _executable(ctx: AnalysisContext, exe_name: str) -> list[Provider]:
    _check_supported(ctx, _build_info_unsupported_fields)

    pkg = ctx.attrs.package[CabalPackageInfo]
    exe = ctx.actions.declare_output("bin", exe_name)

    _component(
        ctx,
        kind = "exe",
        unit_id = _unit_id(ctx, pkg, exe_name),
        modules = _dedupe(ctx.attrs.other_modules),
        outputs = {"exe": exe},
        main_is = ctx.attrs.main_is,
    )

    # The executable finds the data-files of its package, and of the
    # libraries it is made of, through the environment.
    env = dict([unit.data_dir for unit in _dep_units(ctx).traverse() if unit.data_dir] + [_data_dir_env(pkg)])

    return [
        DefaultInfo(default_output = exe),
        RunInfo(args = cmd_args(
            "env",
            [cmd_args(name + "=", value, delimiter = "") for name, value in env.items()],
            exe,
        )),
        CabalExecutableInfo(name = exe_name, exe = exe, env = env),
    ]

def _cabal_simple_executable_impl(ctx: AnalysisContext) -> list[Provider]:
    return _executable(ctx, ctx.attrs.executable_name or ctx.label.name)

cabal_simple_executable = rule(
    doc = "An `executable` stanza of a package with `build-type: Simple`.",
    impl = _cabal_simple_executable_impl,
    # @unsorted-dict-items
    attrs = {
        # The name of the executable, when it differs from the name of the target.
        "executable_name": attrs.option(attrs.string(), default = None),
        "main_is": attrs.string(),
    } | _build_info_attrs,
)

def _cabal_simple_test_impl(ctx: AnalysisContext) -> list[Provider]:
    if ctx.attrs.type != "exitcode-stdio-1.0":
        fail("{}: test suites of type `{}` are not supported yet".format(ctx.label, ctx.attrs.type))
    providers = _executable(ctx, ctx.label.name)
    run_info = [p for p in providers if isinstance(p, RunInfo)][0]
    return providers + [
        ExternalRunnerTestInfo(
            type = "cabal",
            command = [run_info.args],
            # NOTE: Cabal runs test suites from the root of the package
            # instead, tests that read files with a relative path need it.
            run_from_project_root = True,
        ),
    ]

cabal_simple_test = rule(
    doc = "A `test-suite` stanza of a package with `build-type: Simple`.",
    impl = _cabal_simple_test_impl,
    # @unsorted-dict-items
    attrs = {
        "type": attrs.string(default = "exitcode-stdio-1.0"),
        "main_is": attrs.string(),
    } | _build_info_attrs,
)
