"""
Rule to generate a plan
"""

load("@prelude//haskell:toolchain.bzl", "HaskellToolchainInfo")

def _plan_impl(ctx: AnalysisContext) -> list[Provider]:
    builddir = ctx.actions.declare_output("dist-newstyle", dir = True)
    cabal = ctx.attrs._cabal_toolchain[RunInfo]
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
    ctx.actions.run(
        cmd_args(
            cabal,
            "build",
            "-v",
            "--dry-run",
            cmd_args(haskell_toolchain.compiler, format = "--with-compiler={}"),
            cmd_args(builddir.as_output(), format = "--builddir={}"),
            cmd_args(ctx.attrs.project_file, format = "--project-file={}"),
            ctx.attrs.args,
            cmd_args(ctx.attrs.targets),
        ),
        category = "cabal_plan",
    )
    return [DefaultInfo(default_output = builddir.project("cache/plan.json"))]

plan = rule(
    impl = _plan_impl,
    attrs = {
        "project_file": attrs.source(doc = "The project file to use."),
        "targets": attrs.list(
            attrs.string(),
            default = ["all"],
            doc = "The targets to build.",
        ),
        "args": attrs.list(
            attrs.arg(),
            default = [],
            doc = "Additional arguments to pass to cabal-install",
        ),
        "_cabal_toolchain": attrs.toolchain_dep(default = "toolchains//:cabal"),
        "_haskell_toolchain": attrs.toolchain_dep(
            default = "toolchains//:haskell",
            providers = [HaskellToolchainInfo],
        ),
    },
)
