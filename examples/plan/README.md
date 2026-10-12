# Build plans

A solver chooses the packages, buck2 builds them. Each directory here has a
`BUCK` with:

- a `plan` target: which packages to plan for and the Hackage index-state to
  plan with;
- an `interpret_plan(...)` call with the output of that target pasted in.

The plans are made by
[cabal-solver-plan](https://github.com/andreabedini/cabal-solver-plan),
which runs the solver of cabal-install on explicit inputs: the GHC of
`toolchains//:haskell` with its global package db, and a Hackage index
(`01-index.tar`) read up to the index-state. It prints the plan as JSON, with
everything the rules need: each package's sdist and its checksum and size,
which revision of its `.cabal` file to use, and each unit with its flags and
dependencies.

`interpret_plan` makes a target for each entry of the plan:

- each package, `<name>-<version>`: its sdist from Hackage, with the
  revision of its `.cabal` file;
- each unit that comes with the compiler: a `haskell_unit`, named after its
  unit-id;
- each unit to build, named after its unit-id, built from its sdist by the
  package's own `Setup.hs`, with `--exact-configuration` and each dependency
  given by unit-id. A unit of a package with `build-type: Simple` is one
  component, configured, built, copied and registered by separate actions;
  a package of any other build type is one unit, built in a single action
  (`setup.bzl` in `rules/haskell/cabal_install`);
- for each unit the plan was made for, an alias: the package name for its
  library (`:network`), `<kind>-<name>` for another component
  (`:exe-shake`).

```bash
$ buck2 targets //examples/plan/shake:      # one target per unit
$ buck2 run //examples/plan/shake:exe-shake -- --version
```

[`dynamic`](dynamic) makes and builds the same plans at build time, with no
plan pasted anywhere, at the cost of the units not being targets.

The rules are in [`rules/haskell/cabal_install`](../../rules/haskell/cabal_install).

## Making a plan

cabal-solver-plan is not built here. Install it, or tell buck2 where it is,
and where the Hackage index is if it is not the one `cabal update`
downloads, in `.buckconfig.local`:

```ini
[haskell]
  cabal_solver_plan = /path/to/cabal-solver-plan
  hackage_index = /path/to/01-index.tar
```

Then

```bash
$ buck2 build //examples/plan/shake:plan --show-output
```

prints where the plan is. To update an example, replace the JSON inside
`interpret_plan(...)` with it. Nothing else reads the network or the index:
everything downstream is pinned by checksum.

A plan is made for one compiler (`compiler-id`) and names the units of its
global package db: it only builds with the toolchain it was made with, the
downloaded GHC 9.12.2.

Not supported: packages that use Backpack (cabal-solver-plan refuses to
plan for them), local packages, and a whole-package unit's executables as
build tools of another unit.

## Using a unit elsewhere

A unit hands its dependents the same providers as a library or an executable
of the `cabal_simple` rules (`rules/haskell/providers.bzl`): a library unit
can be in the `build_depends` of a `cabal_simple` component, an executable
unit in its `build_tool_depends`, and the other way round a unit built by
`Setup.hs` can depend on a `cabal_simple` library or use a `cabal_simple`
executable. `interpret_plan` always takes a unit's dependencies from the
plan, though: putting a `cabal_simple` library in place of one of them means
writing the unit's `build` target by hand.

A library unit can also be a dependency of a prelude `haskell_binary` or
`haskell_library`, as in [`network`](network). Link with
`link_style = "static"` (or `"static_pic"`); with the default `shared` style
the prelude forgets `-dynamic` and the binary dies at run time, unless
`linker_flags` has it.
