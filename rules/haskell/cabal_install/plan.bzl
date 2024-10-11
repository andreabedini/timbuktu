"""
Macro to invoke cabal install to generate a build plan.
"""

def _make_plan(actions, project_file: Artifact, targets: list[str]) -> Artifact:
    builddir = actions.declare_output("dist-newstyle", dir = True)
    actions.run(
        cmd_args(
            "cabal",
            "build",
            "--dry-run",
            "-v3",
            cmd_args(builddir.as_output(), format = "--builddir={}"),
            cmd_args(project_file, format = "--project-file={}"),
            cmd_args(targets),
        ),
        category = "cabal_plan",
        local_only = True,
    )
    return builddir.project("cache/plan.json")

def _plan_impl(ctx: AnalysisContext) -> list[Provider]:
    plan_json = _make_plan(ctx.actions, ctx.attrs.project_file, ctx.attrs.targets)
    return [DefaultInfo(default_output = plan_json)]

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
