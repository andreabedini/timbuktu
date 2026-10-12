# lexer

A library with an alex lexer, `src/Lexer.x`, and an executable that uses it.
The library has `build-tool-depends: alex:alex`; in [`BUCK`](BUCK) that is
`build_tool_depends = ["//examples/cabal_simple/alex:exe"]`, so alex itself is
built from its sdist first (see [`../alex`](../alex)) and put in `PATH` when
the `.x` file is preprocessed.

```bash
$ buck2 run //examples/cabal_simple/lexer:exe
```

[`lexer.cabal`](lexer.cabal) is the package description `BUCK` transcribes.
