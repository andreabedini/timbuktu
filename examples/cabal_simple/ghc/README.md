# The libraries of the compiler

`base`, `containers` and the other packages that come with GHC, one
`haskell_unit` target each, for the other examples to depend on:

```python
build_depends = ["//examples/cabal_simple/ghc:base"]
```

A `haskell_unit` builds nothing: it finds the unit in the compiler's global
package db by the name of its package, so which version one gets depends on
the toolchain. A package can also declare the ones it needs next to its own
targets, as [`hello`](../hello) does.
