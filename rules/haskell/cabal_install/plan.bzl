"""
Macro to invoke cabal install to generate a build plan.
"""

def _plan_impl(ctx: AnalysisContext) -> list[Provider]:
    plan_json = ctx.actions.declare_output("dist-newstyle/cache/plan.json")

    ctx.actions.run(
        cmd_args(
            "cabal",
            "new-build",
            "--dry-run",
            cmd_args(plan_json.as_output(), format = "--builddir={}", parent = 2),
            cmd_args(ctx.attrs.project_file, format = "--project-file={}"),
            cmd_args(ctx.attrs.targets),
        ),
        category = "cabal_plan",
    )

    return [
        DefaultInfo(default_output = plan_json),
    ]

plan = rule(
    impl = _plan_impl,
    attrs = {
        "project_file": attrs.source(doc = "The project file to use."),
        "targets": attrs.list(
            attrs.string(),
            default = ["all"],
            doc = "The targets to build.",
        ),
    },
)
