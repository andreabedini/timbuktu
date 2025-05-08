load("ghcup:defs.bzl", "GhcDistributionInfo")
load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//haskell/library_info.bzl", "HaskellLibraryProvider")
load("@prelude//linking:link_info.bzl", "LinkStyle")

##
## TODO: fix packages
##

HaskellToolchainLibrariesInfo = provider(
    doc = "Information about the Haskell libraries provided by the toolchain.",
    fields = {
        "packages_by_id": provider_field(dict[str, Dependency]),
        "packages_by_name": provider_field(dict[str, Dependency]),
    },
)

def _haskell_toolchain_library(ctx: AnalysisContext) -> list[Provider]:
    toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainLibrariesInfo]
    if ctx.attrs.id:
        return toolchain.packages_by_id[ctx.attrs.id].providers
    else:
        return toolchain.packages_by_name[ctx.label.name].providers

haskell_toolchain_library = rule(
    impl = _haskell_toolchain_library,
    attrs = {
        "id": attrs.option(attrs.string(), default = None),
        "_haskell_toolchain": attrs.toolchain_dep(
            providers = [HaskellToolchainInfo, HaskellToolchainLibrariesInfo],
            default = "@toolchains//:haskell",
        ),
    },
)

def _haskell_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    bindist = ctx.attrs.distribution[GhcDistributionInfo]

    ghc = cmd_args(bindist, format = "{}/bin/ghc")
    ghc_pkg = cmd_args(bindist, format = "{}/bin/ghc-pkg")
    haddoc = cmd_args(bindist, format = "{}/bin/haddock")

    #
    # build an index of installed packages
    #

    packages_by_name = {}
    packages_by_id = {}

    # The link style is irrelevant but I have to go around the existing design
    # of the prelude
    link_style = LinkStyle("static")
    for p in ctx.attrs.packages:
        hli = p[HaskellLibraryProvider].lib[link_style]
        packages_by_name[hli.name] = p
        packages_by_id[hli.id] = p


    return [
        ctx.attrs.distribution[GhcDistributionInfo],
        HaskellToolchainInfo(
            compiler = ghc,
            packager = ghc_pkg,
            haddock = haddoc,
            compiler_flags = ctx.attrs.compiler_flags,
            linker_flags = ctx.attrs.linker_flags,
        ),
        HaskellPlatformInfo(
            name = bindist.arch,
        ),
        HaskellToolchainLibrariesInfo(
            packages_by_name = packages_by_name,
            packages_by_id = packages_by_id,
        ),
    ]

haskell_toolchain = rule(
    impl = _haskell_toolchain,
    attrs = {
        "distribution": attrs.exec_dep(providers = [GhcDistributionInfo]),
        "compiler_flags": attrs.list(attrs.string(), default = []),
        "linker_flags": attrs.list(attrs.string(), default = []),
        "packages": attrs.list(attrs.dep(providers = [HaskellLibraryProvider]), default = []),
    },
    is_toolchain_rule = True,
)