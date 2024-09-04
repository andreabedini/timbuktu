load(
  "common.bzl",
  "PackageInfo",
  "PackageDb",
  "basic_unit",
)


def _pre_existing_unit_impl(ctx : AnalysisContext) -> list[Provider]:
  return [
    DefaultInfo(),
    PackageInfo(
      unit_id = ctx.attrs.unit_id,
      pkg_name = ctx.attrs.pkg_name,
      package_db = ctx.actions.tset(PackageDb),
    )
  ]

pre_existing_unit = rule(
  impl = _pre_existing_unit_impl,
  attrs = basic_unit
)
