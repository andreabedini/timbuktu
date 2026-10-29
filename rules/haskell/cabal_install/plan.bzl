"""
Rule to make a build plan with cabal-solver-plan.

The plan is for the GHC of toolchains//:haskell and its global package db,
with the packages of a Hackage index up to `index_state`. Everything the
rules downstream need is in it, read off the index: which revision of each
cabal file, the checksums and sizes of the downloads. Making it reads the
index of this machine, so it is not hermetic; everything downstream is
pinned by checksum.

`solve` is the action, also run by plan.bxl, which writes the plan out as
targets, and by dynamic_plan. The `plan` rule is that action alone, to look
at a plan.
"""

load("//rules/haskell:toolchain.bzl", "GhcToolchainInfo")
load(":solver_toolchain.bzl", "CabalSolverPlanInfo")

def solve(
        actions: AnalysisActions,
        solver: CabalSolverPlanInfo,
        ghc: GhcToolchainInfo,
        attrs: typing.Any) -> Artifact:
    """Run cabal-solver-plan.

    Args:
      actions: where to declare the action
      solver: the solver and the index
      ghc: the compiler to plan for
      attrs: the attributes of the `plan` rule: targets, index_state,
        constraints, flags, args; and, from plan.bxl, `local_packages`, a
        list of struct(path, cabal): the directory of a local package,
        relative to the root of the repository, and its .cabal file
    Returns:
      the plan, in JSON
    """
    out = actions.declare_output("plan.json")
    local_packages = getattr(attrs, "local_packages", [])
    index = solver.index or "${XDG_CACHE_HOME:-$HOME/.cache}/cabal/packages/hackage.haskell.org/01-index.tar"
    cmd = cmd_args(
        solver.tool,
        cmd_args(ghc.ghc, format = "--with-ghc={}"),
        "--use-global-packagedb",
        '--index="{}"'.format(index),
        "--index-state=" + attrs.index_state,
        "--json",
        ["--constraint='{}'".format(c) for c in attrs.constraints],
        ["--flag='{}:{}'".format(pkg, flags) for pkg, flags in attrs.flags.items()],
        attrs.args,
        ["--local-package {}".format(local.path or ".") for local in local_packages],
        attrs.targets,
        ">",
        out.as_output(),
        delimiter = " ",
    )
    actions.run(
        # NOTE: the solver reads the .cabal files of the local packages
        # itself; they are inputs so that a change makes a new plan.
        cmd_args("sh", "-c", cmd, hidden = [local.cabal for local in local_packages]),
        category = "cabal_solver_plan",
        # It reads the package index of this machine.
        local_only = True,
    )
    return out

def _plan_impl(ctx: AnalysisContext) -> list[Provider]:
    out = solve(ctx.actions, ctx.attrs._solver[CabalSolverPlanInfo], ctx.attrs._ghc[GhcToolchainInfo], ctx.attrs)
    return [DefaultInfo(default_output = out)]

# What a plan is made of, for the rules that make one.
plan_attrs = {
    "targets": attrs.list(attrs.string(), doc = "The packages to plan for."),
    "index_state": attrs.string(doc = "Packages uploaded after this time are left out, e.g. 2026-06-01T00:00:00Z."),
    "constraints": attrs.list(attrs.string(), default = [], doc = "As in cabal.project, e.g. `aeson >= 2.2`."),
    "flags": attrs.dict(attrs.string(), attrs.string(), default = {}, doc = "Flags by package, e.g. {\"aeson\": \"-ordered-keymap\"}."),
    "args": attrs.list(attrs.arg(), default = [], doc = "More options for cabal-solver-plan."),
    "_ghc": attrs.toolchain_dep(default = "toolchains//:haskell", providers = [GhcToolchainInfo]),
    "_solver": attrs.toolchain_dep(default = "toolchains//:cabal-solver-plan", providers = [CabalSolverPlanInfo]),
}

plan = rule(
    impl = _plan_impl,
    attrs = plan_attrs,
)
