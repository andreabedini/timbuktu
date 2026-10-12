# network from a build plan

[network 3.2.8.0](https://hackage.haskell.org/package/network-3.2.8.0) has
`build-type: Configure`: its `Setup.hs` runs a `./configure` script before
building, and Cabal cannot build it one component at a time. The plan
interpreter builds such a unit with `build_legacy.bzl`, in a single action
that runs every step of `Setup.hs`. Its `.hsc` files go through hsc2hs, which
is a unit of the plan too, built from source.

The network unit is a library like any other to the rest of the
repository. Two programs use it:

- `socketpair`, a `haskell_binary` of the prelude;
- `socketpair-simple`, the same `Main.hs` as a `cabal_simple_executable`,
  which takes `base` and `bytestring` from the plan's units of the compiler
  too.

```bash
$ buck2 run //examples/plan/network:socketpair
$ buck2 run //examples/plan/network:socketpair-simple
$ buck2 test //examples/plan/network:
```

Both name the unit by its id, which comes from the plan: they have to be
updated whenever the plan is made again. See [`../README.md`](../README.md).
