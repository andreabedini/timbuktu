
def _cabal_project_plan_impl(ctx: AnalysisContext) -> list[Provider]:
  builddir = ctx.actions.declare_output("dist-newstyle", dir = True)
  ctx.actions.run(
    [
      "cabal", "build", "--dry-run",
      "--project-file", ctx.attrs.project_file,
      "--builddir", builddir.as_output(),
    ],
    ctx.attrs.targets,
    category = "planning"
  )
  planjson = builddir.project("cache/plan.json")
  return [DefaultInfo(default_output = planjson)]

cabal_project_plan = rule(
  impl = _cabal_project_plan_impl,
  attrs = {
    "project_file": attrs.string(default = "cabal.project"),
    "targets": attrs.list(attrs.string(), default = ["all"]),
  },
)
