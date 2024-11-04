CabalToolchainInfo = provider(
    doc = "Where is cabal?",
    fields = {
        "path": provider_field(str),
        # "cabal-install-version": provider_field(str),
        # "Cabal-version": provider_field(str),
    },
)

def _cabal_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    return [CabalToolchainInfo(path = ctx.attrs.path)]

cabal_toolchain = rule(
    impl = _cabal_toolchain_impl,
    attrs = {
        "path": attrs.string(),
        # "cabal-install-version": attrs.string(),
        # "Cabal-version": attrs.string(),
    },
)
