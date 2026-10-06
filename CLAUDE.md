# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this is

Experiments in building Haskell with Buck2, focused on projects that use cabal.
Three approaches live side by side:

1. Hand-written targets using the Haskell rules from the Buck2 prelude
   (`BUCK`, `rules/haskell/helpers/BUCK`, `tmp/alex-3.5.1.0/BUCK`).
2. The plan interpreter: mapping a cabal-install build plan (`plan.json`) onto
   a Buck2 target graph, building each unit through `Setup.hs` the way
   cabal-install does (`rules/haskell/cabal_install/`, `projects/`).
3. The `cabal_simple` rules: targets whose attributes are the fields of a
   `.cabal` stanza, built the way Cabal builds `build-type: Simple` but by
   calling GHC directly, without `Setup.hs` (`rules/haskell/cabal/`,
   `examples/`).

The plan interpreter knows which units to build and where their sources are,
but each unit is an opaque `Setup.hs` run. The `cabal_simple` rules know how to
build one component with fine-grained outputs, but their targets are
transcribed by hand and nothing solves dependencies for them. The two do not
share providers or toolchains yet; having `interpret_plan` emit `cabal_simple`
targets for Simple units is the open question.

This is a research sandbox, not a product. History is mostly `wip` commits and
the code is reworked wholesale. The repository was cleaned up on 2026-10-06:
abandoned experiments (the generated toolchain, a from-scratch
`haskell_library`, a plan read in a dynamic action, buildozer generation,
Cabal's types as providers, remote execution platforms) were deleted and are
only in the history.

## Current state (2026-10-06)

The repository runs on the upstream prelude bundled with buck2, with a
downloaded GHC 9.12.2. It used to depend on the Mercury fork of the prelude;
that dependency is gone. There is one GHC toolchain, `toolchains//:haskell`,
for the prelude rules, the plan interpreter and the `cabal_simple` rules.

Built and run after the cleanup:

- Prelude rules: `//:main`, `//rules/haskell/helpers:parse_fields`,
  `//rules/haskell/cabal_install/helpers:setup_simple` and `:setup_configure`,
  `//tmp/alex-3.5.1.0:alex` (prints its version).
- `cabal_simple` rules: `//examples/hello:exe` with both toolchains,
  `//examples/hello:hello-test`, `//examples/lexer:exe`, and
  `//examples/cparse:exe` (built, not run), which pulls in alex, happy,
  happy-lib and language-c.
- Plan interpreter: `//projects/shake:plan`, and the whole shake plan; the
  `shake` executable unit builds and prints its version.
- `buck2 targets //...` parses every package.
- Prelude rules on top of the plan interpreter: a `haskell_binary` and a
  `haskell_library` depending on the `utf8-string` unit of the shake plan
  built and ran with the three link styles (`shared` with `-dynamic` in
  `linker_flags`), also when what they use of it needs `bytestring` from the
  global package db. This was checked with throwaway targets; no target in
  the repository does it.
- `haskell_unit`: `//examples/prelude:count` is a prelude binary that gets
  `base` and `containers` from units alone (`:count-test`), the
  `cabal_simple` examples take the libraries of the compiler from units, and
  every pre-existing unit of a plan is one. Checked
  with throwaway targets: a unit given by id, the three link styles, the
  errors for an id, a name or a version the package db does not have, and
  units in a package db other than the compiler's (found by name from a
  `cabal_simple_library`; given by id, one depending on the other, from a
  prelude binary linked `static` and `static_pic`).
- Prelude rules on top of the `cabal_simple` rules: `//examples/prelude:exe`,
  a `haskell_binary` depending on `//examples/prelude:lib`, a
  `haskell_library` which depends on `//examples/hello:lib`, with both
  toolchains. It is linked with the `static` style; `static_pic` and `shared`
  (with `-dynamic` in `linker_flags`) were checked with throwaway targets, and
  so was a `haskell_binary` depending on `//examples/hello:lib` directly.
- The other Haskell rules of the prelude, in `examples/prelude` and with the
  bindist toolchain: `:ghci` (`haskell_ghci`; `:ghci-test` loads the library
  in it and calls it), `:haddock` (`haskell_haddock`; `:haddock-test` looks at
  what it wrote) and `:ide` (`haskell_ide`; `tests/ide.sh`, run by hand, gives
  what `prelude//haskell/ide/ide.bxl` answers to GHC).
- With the GHC in `PATH` (9.12.4), `--config haskell.toolchain=toolchains//:ghc`:
  `//:main`, `//examples/hello:exe`, `:hello-test`, `//examples/prelude:exe`,
  `:haddock-test`, and the analysis of a unit of the shake plan.

Known broken or untested:

- Every project other than shake still pins `index-state: 2024-09-19`, which
  has no install plan for GHC 9.12. The plans embedded in
  `projects/aeson-diff/BUCK` and `projects/cabal-install/BUCK` were made with
  GHC 9.8.2 / 9.10.1 and name units the current toolchain does not have; the
  one in `projects/c2hs/BUCK` is commented out.
- `build_legacy.bzl` and the legacy branch of `interpret_plan.bzl` have not
  run since the move to the bundled prelude; shake's plan has no legacy units.
- Prelude rules depending on a unit of an interpreted plan (see "Design
  rules" for why):
  - The `-setup` binaries of legacy units with `setup-depends` built from
    source are untested.
  - With the `shared` link style, which `system_cxx_toolchain` makes the
    default, the prelude links a binary without `-dynamic`. With a Haskell
    library among its dependencies the binary builds and then dies at run time
    with a symbol lookup error; this happens with prelude libraries alone.
    Add `-dynamic` to `linker_flags`.
  - Sublibraries are given the name of their package, which GHC cannot tell
    from the main library (see `_prelude_package_name` in
    `rules/haskell/cabal/simple.bzl` for what the `cabal_simple` rules do);
    untested. There are no profiling libraries.
- The other direction does not exist: neither a unit of a plan nor a
  `cabal_simple` component can depend on a prelude `haskell_library` (they
  need `UnitInfo` and `CabalLibraryInfo`).
- Prelude rules depending on a `cabal_simple` library: the linker flags of
  `extra-libraries`, `extra-lib-dirs` and
  `ld-options` are passed on but no example has them. A library built with
  the GHC in `PATH` has no shared object as far as the prelude knows, and its
  archive is used for the `shared` link style too.
- With the GHC in `PATH`: the shake plan does not build (it names the units
  of GHC 9.12.2), `haskell_ghci` fails analysis inside the prelude with an
  error about `NoneType` (that toolchain has nothing of what it needs), and
  the IDE script is untested (`tests/ide.sh` takes GHC from the bindist).
- `haskell_ghci` with `srcs`: the prelude computes their paths relative to a
  cell called `fbcode` and fails analysis in any other. `//examples/prelude:ghci`
  only has `deps`.
- `haskell_unit`: a prelude target that depends on a unit of another package
  db with the `shared` link style is untested, and there is nothing to find
  its shared object at run time. A package db given as an absolute path of
  the machine is not supported, only one in the source tree or made by a
  target. `haskell_ghci` asks for `-package <name>-<version>`, so a unit it
  depends on directly needs its `version` attribute.
  `prelude//haskell/ide/ide.bxl` does not see the units of the compiler,
  which is why the targets of `//examples/prelude:ide` still use
  `toolchain_libs`.
- `prelude//haskell/ide/ide.bxl` was only run on a file of a project made of
  prelude targets, with HLS nowhere in sight. It takes a file as
  `root//path`, reads `srcs` only when they are a dictionary, and leaves out
  the global package db, which the wrappers in `rules/haskell/defs.bzl` put
  back.

## Commands

```sh
mise install                       # buck2 (latest prerelease), buildifier, lefthook
buck2 targets //projects/shake:    # what parses in one package
buck2 build //:main                # smallest Haskell target
buck2 run //examples/hello:exe     # cabal_simple rules
buck2 test //examples/hello:hello-test
buck2 run //examples/prelude:exe   # prelude rules on top of a cabal_simple library
buck2 test //examples/prelude:     # haskell_ghci and haskell_haddock
buck2 run //examples/prelude:ghci  # a GHCi with //examples/prelude:lib
sh examples/prelude/tests/ide.sh   # what the IDE script answers, given to GHC
buck2 build //projects/shake:plan --show-output   # cabal dry-run -> plan.json
buck2 build toolchains//:haskell   # downloads the GHC bindist (about 290 MB)
buildifier BUCK path/to/file.bzl   # format Starlark
buck2 starlark lint path/to/file.bzl
```

Units of an interpreted plan are targets named by unit-id, for example
`//projects/shake:shake-0.19.9-e-shake-<hash>`; `buck2 run <target> -- --version`
runs an executable unit.

Every Haskell rule takes its compiler from `toolchains//:haskell`, an alias
of what the `haskell.toolchain` config value names. The default is
`toolchains//:ghc-9.12.2-bindist`, the downloaded GHC; pass
`--config haskell.toolchain=toolchains//:ghc` for whatever GHC is in `PATH`.
The choice is for the whole build: two compilers in one build do not mix (a
library built by one is "unusable due to missing dependencies" for the
other).

`//...` needs `.buckconfig.local` (see "Layout"): without it buck2 walks into
`.jj/` and `.claude/worktrees/`, which hold other copies of the tree, and
fails to parse them. The file is not under version control, so a new checkout
or workspace has to be given its own.

"Does it build and run" is the check for the rules. The few tests there are
(`//examples/hello:hello-test`, `//examples/prelude:ghci-test` and
`:haddock-test`) are examples of test rules more than a test suite.

`toolchains/ghcup/metadata.bzl` (about 16.8k lines) is generated, never edit it
by hand:

```sh
yq .ghcupDownloads ~/.ghcup/cache/ghcup-0.0.9.yaml -o json | sed 's/null/None/' > toolchains/ghcup/metadata.bzl
```

To refresh a project's plan: build `:plan`, then replace the JSON inside the
`interpret_plan(...)` call in the project's `BUCK` with the new `plan.json`.

## Layout

- `.buckconfig` — cells `root`, `prelude`, `toolchains`; the prelude is
  `[external_cells] prelude = bundled`, the one inside the buck2 binary. The
  `prelude = prelude` line under `[cells]` only declares the cell: there is no
  `prelude/` directory and buck2 does not look for one. A remote execution
  setup (BuildBuddy) is left commented out; the execution platform it needs
  was deleted.
- `.buckconfig.local` — `[project] ignore = .git, .jj, .claude`, so that
  buck2 does not look for packages there. It is ignored by Andrea's global
  git ignore file (`~/.config/git/ignore`), not by the repository's.
- `toolchains/` — `BUCK` wires system cxx/python/genrule toolchains, the
  no-op test toolchains `sh_test` asks for, plus:
  - `:haskell`, the GHC of every Haskell rule: a `toolchain_alias` of
    `:ghc-9.12.2-bindist` or, with `--config haskell.toolchain=toolchains//:ghc`,
    of `:ghc` (the GHC in `PATH`). Both are instances of the rules in
    `rules/haskell/cabal/ghc_toolchain.bzl`. `ghcup/defs.bzl` picks a bindist
    URL and hash out of GHCup's metadata for the host OS/arch and wraps it in
    `http_archive`.
  - `:cabal` (3.14.2.0), cabal-install for the `plan` rule; `defs.bzl` has its
    rule.
  - `ghci/` — the two script templates `haskell_ghci` needs from the
    toolchain. The prelude does not come with any. Their names have no dot
    because the prelude makes an action category out of them.
- `rules/haskell/defs.bzl` — `haskell_binary` and `haskell_library` wrappers
  that add a `toolchain_libs` attribute (see "Design rules"), and
  `haskell_unit`.
- `rules/haskell/unit.bzl` — `haskell_unit`: a unit that is already in a
  package db, the compiler's (`db = "global"`, the default) or a directory.
  It is found by `id` or by the name of its package, when the package db is
  read in a dynamic action. Every rule set can depend on one; the top of the
  file says what each gets out of it. It took the place of
  `cabal_toolchain_library` and `pre_existing_unit`: `interpret_plan` makes
  one for each pre-existing unit of a plan.
- `rules/haskell/hackage.bzl` — `hackage_package`: `http_archive` of an sdist
  from Hackage, no cabal-file revisions. Used by `examples/`.
- `rules/haskell/helpers/` — `parse_fields.hs` prints the fields of a `.cabal`
  file as JSON, a first step towards generating `cabal_simple` targets.
- `rules/haskell/cabal_install/` — the plan interpreter:
  - `plan.bzl` — runs `cabal build --dry-run` with the toolchain's GHC and
    cabal, then adds `pkg-cabal-revision` and `pkg-cabal-size` to each unit:
    the revision number comes from matching `pkg-cabal-sha256` against
    Hackage's `revisions/.json`, the size from fetching that revision (needs
    `curl` and `jq`). The output is that annotated `plan.json`. It reads the Hackage
    index from the user's cabal directory and queries Hackage, so it is not
    hermetic; everything downstream is pinned by checksum.
  - `interpret_plan.bzl` — macro that decodes a `plan.json` string and emits
    one target per unit, named by unit-id.
  - `pkg_src.bzl` — downloads the sdist from the plan's repo and overlays the
    `.cabal` revision the plan was made with (`revision/<n>.cabal`, checked
    against the plan's sha256). A plan without `pkg-cabal-revision` and
    `pkg-cabal-size` fails with a message asking to make it again.
  - `build.bzl` — `build-type: Simple`, one component per target; configure,
    build and copy run as separate actions using the shared
    `helpers:setup_simple` executable, plus register for library components.
  - `build_legacy.bzl` — every other build type; compiles the package's own
    `Setup.hs` and runs all phases in one action, since its outputs cannot be
    predicted.
  - `common.bzl` — providers (`UnitInfo`, `PackageConfTSet`, `CabalPackageInfo`,
    `ExeDependInfo`), configure arguments, install dirs, and `mkProviders`,
    which adapts a built unit to the prelude's Haskell rules:
    `HaskellLibraryProvider` and `HaskellLinkInfo` to compile against it,
    `MergedLinkInfo`, `SharedLibraryInfo` and `LinkableGraph` to link it. The
    last one reads a `labels` attribute, which is why the unit rules have one.
  - `helpers/setup_simple.hs` — `Setup.hs` with a `postConf` hook that dumps
    `local-build-info.json` (components, modules, GHC arguments). Nothing
    reads the dump at the moment; it was made for an experiment that
    configured with `Setup.hs` and then called GHC from a dynamic action, and
    is kept as a possible source of what a `cabal_simple` target needs.
    `helpers/setup_configure.hs` is a plain `defaultMain`, unused.
- `rules/haskell/cabal/` — the `cabal_simple` rules; load them from `defs.bzl`:
  - `package.bzl` — `cabal_package`: the package-level fields and the source
    tree (a directory, possibly the output of another rule, or a list of
    files).
  - `simple.bzl` — `cabal_simple_library`, `cabal_simple_executable`,
    `cabal_simple_test`. Its docstring describes
    the steps (configure, preprocess, build, register) and what happens in a
    dynamic action. A unit-id is `<package>-<version>[-<component>]-<hash>`,
    the hash being of the label of the configured target, unless the
    `unit_id` attribute of a library gives one.
  - `prelude.bzl` — what the Haskell rules of the prelude need to depend on a
    `cabal_simple_library` (the same five providers as `mkProviders`), and to
    link a `haskell_unit` (linker flags only, see "Design rules").
  - `providers.bzl` — `CabalPackageInfo`, `CabalLibraryInfo` (a dynamic
    `CabalUnitInfo` plus a `CabalUnitTSet` of package dbs and artifacts),
    `CabalExecutableInfo`. `CabalPackageInfo` here is not the provider of the
    same name in `cabal_install/common.bzl`.
  - `ghc_toolchain.bzl` — the toolchain rules, `bindist_ghc_toolchain` and
    `system_ghc_toolchain`. Despite where the file is they serve every rule
    set: they return `GhcToolchainInfo`, with the GHC version and the global
    package db (`ghc-pkg dump`) as a dynamic value, for the `cabal_simple`
    rules and the plan interpreter, and the prelude's `HaskellToolchainInfo`
    and `HaskellPlatformInfo`. The bindist toolchain also knows its version
    during analysis (`version`), which is what it takes to name a shared
    library for the prelude, and is the only one with what `haskell_ghci`
    needs.
  - `macros.bzl`, `paths.bzl` — `cabal_macros.h`, `Paths_<pkg>` and
    `PackageInfo_<pkg>`, after Cabal's templates. `paths.bzl` also has the
    `cabal_paths_module` rule, used by `tmp/alex-3.5.1.0/BUCK`.
  - `tools/` — shell scripts run by the actions: `find_modules.sh` (which file
    a module comes from), `run.sh` (run a command from the package root with
    build tools in `PATH`), `register.sh` (write a package db).
- `examples/` — `.cabal` files transcribed to `cabal_simple` targets: `hello`
  (sublibrary, c-sources, hsc2hs, Template Haskell, data-files, a test suite;
  it has a `hello.cabal` too, so `cabal build` can be compared), `lexer`
  (build-tool-depends on alex), `alex`, `happy`, `happy-lib` and `language-c`
  from their Hackage sdists, `cparse` (an executable using language-c), and
  `ghc` (the libraries that come with the compiler). `prelude` is not a
  transcription: it has one target for each Haskell rule of the prelude
  (`haskell_library`, `haskell_binary`, `haskell_ghci`, `haskell_haddock`,
  `haskell_ide`) on top of the library of `hello`, and the scripts that check
  the last three in `tests/`.
- `projects/<name>/` — a `cabal.project` pinned by `index-state`, plus a `BUCK`
  with a `plan(...)` target and, where a plan has been pasted in, an
  `interpret_plan(...)` call. The embedded plans make some `BUCK` files
  20–80 KB; search them, don't read them whole.
- `tmp/alex-3.5.1.0` — an unpacked upstream sdist (don't edit its sources)
  with a hand-written `BUCK` that builds alex with the prelude rules. The same
  package is built with the `cabal_simple` rules in `examples/alex`.

## Design rules that matter

- In the plan interpreter, dependencies are always passed by unit-id:
  `--exact-configuration`, `--dependency=<pkg>[:<lib>]=<unit-id>`. Never let
  Cabal choose a unit by name there. Both the global package db and
  cabal-install plans speak unit-ids.
- Hand-written targets name compiler-provided packages in one of two ways.
  `toolchain_libs` on the `haskell_binary` and `haskell_library` from
  `rules/haskell/defs.bzl` becomes `-hide-all-packages -package <name>` when
  compiling and `-package <name>` when linking. The upstream prelude has no
  equivalent: without it, packages from the global db are visible to the
  compiler but missing at link time. A `haskell_unit` among the `deps` does
  better at linking (see below) and is something other rules can depend on
  too. Either way a prelude rule selects by name, not unit-id.
- A `haskell_unit` returns the providers it knows enough for, which depends
  on which of its attributes are given, since some rules need their facts
  during analysis and a package db is only read later. The `cabal_simple`
  rules need nothing ahead of time and always tell GHC the id
  (`-package-id`), also for a unit given by name. The plan interpreter needs
  `id` and the name of the package (`UnitInfo`). The prelude needs the name
  for `-package <name>`; an `id` is of no use to it, except that with a `db`
  it takes one for the package db to reach the compiler at all.
- What the prelude's Haskell rules need from a toolchain beyond the compiler
  is not written down anywhere. `haskell_library` needs `linker`.
  `haskell_haddock` needs `use_argsfile`, or it passes GHC's options to
  haddock as they are. `haskell_ide` needs the `ghci_*_path` of the C tools.
  `haskell_ghci` needs two script templates, the GHC programs as dependencies
  (subtargets of the bindist archive) and
  `prelude//haskell/tools:script_template_processor`. It loads prelude
  libraries built the static way, which a dynamically linked GHC can only do
  in an external interpreter: that is what `toolchains/ghci/ghci_script` asks
  for.
- The upstream Haskell rules do the linking themselves. A dependency hands
  over its archives and shared objects through `MergedLinkInfo`,
  `SharedLibraryInfo` and `LinkableGraph`; its package db is only used to find
  interface files when compiling, and a direct dependency is exposed with
  `-package <name>`. A target with `HaskellLibraryProvider` and
  `HaskellLinkInfo` alone compiles and then fails to link. This also means
  every package is expected to be a target, the ones that come with the
  compiler included: GHC puts the `-l` flags of the packages it links on its
  own before the libraries the prelude passes with `-optl`, so an archive from
  the global package db is searched before the dependency that needs it.
  A `haskell_unit` is how such a package becomes a target: it writes the
  linker options for its unit and what it depends on (the run-time system
  excepted) to a file, and has the prelude pass it to the linker after the
  libraries that need it (`-Wl,@file`). The libraries built by the
  `cabal_simple` rules and by the plan interpreter depend on units, so a
  prelude target that depends on them gets those options without doing
  anything.
- The prelude can only name a dependency by package name. For a
  `cabal_simple` sublibrary that is not enough, since GHC takes it and the
  main library for the same package, so a sublibrary has a second package db,
  for the prelude alone, where it is registered as the package
  `<package>-z-<library>`. Two versions of one package among the
  dependencies of a prelude target remain ambiguous.
- The upstream Haskell rules derive object file names from source paths. Give
  `srcs` as a dict from module path to file (`{"Main.hs": "parse_fields.hs"}`,
  `src/` stripped) whenever the two differ.
- Outputs whose paths get recorded elsewhere (Cabal's build dir, install
  prefix, package dbs) are declared with `has_content_based_path = False`.
  Current buck2 defaults to content-based paths, which cannot be combined with
  `ignore_artifacts` and are not known when the configure step writes them
  down. Fetched sources do not need the opt-out.
- A download can use a content-based path when buck2 knows its digest and its
  size up front: a `sha256` is enough for the digest, the size comes from
  `size_bytes` or the server's `Content-Length`. Hackage reports a size for
  sdists but not for `.cabal` files, so the plan records the size of each
  cabal file and `pkg_src.bzl` passes it as `size_bytes`.
- buck2 does not download a file without a checksum. Anything that has to be
  looked up in a document that changes over time (such as which revision a
  cabal file is) belongs in the `plan` step, not in the rules that fetch
  sources.
- In the plan interpreter, package dbs are composed from a transitive set of
  `.conf` files (`PackageConfTSet`) and recached per consumer, starting from
  `--package-db=clear --package-db=global`.
- Actions that must run inside the source directory write a small bash script
  (`cd <srcdir>` then a command made relative with `relative_to = srcdir`) and
  declare inputs/outputs through `hidden`. The `cabal_simple` rules use
  `tools/run.sh` for the same purpose.
- Tools come from the toolchain (`HaskellToolchainInfo.compiler`,
  `.packager`, `GhcToolchainInfo`), not from `PATH`, and the archiver from the
  cxx toolchain, as for the prelude's rules. One exception is left in the
  `cabal_simple` rules: a preprocessor that is not in `build_tool_depends` is
  looked up in `PATH` as Cabal would. (The system cxx toolchain and
  `toolchains//:ghc` are of course `PATH` under another name.)
- The `cabal_simple` rules keep Cabal's semantics (steps, flags) but
  not its file layout: no `dist` directory, no copy step, no install prefix.
  Interface files, static library and shared library are separate artifacts,
  each library gets a package db of its own, and its registration refers to
  those artifacts where the build left them, through `${pkgroot}`.
- In the `cabal_simple` rules, what is only known after looking at the source
  tree or running the compiler (which file a module comes from, the GHC
  version, unit-ids in the global package db) is resolved in a dynamic action;
  a library exposes its unit as a dynamic value its dependents wait for.
- A `.cabal` field the `cabal_simple` rules know but do not honour (`mixins`,
  `pkgconfig-depends`, `signatures`, …) fails the build instead of being
  ignored. Conditionals are left to `select`.
- Turning a `.cabal` file into `cabal_simple` targets is manual transcription
  for now; the intent is a bxl script that generates them.

## Conventions

- Starlark is formatted with `buildifier`. Existing files use
  `# buildifier: disable=...` and `# @unsorted-dict-items` where ordering is
  deliberate; keep them.
- `lefthook.yml` runs `buildifier` on *staged* `BUCK`/`*.bzl` files in a git
  pre-commit hook. This is a jj repository, so that hook does not run on
  `jj commit`; run `buildifier` by hand.
- Haskell helper scripts are single-file programs depending only on GHC boot
  packages (`base`, `Cabal`, `Cabal-syntax`, …) and start with
  `{-# OPTIONS_GHC -Wall #-}`. They must compile against the Cabal that ships
  with the toolchain's GHC (3.14 for 9.12.2).
- Version control is jj (colocated).

## Environment

- `mise.toml` installs buck2, buildifier and lefthook. It sets no environment.
- GHC (9.12.4), cabal and ghcup from `~/.ghcup` are on `PATH`. Builds go
  through `toolchains//:haskell` and `toolchains//:cabal`, which are the
  downloaded ones unless told otherwise.
- Sibling checkouts under `../`: `buck2-prelude` (jj clone of the prelude fork,
  remotes `origin`, `MercuryTechnologies`, `upstream`; its branch
  `timbuktu-prelude` is the fork as this repository last used it, mid-2025,
  when `prelude/` here was a checkout of it), `buck2-prelude-temp`
  (plain clone), `buck2-packagedb` (a small standalone experiment with the same
  toolchain and `-package-id` from the dynamic package db), `buck2-ghc-build`
  (Mercury's build of GHC HEAD with buck2).

### Running buck2 from Claude's sandbox

- buck2 needs `~/.buck` writable; otherwise it fails with "Error creating
  daemon dir".
- A sandboxed run leaves `buckd.pid` and `buckd.info` behind in
  `~/.buck/buckd/<absolute project path>/v2/`, naming a daemon that died with
  its sandbox. The next run tries to kill that pid, and inside a new sandbox
  the number can belong to the buck2 client itself: the build then dies at
  once with exit code 137. Delete those two files and run again.
- Each sandboxed command gets its own buck2 daemon, and a new daemon re-runs
  every local action. For more than one build, start one long-lived background
  command that executes queued scripts, so they share a daemon.
- Builds need network access to `downloads.haskell.org` (GHC and cabal
  bindists; buck2 re-checks them with a HEAD request on every new daemon),
  and `hackage.haskell.org`. If that check is denied, buck2
  discards the 290 MB GHC archive and downloads it again.
- `buildifier` on `PATH` is a mise shim. It runs from the sandbox once mise has
  installed it (`mise install`, outside the sandbox). Try it before concluding
  that it does not work: only when it is not installed does the shim try to
  install it, which the sandbox does not allow.
- Plain jj commands snapshot the working copy, and in the sandbox that records
  the sandbox's mask files (`.bashrc`, `.zshrc`, `.mcp.json`, …) as additions.
  Pass `--ignore-working-copy` to read-only jj commands.
