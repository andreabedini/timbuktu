# language-c

[language-c 0.10.2](https://hackage.haskell.org/package/language-c-0.10.2),
built from its sdist: a transcription of the library of `language-c.cabal`.
Its lexer (`.x`) and parser (`.y`) go through alex and happy, both built from
source (`build_tool_depends`).

```bash
$ buck2 build //examples/cabal_simple/language-c:lib
```

`language-c.cabal` has conditionals on two flags. They are resolved here for
the default values, and the fields that depend on them are marked in
[`BUCK`](BUCK) with the condition they come from. With a choice to make, a
`select` would take their place.

[`cparse`](../cparse) is a local package that uses this library.
