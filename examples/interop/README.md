# The prelude rules on top of cabal_simple

The Haskell rules of the buck2 prelude, depending on a library built by the
`cabal_simple` rules:

- `lib`, a `haskell_library` that uses the library of
  [`hello`](../cabal_simple/hello);
- `exe`, a `haskell_binary` that uses `lib`;
- `ghci`, `haddock` and `ide`, the `haskell_ghci`, `haskell_haddock` and
  `haskell_ide` rules on top of them;
- `count`, a `haskell_binary` that gets `base` and `containers` from
  `haskell_unit` targets instead of `toolchain_libs`.

```bash
$ buck2 run //examples/interop:exe
$ buck2 run //examples/interop:ghci
$ buck2 test //examples/interop:
$ sh examples/interop/tests/ide.sh
```

The tests load the library in GHCi, look at what haddock wrote, and run
`count`. `tests/ide.sh` is not a buck2 test, since it runs buck2 itself: it
asks `prelude//haskell/ide/ide.bxl` how to load `Report.hs`, as an IDE would,
and gives the answer to GHC.

A `cabal_simple` library hands the prelude the same providers a
`haskell_library` would (see
[`rules/haskell/cabal/prelude.bzl`](../../rules/haskell/cabal/prelude.bzl)).
The executables are linked with `link_style = "static"`: with the default
`shared` style the prelude leaves `-dynamic` out and the binary dies at run
time, unless `linker_flags` has it.
