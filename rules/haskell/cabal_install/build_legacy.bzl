"""
The rule for a unit of any build type other than Simple: a whole package.
"""

load("//rules/haskell:providers.bzl", "CabalExecutableInfo", "CabalLibraryInfo")
load(
    "common.bzl",
    "CabalPackageInfo",
    "common_unit_attrs",
    "mkProviders",
    "setup_env",
    "setup_unit",
    "source_unit_attrs",
)
load("setup.bzl", "build_package")

def _build_legacy_impl(ctx: AnalysisContext) -> list[Provider]:
    built = build_package(
        setup_env(ctx),
        setup_unit(ctx, None),
        ctx.attrs.src[CabalPackageInfo].srcdir,
        ctx.attrs.setup[RunInfo],
        [dep[CabalLibraryInfo] for dep in ctx.attrs.deps],
        [dep[CabalExecutableInfo] for dep in ctx.attrs.exec_deps],
    )
    return [
        DefaultInfo(default_outputs = [built.installdirs.prefix, built.package_conf]),
        built.library,
    ] + mkProviders(ctx, built.package_db, built.installdirs)

build_legacy = rule(
    doc = "A whole package of a build type other than Simple, built with its own Setup.hs (see setup.bzl).",
    impl = _build_legacy_impl,
    attrs =
        common_unit_attrs |
        source_unit_attrs |
        {"setup": attrs.dep(providers = [RunInfo])},
)
