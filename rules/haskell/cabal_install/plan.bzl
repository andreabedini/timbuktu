"""
Rule to make a build plan with cabal-solver-plan.

The plan is for the GHC of toolchains//:haskell and its global package db,
with the packages of a Hackage index up to `index_state`. Everything the
rules downstream need is in it, read off the index: which revision of each
cabal file, the checksums and sizes of the downloads. Making it reads the
index of this machine, so it is not hermetic; everything downstream is
pinned by checksum.
"""

load("//rules/haskell:toolchain.bzl", "GhcToolchainInfo")
load(":solver_toolchain.bzl", "CabalSolverPlanInfo")

def _plan_impl(ctx: AnalysisContext) -> list[Provider]:
    solver = ctx.attrs._solver[CabalSolverPlanInfo]
    ghc = ctx.attrs._ghc[GhcToolchainInfo]
    out = ctx.actions.declare_output("plan.json")

    index = solver.index or "${XDG_CACHE_HOME:-$HOME/.cache}/cabal/packages/hackage.haskell.org/01-index.tar"
    cmd = cmd_args(
        solver.tool,
        cmd_args(ghc.ghc, format = "--with-ghc={}"),
        "--use-global-packagedb",
        '--index="{}"'.format(index),
        "--index-state=" + ctx.attrs.index_state,
        "--json",
        ["--constraint='{}'".format(c) for c in ctx.attrs.constraints],
        ["--flag='{}:{}'".format(pkg, flags) for pkg, flags in ctx.attrs.flags.items()],
        ctx.attrs.args,
        ctx.attrs.targets,
        ">",
        out.as_output(),
        delimiter = " ",
    )
    ctx.actions.run(
        cmd_args("sh", "-c", cmd),
        category = "cabal_solver_plan",
        # It reads the package index of this machine.
        local_only = True,
    )
    return [DefaultInfo(default_output = out)]

plan = rule(
    impl = _plan_impl,
    # @unsorted-dict-items
    attrs = {
        "targets": attrs.list(attrs.string(), doc = "The packages to plan for."),
        "index_state": attrs.string(doc = "Packages uploaded after this time are left out, e.g. 2026-06-01T00:00:00Z."),
        "constraints": attrs.list(attrs.string(), default = [], doc = "As in cabal.project, e.g. `aeson >= 2.2`."),
        "flags": attrs.dict(attrs.string(), attrs.string(), default = {}, doc = "Flags by package, e.g. {\"aeson\": \"-ordered-keymap\"}."),
        "args": attrs.list(attrs.arg(), default = [], doc = "More options for cabal-solver-plan."),
        "_ghc": attrs.toolchain_dep(default = "toolchains//:haskell", providers = [GhcToolchainInfo]),
        "_solver": attrs.toolchain_dep(default = "toolchains//:cabal-solver-plan", providers = [CabalSolverPlanInfo]),
    },
)
