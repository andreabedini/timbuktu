# happy

[happy 2.2](https://hackage.haskell.org/package/happy-2.2), built from its
sdist: a transcription of `happy.cabal` without its test suite. The executable
is a thin layer over [`happy-lib`](../happy-lib), whose data files hold the
templates of the generated parsers.

```bash
$ buck2 run //examples/cabal_simple/happy:exe -- --version
```

It is a build tool of [`language-c`](../language-c).
