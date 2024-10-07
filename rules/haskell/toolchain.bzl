load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//haskell/library_info.bzl", "HaskellLibraryProvider")
load("@prelude//linking:link_info.bzl", "LinkStyle")

HaskellToolchainLibraries = provider(fields = {
    "packages_by_name": provider_field(dict[str, Dependency]),
    "packages_by_id": provider_field(dict[str, Dependency]),
})

def _haskell_toolchain_library(_ctx: AnalysisContext) -> list[Provider]:
    packages = _ctx.attrs._haskell_toolchain[HaskellToolchainLibraries].packages_by_name
    return packages.get(_ctx.label.name).providers

haskell_toolchain_library = rule(
    impl = _haskell_toolchain_library,
    attrs = {
        "_haskell_toolchain": attrs.toolchain_dep(
            providers = [HaskellToolchainInfo, HaskellToolchainLibraries],
            default = "@toolchains//:haskell",
        ),
    },
)

def _haskell_toolchain(_ctx: AnalysisContext) -> list[Provider]:
    #
    # build an index of installed packages
    #

    packages_by_name = {}
    packages_by_id = {}

    # The link style is irrelevant but I have to go around the existing design
    # of the prelude
    linkStyle = LinkStyle("static")
    for p in _ctx.attrs.packages:
        hli = p[HaskellLibraryProvider].lib[linkStyle]
        packages_by_name[hli.name] = p
        packages_by_id[hli.id] = p

    return [
        DefaultInfo(),
        HaskellToolchainInfo(
            compiler = _ctx.attrs.compiler,
            packager = _ctx.attrs.packager,
            linker = _ctx.attrs.linker,
            haddock = _ctx.attrs.haddock,
            compiler_flags = _ctx.attrs.compiler_flags,
            linker_flags = _ctx.attrs.linker_flags,
        ),
        HaskellPlatformInfo(
            name = host_info().arch,
        ),
        HaskellToolchainLibraries(
            packages_by_name = packages_by_name,
            packages_by_id = packages_by_id,
        ),
    ]

_haskell_library_dep = attrs.dep(providers = [HaskellLibraryProvider])

haskell_toolchain = rule(
    impl = _haskell_toolchain,
    attrs = {
        "compiler": attrs.string(default = "ghc"),
        "packager": attrs.string(default = "ghc-pkg"),
        "linker": attrs.string(default = "ghc"),
        "haddock": attrs.string(default = "haddock"),
        "compiler_flags": attrs.list(attrs.string(), default = []),
        "linker_flags": attrs.list(attrs.string(), default = []),
        "packages": attrs.list(_haskell_library_dep, default = []),
    },
    is_toolchain_rule = True,
)
