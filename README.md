# Building cabal packages with Buck2

This repository contains some experiments with the Buck2 build system. I am
interested in how it can be used to build Haskell packages that use cabal,
starting from their sources: a directory with a `.cabal` file, or an sdist
from Hackage.

There are three approaches side by side, each with its own examples. All of
them build with the same GHC. A library or an executable of a build plan and
one of the `cabal_simple` rules hand their dependents the same providers, so
the two depend on each other freely; the prelude rules can use both (see
[`examples/interop`](examples/interop) and
[`examples/plan/network`](examples/plan/network)).

| Approach | Rules | Examples |
| --- | --- | --- |
| The Haskell rules of the buck2 prelude, written by hand | the prelude, plus [`rules/haskell/defs.bzl`](rules/haskell/defs.bzl) | [`examples/prelude`](examples/prelude) |
| A cabal-install build plan turned into targets, each unit built with `Setup.hs` | [`rules/haskell/cabal_install`](rules/haskell/cabal_install) | [`examples/plan`](examples/plan) |
| A `.cabal` file transcribed into targets that do what Cabal does for `build-type: Simple`, without `Setup.hs` | [`rules/haskell/cabal`](rules/haskell/cabal) | [`examples/cabal_simple`](examples/cabal_simple) |

**The prelude rules** know nothing about cabal. A package becomes a
`haskell_binary` or a `haskell_library` with its source files listed one by
one, and whatever Cabal would have done (the `Paths_<pkg>` module, the
language extensions, data files) has to be done by hand.

**The plan interpreter** lets the solver of cabal-install choose the
dependencies: a `plan` target runs
[cabal-solver-plan](https://github.com/andreabedini/cabal-solver-plan), and
the plan it prints, pasted into the `BUCK` file, becomes one target per unit,
named after its unit-id. Each
unit is built from its sdist by the package's own `Setup.hs`, as cabal-install
would. This works for any build type, but each unit is an opaque step.

**The `cabal_simple` rules** take the fields of a `.cabal` stanza as
attributes and call GHC directly: configure, preprocess, build and register
become separate actions with fine-grained outputs. They only cover
`build-type: Simple`, and nothing solves dependencies for them. The targets
can be written by hand or generated from a `.cabal` file by a BXL script
(see [`examples/cabal_simple`](examples/cabal_simple)).

Not everything works and I keep reworking the code significantly.

## Examples

| Example | What it shows |
| --- | --- |
| [`prelude/alex`](examples/prelude/alex) | alex from its sdist with `haskell_binary` |
| [`plan/shake`](examples/plan/shake) | shake and its dependencies from a build plan, all `build-type: Simple` |
| [`plan/network`](examples/plan/network) | network (`build-type: Configure`) from a build plan, used by a prelude binary and by a `cabal_simple` executable |
| [`plan/dynamic`](examples/plan/dynamic) | the same two plans, made and built at build time by one target each |
| [`cabal_simple/hello`](examples/cabal_simple/hello) | a local package: sublibrary, C sources, hsc2hs, Template Haskell, data files, a test suite |
| [`cabal_simple/lexer`](examples/cabal_simple/lexer) | `build-tool-depends` on alex |
| [`cabal_simple/cparse`](examples/cabal_simple/cparse) | a local package depending on a library from Hackage |
| [`cabal_simple/alex`](examples/cabal_simple/alex), [`happy`](examples/cabal_simple/happy), [`happy-lib`](examples/cabal_simple/happy-lib), [`language-c`](examples/cabal_simple/language-c) | packages from Hackage, transcribed |
| [`cabal_simple/ghc`](examples/cabal_simple/ghc) | the libraries that come with the compiler, as targets |
| [`interop`](examples/interop) | prelude rules on top of a `cabal_simple` library; `haskell_ghci`, `haskell_haddock`, `haskell_ide` |

## Getting started

GHC 9.12.2 and cabal-install 3.14.2.0 are downloaded by buck2, using GHCup's
metadata. The tools I use (buck2 itself, buildifier, lefthook) can be installed
with [mise](https://mise.jdx.dev):

```bash
$ mise install
```

You also need:

- a C compiler and a linker, since buck2 uses the ones on your system;
- cabal-solver-plan and a Hackage index downloaded with `cabal update`, only
  to make a build plan (e.g. `buck2 build //examples/plan/shake:plan`; see
  [`examples/plan`](examples/plan) for how to tell buck2 where they are).
  Without them `buck2 build //...` fails on the `:plan` targets alone.

Then, for example:

```bash
$ buck2 run //examples/cabal_simple/hello:exe
$ buck2 run //examples/prelude/alex:alex -- --version
$ buck2 run //examples/plan/network:socketpair
$ buck2 test //examples/...
```

Everything is built with a GHC that buck2 downloads. To use the `ghc` in path
instead pass `--config haskell.toolchain=toolchains//:ghc`; the build plans
are made for the downloaded one and will not build.

## Layout

- `examples/` — the examples above, one directory per approach.
- `rules/haskell/` — the rules: `toolchain.bzl` (the GHC toolchain every rule
  set uses), `defs.bzl` (wrappers around the prelude rules, `haskell_unit`),
  `unit.bzl` (`haskell_unit`, a unit that is already in a package db),
  `hackage.bzl` (fetch an sdist), `ghcup/` (pick a GHC or cabal-install
  bindist), `helpers/` (`parse_fields`, which prints the fields of a `.cabal`
  file as JSON), and the two rule sets in `cabal_install/` and `cabal/`.
- `toolchains/` — where the toolchains are chosen.

# Notes and rants

## `-package` vs `-package-id`

I keep fighting with the haskell rules in the prelude. I believe they are too
opinionated and do not support more general use cases. In particular BUCK should
not use `-package` to pass dependencies to GHC since this will leave GHC to
figure out which unit to pick for a given package name. The build-system should
be extremely precise in the instructions it gives to the compiler.
The dependencies in both the global packagedb and cabal-install build plans are
indeed expressed in terms of unit-id.

For a while I used a fork of the prelude, customised to use `-package-id` in
place of `-package`. Now I am back on the prelude that comes with buck2 and the
situation is mixed. The rules in `rules/haskell/cabal_install` and
`rules/haskell/cabal` always name a dependency by its unit-id. The targets
written by hand still name the packages that come with the compiler by package
name (see `toolchain_libs` and `haskell_unit` in `rules/haskell/defs.bzl`).
