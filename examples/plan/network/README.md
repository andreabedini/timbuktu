# network from a build plan

[network 3.2.8.0](https://hackage.haskell.org/package/network-3.2.8.0) has
`build-type: Configure`: its `Setup.hs` runs a `./configure` script before
building, and Cabal cannot build it one component at a time. The plan
interpreter builds such a unit with `build_legacy.bzl`, in a single action
that runs every step of `Setup.hs`. Its `.hsc` files go through hsc2hs, which
is a unit of the plan too, built from source.

`socketpair` is a `haskell_binary` of the prelude that depends on the
network unit, and `socketpair-test` runs it.

```bash
$ buck2 run //examples/plan/network:socketpair
$ buck2 test //examples/plan/network:
```

The dependency names the unit by its id, which comes from the plan: it has to
be updated whenever the plan is made again. See [`../README.md`](../README.md).
