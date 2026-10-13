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
| a field, `hs-source-dirs` | the attribute of the same name with underscores, `hs_source_dirs` (`visibility` of a library is `library_visibility`) |
| `build-depends` | targets: another component, a `haskell_unit` for a package that comes with the compiler, or a library unit of a [build plan](../plan) |
| `build-tool-depends` | targets of executables, of these rules or of a build plan |
| `if flag(...)`, `if os(...)` | `select`, or resolved by hand |

The rules are in [`rules/haskell/cabal`](../../rules/haskell/cabal); the
docstring of `simple.bzl` describes the steps.
[`fields.bzl`](../../rules/haskell/cabal/fields.bzl) lists every field of
Cabal 3.14 and what the rules make of it: a field they know but do not honour
(`mixins`, `pkgconfig-depends`, …) fails the build rather than being ignored,
and so does a `cabal-version` newer than 3.14.

## Generating the targets

The transcription can be generated:

```bash
$ buck2 bxl //rules/haskell/cabal/generate.bxl:generate -- --cabal-file path/to/pkg.cabal
$ buck2 bxl //rules/haskell/cabal/generate.bxl:generate -- --sdist //path/to:pkg-1.0 --tests false
```

prints the path of a `BUCK` file to copy next to the `.cabal` file, or into
the package of the `hackage_package` target, and format with buildifier.
Cabal's parser reads the package description, and the conditionals are
resolved for the GHC of the toolchain, this machine and `--flags` (the
package's defaults otherwise): the targets are for that configuration, with
no `select`. A dependency on a package that comes with the compiler becomes
a `haskell_unit` in the same `BUCK` file (or `<prefix><package>` with
`--compiler-prefix //examples/cabal_simple/ghc:`); any other has to be named
with `--dep pkg=//target` or, for a build tool, `--tool pkg:exe=//target`.
Benchmarks and foreign libraries are left out, with a comment.

Every example here but `ghc` comes out of it with the same attributes as the
hand-written transcription, apart from spelling (`cabal_version`,
`license_files`), order (`build_depends`), the `extra-source-files`,
`extra-doc-files` and `tested-with` the transcriptions leave out, and
`visibility`, which the generator gives the libraries other packages may use
and the executables. [`tests/generate.sh`](tests/generate.sh) checks it,
with `generate.bxl:check`, which compares what would be generated with a
package. Run it by hand, from the root of the repository. The options that
take:

| Example | Options |
| --- | --- |
| `hello` | `--cabal-file examples/cabal_simple/hello/hello.cabal` |
| `lexer` | `--cabal-file examples/cabal_simple/lexer/lexer.cabal --tool alex:alex=//examples/cabal_simple/alex:exe` |
| `cparse` | `--cabal-file examples/cabal_simple/cparse/cparse.cabal --compiler-prefix //examples/cabal_simple/ghc: --dep language-c=//examples/cabal_simple/language-c:lib` |
| `alex` | `--sdist //examples/cabal_simple/alex:alex-3.5.1.0 --tests false` |
| `happy-lib` | `--sdist //examples/cabal_simple/happy-lib:happy-lib-2.2 --compiler-prefix //examples/cabal_simple/ghc: --tests false` |
| `happy` | `--sdist //examples/cabal_simple/happy:happy-2.2 --compiler-prefix //examples/cabal_simple/ghc: --dep happy-lib=//examples/cabal_simple/happy-lib:lib --tests false` |
| `language-c` | `--sdist //examples/cabal_simple/language-c:language-c-0.10.2 --compiler-prefix //examples/cabal_simple/ghc: --tool happy:happy=//examples/cabal_simple/happy:exe --tool alex:alex=//examples/cabal_simple/alex:exe --tests false` |

To see the raw fields of a `.cabal` file as JSON instead:

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
