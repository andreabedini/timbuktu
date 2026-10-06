load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("ghcup/defs.bzl", "CabalDistributionInfo", "GhcDistributionInfo")

##
## TODO: fix packages
##

HaskellPackageDbEntry = record(
    name = str,
    version = str,
)

DynamicHaskellPackageDbInfo = provider(fields = {
    "entries": dict[str, HaskellPackageDbEntry],
})

HaskellPackageDbInfo = provider(fields = {
    "dynamic": DynamicValue,
})

def _dynamic_package_db_info_impl(actions: AnalysisActions, package_db_info: ArtifactValue) -> list[Provider]:
    entries = {}
    lines = package_db_info.read_string().splitlines()
    for i in range(0, len(lines), 3):
        if i + 2 >= len(lines):
            break
        id = lines[i]
        name = lines[i + 1]
        version = lines[i + 2]
        entries[id] = HaskellPackageDbEntry(name = name, version = version)

    return [
        DynamicHaskellPackageDbInfo(entries = entries),
    ]

_dynamic_package_db_info = dynamic_actions(
    impl = _dynamic_package_db_info_impl,
    attrs = {
        "package_db_info": dynattrs.artifact_value(),
    },
)

def _package_db_info(ctx, ghc_pkg) -> DynamicValue:
    package_db_info = ctx.actions.declare_output("package_db_info")
    cmdline = cmd_args(
        ghc_pkg,
        "--simple-output",
        "field",
        "\\*",
        "id,name,version",
        ">",
        package_db_info.as_output(),
        delimiter = " ",
    )
    ctx.actions.run(cmd_args("sh", "-c", cmdline), category = "ghc_pkg")

    return ctx.actions.dynamic_output_new(_dynamic_package_db_info(
        package_db_info = package_db_info,
    ))

def _haskell_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    bindist = ctx.attrs.distribution[DefaultInfo].default_outputs[0]
    bindist_info = ctx.attrs.distribution[GhcDistributionInfo]

    ghc = RunInfo(args = cmd_args(bindist.project("bin/ghc")))
    ghc_pkg = RunInfo(args = cmd_args(bindist.project("bin/ghc-pkg")))
    haddock = RunInfo(args = cmd_args(bindist.project("bin/haddock")))

    return [
        ctx.attrs.distribution[DefaultInfo],
        ctx.attrs.distribution[GhcDistributionInfo],
        HaskellToolchainInfo(
            compiler = ghc,
            linker = ghc,
            packager = ghc_pkg,
            haddock = haddock,
            compiler_flags = ctx.attrs.compiler_flags,
            linker_flags = ctx.attrs.linker_flags,
        ),
        HaskellPlatformInfo(
            name = bindist_info.arch,
        ),
        HaskellPackageDbInfo(dynamic = _package_db_info(ctx, ghc_pkg)),
    ]

haskell_toolchain = rule(
    impl = _haskell_toolchain_impl,
    attrs = {
        "distribution": attrs.exec_dep(providers = [GhcDistributionInfo]),
        "compiler_flags": attrs.list(attrs.string(), default = []),
        "linker_flags": attrs.list(attrs.string(), default = []),
    },
    is_toolchain_rule = True,
)

def _something_impl(ctx: AnalysisContext) -> list[Provider]:
    packages = ctx.attrs._haskell_toolchain[HaskellPackageDbInfo].dynamic
    output = ctx.actions.declare_output("something.txt")
    ctx.actions.dynamic_output_new(_something_dynamic(packages = packages, output = output.as_output()))
    return [
        DefaultInfo(default_output = output),
    ]

something = rule(
    impl = _something_impl,
    attrs = {
        "_haskell_toolchain": attrs.toolchain_dep(
            providers = [HaskellToolchainInfo, HaskellPackageDbInfo],
            default = "@toolchains//:haskell",
        ),
    },
)

def _something_dynamic_impl(actions, packages: ResolvedDynamicValue, output: OutputArtifact) -> list[Provider]:
    actions.write(output, str(packages))
    return []

_something_dynamic = dynamic_actions(
    impl = _something_dynamic_impl,
    attrs = {
        "packages": dynattrs.dynamic_value(),
        "output": dynattrs.output(),
    },
)

def _cabal_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    return ctx.attrs.distribution.providers

cabal_toolchain = rule(
    impl = _cabal_toolchain_impl,
    attrs = {
        "distribution": attrs.exec_dep(providers = [CabalDistributionInfo]),
    },
    is_toolchain_rule = True,
)
