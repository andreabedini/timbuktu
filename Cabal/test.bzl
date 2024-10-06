def _test_impl(ctx: AnalysisContext) -> list[Provider]:
    return [DefaultInfo()]

test = rule(
    impl = _test_impl,
    attrs = {
        "cabalfile": attrs.source(),
    },
)
