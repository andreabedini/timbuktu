load(
    "@prelude//haskell:toolchain.bzl",
    "HaskellPlatformInfo",
    "HaskellToolchainInfo",
)
load(
    "common.bzl",
    "PackageConfTSet",
    "PackageInfo",
    "common_unit_attrs",
)

def _pre_existing_unit_impl(ctx: AnalysisContext) -> list[Provider]:
    return [
        DefaultInfo(),
        PackageInfo(
            unit_id = ctx.attrs.unit_id,
            pkg_name = ctx.attrs.pkg_name,
            package_conf = None,
            package_conf_tset = ctx.actions.tset(PackageConfTSet),
        ),
    ]

pre_existing_unit = rule(
    impl = _pre_existing_unit_impl,
    attrs = {
        "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell"),
    } | common_unit_attrs,
)
