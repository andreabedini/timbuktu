# Build plans

A solver chooses the packages, buck2 builds them. The `BUCK` files of
[`shake`](shake) and [`network`](network) are build plans written out as
targets by `rules/haskell/cabal_install/plan.bxl`; nothing in them is
written by hand.

The plans are made by
[cabal-solver-plan](https://github.com/andreabedini/cabal-solver-plan),
which runs the solver of cabal-install on explicit inputs: the GHC of
`toolchains//:haskell` with its global package db, and a Hackage index
(`01-index.tar`) read up to the index-state. It prints the plan as JSON, with
everything the rules need: each package's sdist and its checksum and size,
which revision of its `.cabal` file to use, and each unit with its flags and
dependencies.

The BXL script writes a target for each entry of the plan:

- each package, `<name>-<version>-src`: its sdist from Hackage, with the
  revision of its `.cabal` file (`repo_package`);
- each unit that comes with the compiler: a `haskell_unit`, named after its
  unit-id;
- each unit to build, `<name>-<version>` for a main library or a whole
  package, `<name>-<version>-<kind>-<component>` for another component
  (`shake-0.19.9-exe-shake`), built from its sdist by the package's own
  `Setup.hs`, with `--exact-configuration` and each dependency given by
  unit-id. A unit of a package with `build-type: Simple` is one
  component (`build`), configured, built, copied and registered by separate
  actions; a package of any other build type is one unit (`build_legacy`),
  built in a single action by its `Setup.hs`, itself a target
  (`<name>-<version>-setup`); see `setup.bzl` in
  `rules/haskell/cabal_install`. The plan gives a unit to build no unit-id:
  the rule makes one up from the target's label, as the `cabal_simple`
  rules do (`rules/haskell/unit_id.bzl`);
- for each unit the plan was made for, an alias: the package name for its
  library (`:network`), `<kind>-<name>` for another component
  (`:exe-shake`).

```bash
$ buck2 targets //examples/plan/shake:      # one target per unit
$ buck2 run //examples/plan/shake:exe-shake -- --version
```

[`dynamic`](dynamic) makes and builds the same plans at build time, with no
plan written anywhere, at the cost of the units not being targets.

The rules are in [`rules/haskell/cabal_install`](../../rules/haskell/cabal_install).

## Making a plan

cabal-solver-plan is not built here, and has to be one that prints format 2
of its plans (a dependency graph whose units are numbered; what each unit is
called, and its unit-id, is up to the rules). Install it, or tell buck2 where it is,
and where the Hackage index is if it is not the one `cabal update`
downloads, in `.buckconfig.local`:

```ini
[haskell]
  cabal_solver_plan = /path/to/cabal-solver-plan
  hackage_index = /path/to/01-index.tar
```

Then

```bash
$ buck2 bxl //rules/haskell/cabal_install/plan.bxl:generate -- --target shake --index-state 2026-06-01T00:00:00Z
```

makes the plan and prints the path of a `BUCK` file with its targets: copy
it into a directory of its own. `--constraint` and `--flag` are those of
`cabal.project`, `--target` can be repeated, and `--plan-file` writes out a
plan made before. The first lines of each `BUCK` file here say how it was
made, which is also how to make it again (with a later index-state, say).
Nothing else reads the network or the index: everything downstream is pinned
by checksum.

A `BUCK` file made this way can be edited like any other, but the next one
made for the same plan will not have the changes. Targets that use the
units of a plan go in another package, as in [`network`](network).

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
executable. A unit's dependencies are those of the plan, though: putting a
`cabal_simple` library in place of one of them means changing the `deps` of
the unit's target in the `BUCK` file the plan was written to.

A library unit can also be a dependency of a prelude `haskell_binary` or
`haskell_library`, as in [`network/socketpair`](network/socketpair). Link with
`link_style = "static"` (or `"static_pic"`); with the default `shared` style
the prelude forgets `-dynamic` and the binary dies at run time, unless
`linker_flags` has it.
