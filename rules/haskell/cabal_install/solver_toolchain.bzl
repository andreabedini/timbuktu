"""
cabal-solver-plan, which the `plan` rule makes its plans with, and the
Hackage index it reads.

cabal-solver-plan (https://github.com/andreabedini/cabal-solver-plan) runs
the solver of cabal-install on inputs given on the command line and prints
the plan as JSON (see interpret_plan.bzl for the format). It is not built
here: it is a program on this machine, like the GHC in PATH.
"""

CabalSolverPlanInfo = provider(
    # @unsorted-dict-items
    fields = {
        "tool": provider_field(RunInfo),
        # The package index (01-index.tar), None for the one `cabal update`
        # downloads, in the cabal directory of whoever runs the build.
        "index": provider_field(str | None),
    },
)

def _cabal_solver_plan_toolchain_impl(ctx: AnalysisContext) -> list[Provider]:
    return [
        DefaultInfo(),
        CabalSolverPlanInfo(
            tool = RunInfo(args = [ctx.attrs.path]),
            index = ctx.attrs.index or None,
        ),
    ]

cabal_solver_plan_toolchain = rule(
    doc = "cabal-solver-plan on this machine. Not hermetic.",
    impl = _cabal_solver_plan_toolchain_impl,
    attrs = {
        "index": attrs.string(default = ""),
        "path": attrs.string(default = "cabal-solver-plan"),
    },
    is_toolchain_rule = True,
)
