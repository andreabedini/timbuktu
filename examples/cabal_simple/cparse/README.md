# cparse

A local executable that depends on a library from Hackage:
[`language-c`](../language-c), which in turn needs alex and happy to build. It
parses a line of C and prints it back.

```bash
$ buck2 run //examples/cabal_simple/cparse:exe
```

[`cparse.cabal`](cparse.cabal) says `build-depends: base, language-c`; in
[`BUCK`](BUCK) these are the targets `//examples/cabal_simple/ghc:base` and
`//examples/cabal_simple/language-c:lib`. Nothing chooses versions: the
dependency is whatever that target builds.
