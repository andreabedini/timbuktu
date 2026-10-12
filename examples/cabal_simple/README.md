# The cabal_simple rules

Each of these packages is a `.cabal` file transcribed into targets, one per
component. The rules do what Cabal does for `build-type: Simple`, but call GHC
directly instead of going through `Setup.hs`, and each step is an action of
its own.

| `.cabal` | `BUCK` |
| --- | --- |
| the package fields (`name`, `version`, `data-files`, …) | `cabal_package`, with the source tree in `srcs`: a glob or an sdist |
| `library`, `library <name>` | `cabal_simple_library` (`library_name` for a sublibrary) |
| `executable <name>` | `cabal_simple_executable` (`executable_name`) |
| `test-suite <name>` | `cabal_simple_test` |
| a field, `hs-source-dirs` | the attribute of the same name with underscores, `hs_source_dirs` |
| `build-depends` | targets: another component, or a `haskell_unit` for a package that comes with the compiler |
| `build-tool-depends` | targets of executables |
| `if flag(...)`, `if os(...)` | `select`, or resolved by hand |

The rules are in [`rules/haskell/cabal`](../../rules/haskell/cabal); the
docstring of `simple.bzl` describes the steps. A field the rules know but do
not honour (`mixins`, `pkgconfig-depends`, …) fails the build rather than
being ignored.

To see the fields of a `.cabal` file as JSON while transcribing it:

```bash
$ buck2 run //rules/haskell/helpers:parse_fields -- path/to/pkg.cabal
```

The examples, from the simplest:

- [`hello`](hello): a local package with most of what a component can have;
- [`lexer`](lexer): `build-tool-depends` on alex;
- [`cparse`](cparse): depends on language-c from Hackage;
- [`alex`](alex), [`happy`](happy), [`happy-lib`](happy-lib),
  [`language-c`](language-c): packages from Hackage;
- [`ghc`](ghc): the libraries of the compiler, for the others to depend on.

```bash
$ buck2 build //examples/cabal_simple/...
$ buck2 test //examples/cabal_simple/...
```
