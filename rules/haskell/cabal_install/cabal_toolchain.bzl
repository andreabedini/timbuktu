"""
The cabal-install the `plan` rule makes its plans with.
"""

load("//rules/haskell/ghcup:defs.bzl", "CabalDistributionInfo")

def _cabal_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    return ctx.attrs.distribution.providers

cabal_toolchain = rule(
    doc = "Use the cabal-install of a binary distribution, e.g. one from root//rules/haskell/ghcup.",
    impl = _cabal_toolchain_impl,
    attrs = {
        "distribution": attrs.exec_dep(providers = [CabalDistributionInfo]),
    },
    is_toolchain_rule = True,
)
