"""
The rule for a unit of build-type Simple, one component at a time.
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
load("setup.bzl", "build_component")

def _build_impl(ctx: AnalysisContext) -> list[Provider]:
    # WARN: What a library unit hands to the prelude's Haskell rules is in
    # mkProviders. It is not all they expect: the libraries of the units that
    # come from the global package db are missing.
    built = build_component(
        setup_env(ctx),
        setup_unit(ctx, ctx.attrs.component_name),
        ctx.attrs.src[CabalPackageInfo].srcdir,
        ctx.attrs.setup[RunInfo],
        [dep[CabalLibraryInfo] for dep in ctx.attrs.deps],
        [dep[CabalExecutableInfo] for dep in ctx.attrs.exec_deps],
    )

    providers = [
        DefaultInfo(
            default_outputs = [built.installdirs.prefix] + ([built.package_conf] if built.package_conf else []),
        ),
    ]

    if built.library:
        providers.append(built.library)
        providers.extend(mkProviders(ctx, built.package_db, built.installdirs))

    if built.executable:
        providers.append(RunInfo(args = built.executable.exe))
        providers.append(built.executable)

    return providers

build = rule(
    doc = "One component of a package with `build-type: Simple`, built with Setup.hs (see setup.bzl).",
    impl = _build_impl,
    attrs =
        common_unit_attrs |
        source_unit_attrs |
        {
            "component_name": attrs.string(),
            "setup": attrs.dep(
                default = "//rules/haskell/cabal_install/helpers:setup_simple",
                providers = [RunInfo],
            ),
        },
)
