# alex

[alex 3.5.1.0](https://hackage.haskell.org/package/alex-3.5.1.0), built from
its sdist: `hackage_package` downloads and unpacks it, and the
`cabal_package` takes the unpacked directory as its source tree. The targets
below it are a transcription of the `executable alex` stanza of `alex.cabal`
(the test suite is left out).

```bash
$ buck2 run //examples/cabal_simple/alex:exe -- --version
```

alex reads its templates from its data files at run time. Like Cabal, the
rules give it a `Paths_alex` module and, when it runs as a build tool of
another component (see [`../lexer`](../lexer)), an `alex_datadir` that points
at them.

To look at the package description while transcribing it:

```bash
$ buck2 run //rules/haskell/helpers:parse_fields -- \
    $(buck2 build //examples/cabal_simple/alex:alex-3.5.1.0 --show-full-output | cut -d' ' -f2)/alex.cabal
```

The same package is built with the prelude rules in
[`../../prelude/alex`](../../prelude/alex).
