"""
The GHC toolchain.

One toolchain serves the cabal_simple rules, the plan interpreter and the
Haskell rules of the prelude, so that they all use the same compiler. The
first two read GhcToolchainInfo, the prelude HaskellToolchainInfo.

Cabal's configure step asks the compiler what it is and what it comes with
(`ghc --numeric-version`, `ghc-pkg dump`). We do the same, and since the answer
is only known after running those commands, it is exposed as a dynamic value.
"""

load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("//rules/haskell/ghcup:defs.bzl", "GhcDistributionInfo", "host_arch")

GhcPackage = record(
    id = str,
    name = str,
    version = str,
    depends = list[str],
    include_dirs = list[str],
    # As in the registration: `A B` or `A, B from unit-id:C`
    exposed_modules = str,
    # What linking against it takes
    library_dirs = list[str],
    dynamic_library_dirs = list[str],
    hs_libraries = list[str],
    extra_libraries = list[str],
    ld_options = list[str],
)

GhcDynamicInfo = provider(
    doc = "What we learn about a GHC installation by running it.",
    fields = {
        # The unit-id of each package in the global package db, by name.
        "by_name": provider_field(dict[str, str]),
        # The global package db, by unit-id.
        "packages": provider_field(dict[str, GhcPackage]),
        # E.g. "9.12.2"
        "version": provider_field(str),
    },
)

GhcToolchainInfo = provider(
    # @unsorted-dict-items
    fields = {
        "ghc": provider_field(RunInfo),
        "ghc_pkg": provider_field(RunInfo),
        "hsc2hs": provider_field(RunInfo),
        # The version of GHC when it is known without running it, i.e. for a
        # binary distribution. The name of a shared library has it in it, and
        # the prelude wants file names during analysis (see prelude.bzl).
        "version": provider_field(str | None, default = None),
        # Resolves to GhcDynamicInfo
        "dynamic": provider_field(DynamicValue),
    },
)

def parse_installed_package_infos(text: str) -> list[dict[str, str]]:
    """Parse the output of `ghc-pkg dump`.

    Args:
      text: a sequence of InstalledPackageInfo separated by `---`
    Returns:
      one dictionary of fields for each package. The lines of a multi-line
      field are joined with spaces.
    """
    pkgs = []
    fields = {}
    key = None
    for line in text.splitlines():
        if line == "---":
            pkgs.append(fields)
            fields = {}
            key = None
        elif line[:1] in (" ", "\t"):
            if key:
                fields[key] = (fields[key] + " " + line.strip()).strip()
        elif ":" in line:
            key, _, value = line.partition(":")
            fields[key] = value.strip()
    if fields:
        pkgs.append(fields)
    return pkgs

def ghc_packages(text: str) -> (dict[str, GhcPackage], dict[str, str]):
    """Read the units of a package db off the output of `ghc-pkg dump`.

    Args:
      text: a sequence of InstalledPackageInfo separated by `---`
    Returns:
      the units by id, and the id of the unit of each package by name
    """
    packages = {}
    by_name = {}
    for fields in parse_installed_package_infos(text):
        pkg = GhcPackage(
            id = fields["id"],
            name = fields["name"],
            version = fields["version"],
            depends = fields.get("depends", "").split(),
            include_dirs = fields.get("include-dirs", "").split(),
            exposed_modules = fields.get("exposed-modules", ""),
            library_dirs = fields.get("library-dirs", "").split(),
            dynamic_library_dirs = fields.get("dynamic-library-dirs", "").split(),
            hs_libraries = fields.get("hs-libraries", "").split(),
            extra_libraries = fields.get("extra-libraries", "").split(),
            ld_options = fields.get("ld-options", "").split(),
        )
        packages[pkg.id] = pkg
        by_name[pkg.name] = pkg.id
    return packages, by_name

def _ghc_dynamic_info_impl(
        actions: AnalysisActions,
        version: ArtifactValue,
        global_package_db: ArtifactValue) -> list[Provider]:
    _unused = actions  # buildifier: disable=unused-variable
    packages, by_name = ghc_packages(global_package_db.read_string())
    return [
        GhcDynamicInfo(
            version = version.read_string().strip(),
            packages = packages,
            by_name = by_name,
        ),
    ]

_ghc_dynamic_info = dynamic_actions(
    impl = _ghc_dynamic_info_impl,
    attrs = {
        "global_package_db": dynattrs.artifact_value(),
        "version": dynattrs.artifact_value(),
    },
)

def _capture(ctx: AnalysisContext, name: str, cmd: cmd_args) -> Artifact:
    out = ctx.actions.declare_output(name)
    ctx.actions.run(
        cmd_args("sh", "-c", cmd_args(cmd, ">", out.as_output(), delimiter = " ")),
        category = "ghc_info",
        identifier = name,
        # The answer depends on what is installed on this machine.
        local_only = True,
    )
    return out

def ghc_toolchain_providers(
        ctx: AnalysisContext,
        ghc: RunInfo,
        ghc_pkg: RunInfo,
        hsc2hs: RunInfo,
        haddock: RunInfo,
        platform: str,
        static_version: str | None = None,
        default_outputs: list[Artifact] = [],
        ghci: dict[str, typing.Any] = {}) -> list[Provider]:
    version = _capture(ctx, "version", cmd_args(ghc, "--numeric-version"))
    global_package_db = _capture(
        ctx,
        "global-package-db",
        cmd_args(ghc_pkg, "dump", "--global", "--expand-pkgroot"),
    )
    return [
        DefaultInfo(
            default_outputs = default_outputs,
            sub_targets = {
                "global-package-db": [DefaultInfo(default_output = global_package_db)],
                "version": [DefaultInfo(default_output = version)],
            },
        ),
        # What the Haskell rules of the prelude know a toolchain by.
        HaskellToolchainInfo(
            compiler = ghc,
            packager = ghc_pkg,
            linker = ghc,
            haddock = haddock,
            compiler_flags = [],
            linker_flags = [],
            # NOTE: without it haskell_haddock passes the options meant for
            # GHC to haddock as they are, and no sources.
            use_argsfile = True,
            # haskell_ide wants these as paths.
            ghci_binutils_path = ctx.attrs.binutils,
            ghci_cc_path = ctx.attrs.cc,
            ghci_cpp_path = ctx.attrs.cpp,
            ghci_cxx_path = ctx.attrs.cxx,
            **ghci
        ),
        HaskellPlatformInfo(name = platform),
        GhcToolchainInfo(
            ghc = ghc,
            ghc_pkg = ghc_pkg,
            hsc2hs = hsc2hs,
            version = static_version,
            dynamic = ctx.actions.dynamic_output_new(_ghc_dynamic_info(
                version = version,
                global_package_db = global_package_db,
            )),
        ),
    ]

def _system_ghc_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    return ghc_toolchain_providers(
        ctx,
        ghc = RunInfo(args = [ctx.attrs.ghc]),
        ghc_pkg = RunInfo(args = [ctx.attrs.ghc_pkg]),
        hsc2hs = RunInfo(args = [ctx.attrs.hsc2hs]),
        haddock = RunInfo(args = [ctx.attrs.haddock]),
        platform = host_arch(),
    )

# Where the C toolchain is, for haskell_ghci and haskell_ide.
_c_tools_attrs = {
    "binutils": attrs.string(default = "/usr/bin"),
    "cc": attrs.string(default = "/usr/bin/gcc"),
    "cpp": attrs.string(default = "/usr/bin/cpp"),
    "cxx": attrs.string(default = "/usr/bin/g++"),
}

system_ghc_toolchain = rule(
    doc = "Use the GHC found in PATH. Not hermetic, and without what haskell_ghci needs.",
    impl = _system_ghc_toolchain_impl,
    attrs = _c_tools_attrs | {
        "ghc": attrs.string(default = "ghc"),
        "ghc_pkg": attrs.string(default = "ghc-pkg"),
        "haddock": attrs.string(default = "haddock"),
        "hsc2hs": attrs.string(default = "hsc2hs"),
    },
    is_toolchain_rule = True,
)

def _bindist_ghc_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    bindist = ctx.attrs.distribution[DefaultInfo].default_outputs[0]
    info = ctx.attrs.distribution[GhcDistributionInfo]
    return ghc_toolchain_providers(
        ctx,
        ghc = RunInfo(args = [bindist.project("bin/ghc")]),
        ghc_pkg = RunInfo(args = [bindist.project("bin/ghc-pkg")]),
        hsc2hs = RunInfo(args = [bindist.project("bin/hsc2hs")]),
        haddock = RunInfo(args = [bindist.project("bin/haddock")]),
        platform = info.arch,
        static_version = info.version,
        default_outputs = [bindist],
        # haskell_ghci wants these as dependencies, not as commands.
        ghci = {
            "ghci_ghc_path": ctx.attrs.distribution.sub_target("bin/ghc"),
            "ghci_iserv_path": ctx.attrs.distribution.sub_target("bin/ghc-iserv"),
            "ghci_iserv_prof_path": ctx.attrs.distribution.sub_target("bin/ghc-iserv-prof"),
            "ghci_iserv_template": ctx.attrs.ghci_iserv_template[DefaultInfo].default_outputs[0],
            "ghci_lib_path": ctx.attrs.distribution.sub_target("lib"),
            "ghci_packager": ctx.attrs.distribution.sub_target("bin/ghc-pkg"),
            "ghci_script_template": ctx.attrs.ghci_script_template[DefaultInfo].default_outputs[0],
            "script_template_processor": ctx.attrs._script_template_processor,
        },
    )

bindist_ghc_toolchain = rule(
    doc = "Use an unpacked GHC binary distribution, e.g. one from root//rules/haskell/ghcup.",
    impl = _bindist_ghc_toolchain_impl,
    attrs = _c_tools_attrs | {
        "distribution": attrs.exec_dep(providers = [GhcDistributionInfo]),
        # The scripts haskell_ghci makes its own from.
        # NOTE: they are targets, and as plain sources a toolchain built on
        # its own (`buck2 build toolchains//:haskell`) would have no platform
        # to give them.
        "ghci_iserv_template": attrs.exec_dep(default = "root//rules/haskell:iserv_script"),
        "ghci_script_template": attrs.exec_dep(default = "root//rules/haskell:ghci_script"),
        "_script_template_processor": attrs.default_only(attrs.exec_dep(
            providers = [RunInfo],
            default = "prelude//haskell/tools:script_template_processor",
        )),
    },
    is_toolchain_rule = True,
)

# The same target the Haskell rules of the prelude take their toolchain from.
# What it is an alias of is decided in toolchains//BUCK.
ghc_toolchain_attrs = {
    "_ghc": attrs.toolchain_dep(
        default = "toolchains//:haskell",
        providers = [GhcToolchainInfo],
    ),
}
