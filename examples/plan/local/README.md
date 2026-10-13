# A local package from a build plan

[`dice`](dice) is a package of this repository: a `.cabal` file and its
sources, as a project of your own would be. It needs `random` from Hackage.
The `BUCK` file here is the plan for it, made by `plan.bxl`:

```bash
$ buck2 bxl //rules/haskell/cabal_install/plan.bxl:generate -- \
    --local-package examples/plan/local/dice --buck-dir examples/plan/local \
    --index-state 2026-06-01T00:00:00Z
```

cabal-solver-plan plans for `dice` as for a package of a `cabal.project`,
and chooses `random` and `splitmix` from the index. The two parts of the
plan are built differently:

- `random` and `splitmix`, from their sdists, by their own `Setup.hs`, as
  in [`../shake`](../shake);
- `dice`, by the `cabal_simple` rules: `plan.bxl` runs `describe_package`
  on `dice.cabal` with the flags of the plan, and writes the targets the
  `.cabal` generator would, `dice-0.1.0.0` (the library) and
  `dice-0.1.0.0-exe-dice`, with the dependencies the plan gives them. What
  `dice.cabal` says the components depend on has to be what the plan says.

The sources of `dice` are a `glob` of its directory, so changing them needs
no new `BUCK` file; changing what it depends on (or its flags) does.

```bash
$ buck2 run //examples/plan/local:exe-dice
$ buck2 test //examples/plan/local/...
```

`dice` has no `BUCK` file of its own: the glob would stop there. The test is
in [`tests`](tests), since the `BUCK` file here is generated whole.
