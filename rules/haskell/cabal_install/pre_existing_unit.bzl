load(
    "@prelude//haskell:toolchain.bzl",
    "HaskellPlatformInfo",
    "HaskellToolchainInfo",
)
load(
    "common.bzl",
    "PackageConfTSet",
    "UnitInfo",
    "common_unit_attrs",
)

def _pre_existing_unit_impl(ctx: AnalysisContext) -> list[Provider]:
    return [
        DefaultInfo(),
        UnitInfo(
            id = ctx.attrs.unit_id,
            name = ctx.attrs.pkg_name,
            version = ctx.attrs.pkg_version,
            lib_name = ctx.attrs.lib_name,
            package_conf = None,
            package_conf_tset = ctx.actions.tset(PackageConfTSet),
        ),
    ]

pre_existing_unit = rule(
    impl = _pre_existing_unit_impl,
    attrs =
        common_unit_attrs |
        {"lib_name": attrs.option(attrs.string(), default = None)} |
        {"_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell")},
)
