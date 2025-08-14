"""
Rules for pre-existing units in the context of a cabal-install build-plan.
"""

load("common.bzl", "PackageConfTSet", "UnitInfo", "common_unit_attrs")

def _pre_existing_unit_impl(ctx: AnalysisContext) -> list[Provider]:
    # A pre-existing unit lives in the compiler's global package db, which
    # every unit is configured against, so there is nothing to build and no
    # package conf to pass on.
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
        {"lib_name": attrs.option(attrs.string(), default = None)},
)
