"""
Rules for pre-existing units in the context of a cabal-install build-plan.
"""

load("//rules/haskell/toolchain.bzl", "HaskellToolchainLibrariesInfo")
load("common.bzl", "PackageConfTSet", "UnitInfo", "common_unit_attrs", "haskell_toolchain_attrs")

def _pre_existing_unit_impl(ctx: AnalysisContext) -> list[Provider]:
    toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainLibrariesInfo]
    providers = toolchain.packages_by_id[ctx.attrs.unit_id].providers
    providers.append(
        UnitInfo(
            id = ctx.attrs.unit_id,
            name = ctx.attrs.pkg_name,
            version = ctx.attrs.pkg_version,
            lib_name = ctx.attrs.lib_name,
            package_conf = None,
            package_conf_tset = ctx.actions.tset(PackageConfTSet),
        ),
    )
    return providers

pre_existing_unit = rule(
    impl = _pre_existing_unit_impl,
    attrs =
        common_unit_attrs |
        haskell_toolchain_attrs |
        {"lib_name": attrs.option(attrs.string(), default = None)},
)
