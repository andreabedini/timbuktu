# Build plans

cabal-install solves the dependencies, buck2 builds the result. Each
directory here is a small cabal project:

- `cabal.project` pins the Hackage index (`index-state`) and names the
  package to build (`extra-packages`);
- `BUCK` has a `plan` target and an `interpret_plan(...)` call with the plan
  pasted in.

`interpret_plan` makes one target per unit of the plan, named after its
unit-id:

- a unit that comes with the compiler (`"type": "pre-existing"`) becomes a
  `haskell_unit`;
- every other unit gets its sdist from Hackage, with the revision of the
  `.cabal` file the plan was made with, and is built by the package's own
  `Setup.hs`, with `--exact-configuration` and each dependency given by
  unit-id. A unit with `build-type: Simple` is configured, built, copied and
  registered by separate actions (`build.bzl`); any other build type does all
  of it in one action (`build_legacy.bzl`).

```bash
$ buck2 targets //examples/plan/shake:      # one target per unit
```

The rules are in [`rules/haskell/cabal_install`](../../rules/haskell/cabal_install).

## Making a plan

```bash
$ buck2 build //examples/plan/shake:plan --show-output
```

runs `cabal build --dry-run` with the toolchain's GHC and cabal-install, then
looks up on Hackage which revision of each `.cabal` file the plan uses and how
big it is, and adds both to the plan. This needs the Hackage index of your
cabal directory (`cabal update`), `curl`, `jq` and network access: it is the
only step that is not hermetic. To update the example, replace the JSON inside
`interpret_plan(...)` with the `plan.json` it printed.

A plan is made for one compiler (`compiler-id`) and names the units of its
global package db: it only builds with the toolchain it was made with, the
downloaded GHC 9.12.2.

## Using a unit from the prelude rules

A library unit can be a dependency of a prelude `haskell_binary` or
`haskell_library`, as in [`network`](network). Link with
`link_style = "static"` (or `"static_pic"`); with the default `shared` style
the prelude forgets `-dynamic` and the binary dies at run time, unless
`linker_flags` has it.
