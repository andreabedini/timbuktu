# Build plans made at build time

The plans of [`../shake`](../shake) and [`../network`](../network), with
nothing pasted into a `BUCK` file. A `dynamic_plan` target runs
cabal-solver-plan as one of its actions, reads the plan in a dynamic action,
and builds every unit of it there:

```python
dynamic_plan(
    name = "shake",
    targets = ["shake"],
    index_state = "2026-06-01T00:00:00Z",
    executables = ["shake"],
)
```

```bash
$ buck2 run '//examples/plan/dynamic:shake[shake]' -- --version
$ buck2 build //examples/plan/dynamic:network
$ buck2 test //examples/plan/dynamic:
```

A new index-state or another target is a change of attribute, and the plan
is made again whenever its inputs change. The units are built the same way
as those of an interpreted plan, by the same code (`setup.bzl`): `network`
goes through its own `Setup.hs`, compiled in the dynamic action, with
hsc2hs from the plan.

What it costs: the units are not targets. Nothing can depend on one of its
libraries, and what the target offers is

- `[<name>]` for each of `executables`, an executable of the plan's
  targets, which `buck2 run` can run;
- `[plan.json]`, the plan it made;
- its default output, `units.txt`: a line for each unit built, with where
  it was installed, which takes building all of them.

Like `plan`, it needs cabal-solver-plan and a Hackage index; see
[`../README.md`](../README.md).
