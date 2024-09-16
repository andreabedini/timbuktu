load(
  "@prelude//haskell:toolchain.bzl",
  "HaskellToolchainInfo",
  "HaskellPlatformInfo"
)

load(
  "common.bzl",
  "PackageConfTSet",
  "PackageInfo",
  "basic_unit",
)


def _pre_existing_unit_impl(ctx : AnalysisContext) -> list[Provider]:
  return [
    DefaultInfo(),
    PackageInfo(
      unit_id = ctx.attrs.unit_id,
      pkg_name = ctx.attrs.pkg_name,
      package_conf = None,
      package_conf_tset = ctx.actions.tset(PackageConfTSet)
    )
  ]

pre_existing_unit = rule(
  impl = _pre_existing_unit_impl,
  attrs = {
    "_haskell_toolchain": attrs.toolchain_dep(default = "toolchains//:haskell", providers = [HaskellToolchainInfo, HaskellPlatformInfo])
  } | basic_unit
)
