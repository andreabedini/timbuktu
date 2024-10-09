"""
Haskell toolchain definition and rules.
"""

load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//haskell/library_info.bzl", "HaskellLibraryProvider")
load("@prelude//linking:link_info.bzl", "LinkStyle")

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

def _haskell_toolchain(ctx: AnalysisContext) -> list[Provider]:
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
        DefaultInfo(),
        HaskellToolchainInfo(
            compiler = ctx.attrs.compiler,
            packager = ctx.attrs.packager,
            linker = ctx.attrs.linker,
            haddock = ctx.attrs.haddock,
            compiler_flags = ctx.attrs.compiler_flags,
            linker_flags = ctx.attrs.linker_flags,
        ),
        HaskellPlatformInfo(
            name = host_info().arch,
        ),
        HaskellToolchainLibrariesInfo(
            packages_by_name = packages_by_name,
            packages_by_id = packages_by_id,
        ),
    ]

_haskell_library_dep = attrs.dep(providers = [HaskellLibraryProvider])

haskell_toolchain = rule(
    impl = _haskell_toolchain,
    attrs = {
        "compiler": attrs.string(default = "ghc"),
        "compiler_flags": attrs.list(attrs.string(), default = []),
        "haddock": attrs.string(default = "haddock"),
        "linker": attrs.string(default = "ghc"),
        "linker_flags": attrs.list(attrs.string(), default = []),
        "packager": attrs.string(default = "ghc-pkg"),
        "packages": attrs.list(_haskell_library_dep, default = []),
    },
    is_toolchain_rule = True,
)
