load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")

HaskellToolchainLibraries = provider(fields = {
    "packages": provider_field(
        dict[str, Dependency],
    ),
})

def _haskell_toolchain_library(_ctx: AnalysisContext) -> list[Provider]:
    packages = _ctx.attrs._haskell_toolchain[HaskellToolchainLibraries].packages
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
            packages = _ctx.attrs.packages,
        ),
    ]

haskell_toolchain = rule(
    impl = _haskell_toolchain,
    attrs = {
        "compiler": attrs.string(default = "ghc"),
        "packager": attrs.string(default = "ghc-pkg"),
        "linker": attrs.string(default = "ghc"),
        "haddock": attrs.string(default = "haddock"),
        "compiler_flags": attrs.list(attrs.string(), default = []),
        "linker_flags": attrs.list(attrs.string(), default = []),
        "packages": attrs.dict(attrs.string(), attrs.dep(), default = {}),
    },
    is_toolchain_rule = True,
)
