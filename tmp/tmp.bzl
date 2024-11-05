"""
Build rules for the simple build-type.
"""

load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//haskell/library_info.bzl", "HaskellLibraryProvider")
load("@prelude//haskell/toolchain.bzl", "HaskellToolchainInfo")
load("@prelude//linking:link_info.bzl", "LinkStyle")
load("@root//rules/haskell/cabal/paths.bzl", "PathsModuleCtx", "mk_paths_module")
load("@root//rules/haskell/cabal_install/common.bzl", "haskell_toolchain_attrs")

def _dynamic_target_metadata_impl(
        actions: AnalysisActions,
        pkg_name,
        pkg_version,
        buildinfo,
        cabalfile,
        outfile,
        outdir,
        haskell_toolchain) -> list[Provider]:
    """
    """

    bi = buildinfo.read_json()
    component = buildinfo.read_json()["components"][0]

    s = mk_paths_module(PathsModuleCtx(
        package_name = pkg_name,
        package_version = pkg_version,
        bindir = "bindir",
        libdir = "libdir",
        dynlibdir = "dynlibdir",
        datadir = "datadir",
        libexecdir = "libexecdir",
        sysconfdir = "sysconfdir",
    ))
    paths_module = actions.write("Paths_{}.hs".format(pkg_name, pkg_name), s)

    cmd = cmd_args(haskell_toolchain.compiler)

    for a in component["compiler-args"]:
        if not a.startswith("-optP"):
            cmd.add(a)

    cmd.add(*component["modules"])
    cmd.add([f.removesuffix(".hs") for f in component["src-files"]])
    cmd.add("-v")

    # override the output directory
    cmd.add("-outputdir", outdir, "-o", outfile)

    # add include for the paths_module
    cmd.add(cmd_args(paths_module, format = "-i{}", parent = 1))

    srcdir = cmd_args(cabalfile, parent = 1)
    actions.run(
        cmd_args(
            cmd_args(
                "env",
                "-C",
                srcdir,
                "--",
                cmd_args(cmd, relative_to = (cabalfile, 1)),
            ),
            hidden = [paths_module],
        ),
        category = "build",
    )

    return []

_dynamic_target_metadata = dynamic_actions(
    impl = _dynamic_target_metadata_impl,
    attrs = {
        "buildinfo": dynattrs.artifact_value(),
        "cabalfile": dynattrs.value(Artifact),
        "outfile": dynattrs.output(),
        "outdir": dynattrs.output(),
        "pkg_name": dynattrs.value(str),
        "pkg_version": dynattrs.value(str),
        "haskell_toolchain": dynattrs.value(HaskellToolchainInfo),
    },
)

def _configure_impl(ctx: AnalysisContext) -> list[Provider]:
    """
    Setup.hs configure
    """
    setup = ctx.attrs.setup[RunInfo]

    srcdir = ctx.attrs.srcdir
    cabalfile = srcdir.project(ctx.attrs.pkg_name + ".cabal")

    buildinfo = ctx.actions.declare_output("local-build-info.json")

    ctx.actions.run(
        cmd_args(
            cmd_args("env", "-C", srcdir, "--"),
            cmd_args(
                setup,
                "configure",
                cmd_args(buildinfo.as_output(), format = "--builddir={}", parent = 1),
                relative_to = srcdir,
            ),
            hidden = [buildinfo.as_output()],
        ),
        category = "cabal_configure",
    )

    return [
        DefaultInfo(default_output = buildinfo),
    ]

configure = rule(
    impl = _configure_impl,
    attrs = {
        "srcdir": attrs.source(),
        "config_flags": attrs.list(attrs.string(), default = []),
        "setup": attrs.dep(
            providers = [RunInfo],
            default = "//rules/haskell/cabal_install/helpers:setup_simple",
        ),
    },
)

def _build_impl(ctx: AnalysisContext) -> list[Provider]:
    setup = ctx.attrs.setup[RunInfo]

    srcdir = ctx.attrs.srcdir
    cabalfile = srcdir.project(ctx.attrs.pkg_name + ".cabal")

    buildinfo = ctx.actions.declare_output("local-build-info.json")

    dep_args = cmd_args("--exact-configuration")
    dep_args.add(cmd_args(
        [dep[HaskellLibraryProvider].lib[LinkStyle("static")].db for dep in ctx.attrs.deps],
        format = "--package-db={}",
    ))
    for dep in ctx.attrs.deps:
        dep_args.add("--dependency={}={}".format(
            dep[HaskellLibraryProvider].lib[LinkStyle("static")].name,
            dep[HaskellLibraryProvider].lib[LinkStyle("static")].id,
        ))

    ctx.actions.run(
        cmd_args(
            cmd_args("env", "-C", srcdir, "--"),
            cmd_args(
                setup,
                "configure",
                dep_args,
                cmd_args(buildinfo.as_output(), format = "--builddir={}", parent = 1),
                relative_to = srcdir,
            ),
            hidden = [buildinfo.as_output()],
        ),
        category = "cabal_configure",
    )

    outfile = ctx.actions.declare_output("outfile")
    outdir = ctx.actions.declare_output("outdir", dir = True)

    ctx.actions.dynamic_output_new(_dynamic_target_metadata(
        buildinfo = buildinfo,
        outfile = outfile.as_output(),
        outdir = outdir.as_output(),
        cabalfile = cabalfile,
        haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo],
        pkg_name = ctx.attrs.pkg_name,
        pkg_version = ctx.attrs.pkg_version,
    ))

    return [
        DefaultInfo(default_outputs = [outfile, outdir, buildinfo]),
    ]

build = rule(
    impl = _build_impl,
    # @unsorted-dict-items
    attrs = {
        "pkg_name": attrs.string(),
        "pkg_version": attrs.string(),
        "srcdir": attrs.source(),
        "setup": attrs.dep(
            default = "//rules/haskell/cabal_install/helpers:setup_simple",
            providers = [RunInfo],
        ),
        "deps": attrs.list(attrs.dep(
            providers = [HaskellLibraryProvider],
        ), default = []),
    } | haskell_toolchain_attrs,
)
