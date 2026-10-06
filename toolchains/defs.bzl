load("ghcup/defs.bzl", "CabalDistributionInfo")

def _cabal_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    return ctx.attrs.distribution.providers

cabal_toolchain = rule(
    impl = _cabal_toolchain_impl,
    attrs = {
        "distribution": attrs.exec_dep(providers = [CabalDistributionInfo]),
    },
    is_toolchain_rule = True,
)
