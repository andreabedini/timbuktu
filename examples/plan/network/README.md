# network from a build plan

[network 3.2.8.0](https://hackage.haskell.org/package/network-3.2.8.0) has
`build-type: Configure`: its `Setup.hs` runs a `./configure` script before
building, and Cabal cannot build it one component at a time. The plan
interpreter builds such a unit with `build_legacy.bzl`, in a single action
that runs every step of `Setup.hs`. Its `.hsc` files go through hsc2hs, which
is a unit of the plan too, built from source.

The network unit is a library like any other to the rest of the
repository. Two programs in [`socketpair`](socketpair) use it:

- `socketpair`, a `haskell_binary` of the prelude;
- `socketpair-simple`, the same `Main.hs` as a `cabal_simple_executable`,
  which takes `base` and `bytestring` from the plan's units of the compiler
  too.

```bash
$ buck2 run //examples/plan/network/socketpair:socketpair
$ buck2 run //examples/plan/network/socketpair:socketpair-simple
$ buck2 test //examples/plan/network/...
```

Both depend on `//examples/plan/network:network`, the alias the plan makes
for its target, so they need no change when the plan is made again; they are
in a package of their own because `BUCK` here is made by the plan generator.
The `cabal_simple` executable also names the plan's units of `base` and
`bytestring` by unit-id, which changes only with the compiler. See
[`../README.md`](../README.md).
