# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this is

Experiments in building Haskell with Buck2, focused on projects that use cabal.
Three approaches live side by side:

1. Hand-written targets using the Haskell rules from the Buck2 prelude
   (`examples/prelude/`, `rules/haskell/helpers/BUCK`).
2. The plan interpreter: mapping a build plan (made by cabal-solver-plan) onto
   a Buck2 target graph, building each unit through `Setup.hs` the way
   cabal-install does (`rules/haskell/cabal_install/`, `examples/plan/`).
3. The `cabal_simple` rules: targets whose attributes are the fields of a
   `.cabal` stanza, built the way Cabal builds `build-type: Simple` but by
   calling GHC directly, without `Setup.hs` (`rules/haskell/cabal/`,
   `examples/cabal_simple/`).

The repository is meant to show how a cabal package is built from its
sources with each approach: every example has a `README.md`, and the
top-level `README.md` indexes them. Keep them in step with the `BUCK` files.

The plan interpreter knows which units to build and where their sources are,
but each unit is an opaque `Setup.hs` run. The `cabal_simple` rules know how to
build one component with fine-grained outputs, but their targets are
transcribed by hand and nothing solves dependencies for them. Both use one
toolchain and the same providers (`rules/haskell/providers.bzl`), so a unit
of a plan and a `cabal_simple` component can depend on each other; having
`interpret_plan` emit `cabal_simple` targets for Simple units is the open
question.

The direction of travel (Andrea, 2026-10-12): rules covering a spectrum from
the most dynamic (`cabal build` in one action, a plan computed at build
time) to the most static (`cabal_simple` targets written by hand), all
speaking the same providers, plus BXL scripts that turn the dynamic into the
static (a `.cabal` file into `cabal_simple` targets, a plan into targets).
The plan read in a dynamic action that was deleted on 2026-10-06 is one of
those levels, unfinished rather than abandoned. The plans are made by
`../cabal-solver-plan`, cabal-install's solver on explicit inputs, which
prints a JSON format of its own (format 1, its `docs/plan-format.md`); it
replaced `cabal build --dry-run` on 2026-10-12.

This is a research sandbox, not a product. History is mostly `wip` commits and
the code is reworked wholesale. The repository was cleaned up on 2026-10-06:
abandoned experiments (the generated toolchain, a from-scratch
`haskell_library`, a plan read in a dynamic action, buildozer generation,
Cabal's types as providers, remote execution platforms) were deleted and are
only in the history. On 2026-10-12 the examples were regrouped by approach
under `examples/`; the projects whose plans no longer built (everything in
`projects/` but shake), the vendored alex sdist in `tmp/`, the root `//:main`
and the unused `setup_configure` helper were deleted.

## Current state (2026-10-12)

The repository runs on the upstream prelude bundled with buck2, with a
downloaded GHC 9.12.2. It used to depend on the Mercury fork of the prelude;
that dependency is gone. There is one GHC toolchain, `toolchains//:haskell`,
for the prelude rules, the plan interpreter and the `cabal_simple` rules.

Built and run after the cleanup (`buck2 test //examples/...` runs 6 tests, all
passing; buck2 also reports the 5 `http_archive` targets as passed tests):

- Prelude rules: `//rules/haskell/helpers:parse_fields`,
  `//rules/haskell/cabal_install/helpers:setup_simple`,
  `//examples/prelude/alex:alex` (sources taken one by one from the sdist as
  subtargets of the `http_archive`; `:alex-test` generates a lexer with it).
- `cabal_simple` rules: `//examples/cabal_simple/hello:exe` with both
  toolchains, `:hello-test`, `//examples/cabal_simple/lexer:exe`, and
  `//examples/cabal_simple/cparse:exe`, which pulls in alex, happy, happy-lib
  and language-c.
- Plan interpreter: `//examples/plan/shake:plan`, and the whole shake plan;
  the `shake` executable unit builds and prints its version.
  `//examples/plan/network` is a plan whose `network` unit has
  `build-type: Configure` and goes through `build_legacy.bzl`, with hsc2hs
  built from the plan as an exe-depend; `:socketpair`, a prelude binary
  linked `static`, depends on it and runs (`:socketpair-test`).
- Dynamic plans (2026-10-12): `//examples/plan/dynamic:shake` and
  `:network` make the same two plans at build time and build all their
  units in one dynamic action each; `:shake[shake]` runs (`:shake-test`),
  and `:network` builds from fresh daemons twice in a row, Setup.hs compiled
  in the dynamic action, hsc2hs from the plan. `download_file` works inside
  a dynamic action.
- `buck2 targets //...` parses every package.
- Prelude rules on top of the plan interpreter: a `haskell_binary` and a
  `haskell_library` depending on the `utf8-string` unit of the shake plan
  built and ran with the three link styles (`shared` with `-dynamic` in
  `linker_flags`), also when what they use of it needs `bytestring` from the
  global package db. This was checked with throwaway targets; no target in
  the repository does it.
- `haskell_unit`: `//examples/interop:count` is a prelude binary that gets
  `base` and `containers` from units alone (`:count-test`), the
  `cabal_simple` examples take the libraries of the compiler from units, and
  every pre-existing unit of a plan is one. Checked
  with throwaway targets: a unit given by id, the three link styles, the
  errors for an id, a name or a version the package db does not have, and
  units in a package db other than the compiler's (found by name from a
  `cabal_simple_library`; given by id, one depending on the other, from a
  prelude binary linked `static` and `static_pic`).
- Prelude rules on top of the `cabal_simple` rules: `//examples/interop:exe`,
  a `haskell_binary` depending on `//examples/interop:lib`, a
  `haskell_library` which depends on `//examples/cabal_simple/hello:lib`, with
  both toolchains. It is linked with the `static` style; `static_pic` and
  `shared` (with `-dynamic` in `linker_flags`) were checked with throwaway
  targets, and so was a `haskell_binary` depending on the hello library
  directly.
- The other Haskell rules of the prelude, in `examples/interop` and with the
  bindist toolchain: `:ghci` (`haskell_ghci`; `:ghci-test` loads the library
  in it and calls it), `:haddock` (`haskell_haddock`; `:haddock-test` looks at
  what it wrote) and `:ide` (`haskell_ide`; `tests/ide.sh`, run by hand, gives
  what `prelude//haskell/ide/ide.bxl` answers to GHC).
- With the GHC in `PATH` (9.12.4), `--config haskell.toolchain=toolchains//:ghc`:
  `//:main` (since deleted), `//examples/cabal_simple/hello:exe`,
  `:hello-test`, `//examples/interop:exe`, `:haddock-test`, and the analysis
  of a unit of the shake plan. Not run again after the 2026-10-12 moves.

Known broken or untested:

- Plans: cabal-solver-plan refuses a plan that needs Backpack (since
  b6642ff; 3ea35f7 got it wrong without saying so); local packages (`--local-package`) are in the format but
  `interpret_plan` does not take them yet; tests and benchmarks are only in a
  plan when the solver enables them, which it does not without being asked.
- `dynamic_plan`: once in 16 builds from a fresh daemon (2026-10-12, log
  `20261012-123556_build_bfd4165a…` in `buck-out/v2/log`), network's
  whole-package action failed because hsc2hs's `template-hsc.h` was not at
  `<unit>/prefix/data`, where it is afterwards; hsc2hs itself ran. Not
  reproduced in 15 more builds, also not when switching the solver binary,
  which was what came before the failure. The cause is unknown; suspects
  are a missing dependency edge or partial materialisation of the
  prefix in the dynamic action. Units are not targets, so nothing can depend
  on a library of a `dynamic_plan`.
- `build_legacy.bzl` has only been run on `network` (`build-type:
  Configure`, no `setup-depends`). `build-type: Custom` and `Hooks` are
  untested.
- `rules/haskell/cabal_install/helpers/setup_simple.hs` has a `postConf`
  hook that writes `local-build-info.json`, which nothing reads (see
  "Layout").
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
  need `CabalLibraryInfo`).
- A unit of a plan and a `cabal_simple` component depending on each other:
  `//examples/plan/network:socketpair-simple` is a `cabal_simple` executable
  on the network unit. The rest was checked with throwaway targets on
  2026-10-12: the plan's `random` built by `Setup.hs` against a
  `cabal_simple` splitmix, with a `cabal_simple` executable on top; a plan
  unit with `cabal_simple` alex as a build tool; a `cabal_simple` library
  with the plan's hsc2hs as a build tool. `interpret_plan` has no way to put
  a `cabal_simple` target in place of a unit: that took a `build` target
  written by hand. A sublibrary of a plan used by `cabal_simple` is
  untested.
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
  cell called `fbcode` and fails analysis in any other. `//examples/interop:ghci`
  only has `deps`.
- `haskell_unit`: a prelude target that depends on a unit of another package
  db with the `shared` link style is untested, and there is nothing to find
  its shared object at run time. A package db given as an absolute path of
  the machine is not supported, only one in the source tree or made by a
  target. `haskell_ghci` asks for `-package <name>-<version>`, so a unit it
  depends on directly needs its `version` attribute.
  `prelude//haskell/ide/ide.bxl` does not see the units of the compiler,
  which is why the targets of `//examples/interop:ide` still use
  `toolchain_libs`.
- `prelude//haskell/ide/ide.bxl` was only run on a file of a project made of
  prelude targets, with HLS nowhere in sight. It takes a file as
  `root//path`, reads `srcs` only when they are a dictionary, and leaves out
  the global package db, which the wrappers in `rules/haskell/defs.bzl` put
  back.

## Commands

```sh
mise install                       # buck2 (latest prerelease), buildifier, lefthook
buck2 targets //examples/plan/shake:          # what parses in one package
buck2 test //examples/...                       # every test there is
buck2 run //examples/prelude/alex:alex -- --version   # prelude rules
buck2 run //examples/cabal_simple/hello:exe     # cabal_simple rules
buck2 run //examples/plan/network:socketpair    # a prelude binary on a plan unit
buck2 run //examples/interop:exe     # prelude rules on top of a cabal_simple library
buck2 run //examples/interop:ghci    # a GHCi with //examples/interop:lib
sh examples/interop/tests/ide.sh     # what the IDE script answers, given to GHC
buck2 build //examples/plan/shake:plan --show-output   # cabal-solver-plan -> plan.json
buck2 build toolchains//:haskell   # downloads the GHC bindist (about 290 MB)
buildifier BUCK path/to/file.bzl   # format Starlark
buck2 starlark lint path/to/file.bzl
```

Units of an interpreted plan are targets named by unit-id, for example
`//examples/plan/shake:shake-0.19.9-e-shake-<hash>`, and the units the plan
was made for have aliases (`:shake`, `:exe-shake`, `:network`):
`buck2 run //examples/plan/shake:exe-shake -- --version`.

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

"Does it build and run" is the check for the rules. The tests under
`examples/` (a `cabal_simple_test`, and `sh_test`s that run what an example
built) check that the examples still do what their README says more than
they test the rules.

`rules/haskell/ghcup/metadata.bzl` (about 16.8k lines) is generated, never
edit it by hand:

```sh
yq .ghcupDownloads ~/.ghcup/cache/ghcup-0.0.9.yaml -o json | sed 's/null/None/' > rules/haskell/ghcup/metadata.bzl
```

To refresh a plan in `examples/plan/<name>`: build `:plan`, then replace the
JSON inside the `interpret_plan(...)` call in its `BUCK` with the new
`plan.json`. Targets that use a unit through its alias need no change; one
that names a unit of the compiler by id (`:base-4.21.0.0-b7a5` in
`network:socketpair-simple`) changes only with the compiler.

The `:plan` targets need cabal-solver-plan, which is not built here and is
not in `PATH`: `haskell.cabal_solver_plan` in `.buckconfig.local` (or
`--config`) says where it is, `haskell.hackage_index` where the
`01-index.tar` is (default: the one `cabal update` downloads). Without them
`buck2 build //...` fails on the `:plan` and `dynamic_plan` targets alone.
The plans were checked with its commit b6642ff (main in
`../cabal-solver-plan` on 2026-10-12, not pushed then; 3ea35f7 gave the same
plans), built with GHC 9.12.2 from a `git archive` into `$TMPDIR` with
`cabal build -w <ghc> --builddir=...`; its output was byte-identical to the
samples in its `examples/`. It reads the index without writing anything
next to it. Building it while a buck2 daemon starts fails ("the version of
ghc-pkg could not be determined"): a new daemon re-materialises the GHC
archive in `buck-out` that the build uses.

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
- `toolchains/` — a `BUCK` and nothing else: it is where toolchains are
  chosen, their rules are under `rules/`. It wires system cxx/python/genrule
  toolchains, the no-op test toolchains `sh_test` asks for, plus:
  - `:haskell`, the GHC of every Haskell rule: a `toolchain_alias` of
    `:ghc-9.12.2-bindist` or, with `--config haskell.toolchain=toolchains//:ghc`,
    of `:ghc` (the GHC in `PATH`).
  - `:cabal-solver-plan`, what the `plan` rule makes plans with: the program
    and the Hackage index, from `haskell.cabal_solver_plan` and
    `haskell.hackage_index`.
  - `:cabal` (3.14.2.0), cabal-install. Nothing uses it since the `plan` rule
    moved to cabal-solver-plan; it is kept for the `cabal build` end of the
    spectrum.
- `rules/haskell/toolchain.bzl` — the GHC toolchain rules,
  `bindist_ghc_toolchain` and `system_ghc_toolchain`, for every rule set. They
  return `GhcToolchainInfo`, with the GHC version and the global package db
  (`ghc-pkg dump`) as a dynamic value, for the `cabal_simple` rules and the
  plan interpreter, and the prelude's `HaskellToolchainInfo` and
  `HaskellPlatformInfo`. The bindist toolchain also knows its version during
  analysis (`version`), which is what it takes to name a shared library for
  the prelude, and is the only one with what `haskell_ghci` needs.
- `rules/haskell/ghcup/` — `defs.bzl` picks a bindist URL and hash for GHC or
  cabal-install out of GHCup's metadata (`metadata.bzl`) for the host OS/arch
  and wraps it in `http_archive`. buildifier cannot parse a type annotation
  in `defs.bzl`.
- `rules/haskell/ghci/` — the two script templates `haskell_ghci` needs from
  the toolchain, exported by `rules/haskell/BUCK` and the default of
  `bindist_ghc_toolchain`. The prelude does not come with any. Their names
  have no dot because the prelude makes an action category out of them.
- `rules/haskell/defs.bzl` — `haskell_binary` and `haskell_library` wrappers
  that add a `toolchain_libs` attribute (see "Design rules"), and
  `haskell_unit`.
- `rules/haskell/unit.bzl` — `haskell_unit`: a unit that is already in a
  package db, the compiler's (`db = "global"`, the default) or a directory.
  It is found by `id` or by the name of its package, when the package db is
  read in a dynamic action. Every rule set can depend on one; the top of the
  file says what each gets out of it. It took the place of
  `cabal_toolchain_library` and `pre_existing_unit`: `interpret_plan` makes
  one for each pre-existing unit of a plan. `resolve_unit` is that reading of
  a package db, also used by the plan interpreter for the units it builds.
- `rules/haskell/providers.bzl` — what a library or an executable hands to
  its dependents, whatever rule set they are of: `CabalLibraryInfo` (package
  name, sublibrary, the unit-id when known during analysis, a dynamic
  `CabalUnitInfo`, and a `CabalUnitTSet` of package dbs and artifacts) and
  `CabalExecutableInfo` (the program and the environment it expects as a
  build tool). The plan interpreter, the `cabal_simple` rules and
  `haskell_unit` all return and consume these.
- `rules/haskell/hackage.bzl` — `hackage_package`: `http_archive` of an sdist
  from Hackage, no cabal-file revisions. Used by `examples/`.
- `rules/haskell/helpers/` — `parse_fields.hs` prints the fields of a `.cabal`
  file as JSON, a first step towards generating `cabal_simple` targets.
- `rules/haskell/cabal_install/` — the plan interpreter:
  - `plan.bzl` — the `plan` rule: runs cabal-solver-plan with the
    toolchain's GHC and its global package db, a Hackage index and an
    `index_state` (plus `constraints`, `flags`). Its output, format 1, has
    for each package the sdist's checksum and size and the revision,
    checksum and size of the `.cabal` file, all read off the index. It reads
    the index of the machine (`local_only`), so it is not hermetic;
    everything downstream is pinned by checksum. `solve` is the action, and
    `plan_attrs` the attributes, shared with `dynamic_plan`.
  - `dynamic_plan.bzl` — `dynamic_plan`: `solve`, then a dynamic action that
    reads the plan and builds every unit with `fetch_package` and the
    functions of `setup.bzl` (`compile_setup` for a whole-package unit's
    Setup.hs), scoped `src/<pkg-id>` and `unit/<unit-id>`. The units are not
    targets: it offers the named `executables` of the plan's targets as
    subtargets (copied to `bin/<name>`), `[plan.json]`, and `units.txt`, a
    line per unit with its prefix and registration. A pre-existing unit
    from a package db other than the compiler's fails.
  - `solver_toolchain.bzl` — the rule of `toolchains//:cabal-solver-plan`
    (`CabalSolverPlanInfo`).
  - `cabal_toolchain.bzl` — the rule of `toolchains//:cabal`.
  - `interpret_plan.bzl` — macro that decodes a format-1 plan and emits a
    target per package (`pkg_src`), one per unit, named by unit-id
    (`haskell_unit`, `build` or `build_legacy` with a `<pkg>-setup` binary,
    by `build-style`), and an alias for each of the plan's `targets`. It
    refuses other formats, and a whole-package unit as a build tool.
  - `pkg_src.bzl` — `fetch_package`, a function of `actions` that
    downloads the sdist from `<repo>package/<id>.tar.gz` (with `size_bytes`,
    so with a content-based path) and overlays the
    `.cabal` revision the plan was made with (`revision/<n>.cabal`, checked
    against the plan's sha256). Only `repo-tar` packages; a local package
    (`"src": {"type": "local"}`) fails.
  - `setup.bzl` — building a unit with `Setup.hs`, as functions of
    `actions` and plain data (`SetupEnv`, `SetupUnit`, the providers of the
    dependencies), with no rule context: `build_component` for
    `build-type: Simple`, one component, configure, build, copy and register
    as separate actions using the shared `helpers:setup_simple`;
    `build_package` for every other build type, the package's own `Setup.hs`
    running all phases in one action, since its outputs cannot be predicted.
    A `scope` puts a unit's outputs in a directory of its own, so that one
    target can build many: a throwaway rule built two units of the shake
    plan this way from JSON read in a dynamic action (2026-10-12). A build
    tool's data dir (`<pkg>_datadir`, from `build_env`) is an absolute path,
    because hsc2hs writes it into an `#include` of a generated C file.
    `compile_setup` compiles a package's own Setup.hs with GHC (the
    `dynamic_plan` path; `interpret_plan` uses a prelude `haskell_binary`).
  - `build.bzl`, `build_legacy.bzl` — the rules `interpret_plan` emits,
    thin wrappers around `build_component` and `build_package` that add what
    the prelude needs (`mkProviders`).
  - `common.bzl` — `CabalPackageInfo` (not the one of the `cabal_simple`
    rules), the attributes of the unit rules, `setup_env` and `setup_unit`
    (from a rule's context to what `setup.bzl` takes), and `mkProviders`,
    which adapts a built unit to the prelude's Haskell rules:
    `HaskellLibraryProvider` and `HaskellLinkInfo` to compile against it,
    `MergedLinkInfo`, `SharedLibraryInfo` and `LinkableGraph` to link it. The
    last one reads a `labels` attribute, which is why the unit rules have one.
  - `helpers/setup_simple.hs` — `Setup.hs` with a `postConf` hook that dumps
    `local-build-info.json` (components, modules, GHC arguments). Nothing
    reads the dump at the moment; it was made for an experiment that
    configured with `Setup.hs` and then called GHC from a dynamic action, and
    is kept as a possible source of what a `cabal_simple` target needs.
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
  - `providers.bzl` — `CabalPackageInfo`, which is not the provider of the
    same name in `cabal_install/common.bzl`. What components hand their
    dependents is in `rules/haskell/providers.bzl`.
  - `macros.bzl`, `paths.bzl` — `cabal_macros.h`, `Paths_<pkg>` and
    `PackageInfo_<pkg>`, after Cabal's templates. `paths.bzl` also has the
    `cabal_paths_module` rule, used by `examples/prelude/alex/BUCK`.
  - `tools/` — shell scripts run by the actions: `find_modules.sh` (which file
    a module comes from), `run.sh` (run a command from the package root with
    build tools in `PATH`), `register.sh` (write a package db).
- `examples/` — one directory per approach, a `README.md` in each example:
  - `prelude/alex` — alex built from its Hackage sdist with `haskell_binary`;
    each source file is a subtarget of the `hackage_package` archive.
  - `plan/<name>/` — a `BUCK` with a `plan(...)` target (targets and
    index-state) and an `interpret_plan(...)` call with its output pasted
    in: `shake` (all Simple) and `network` (Configure, plus a prelude binary
    and a `cabal_simple` executable using it). The embedded plans make these
    `BUCK` files 10–30 KB; search them, don't read them whole.
    `plan/README.md` explains making a plan. `plan/dynamic` has the same two
    plans as `dynamic_plan` targets.
  - `cabal_simple/` — `.cabal` files transcribed to `cabal_simple` targets:
    `hello` (sublibrary, c-sources, hsc2hs, Template Haskell, data-files, a
    test suite; it has a `hello.cabal` too, so `cabal build` can be
    compared), `lexer` (build-tool-depends on alex), `alex`, `happy`,
    `happy-lib` and `language-c` from their Hackage sdists, `cparse` (an
    executable using language-c), and `ghc` (the libraries that come with the
    compiler). `cabal_simple/README.md` maps `.cabal` fields to attributes.
  - `interop` — not a transcription: one target for each Haskell rule of the
    prelude (`haskell_library`, `haskell_binary`, `haskell_ghci`,
    `haskell_haddock`, `haskell_ide`) on top of the library of `hello`, and
    the scripts that check the last three in `tests/`.

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
  `id` and the name of the package during analysis, and fails without them.
  The prelude needs the name
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
  in an external interpreter: that is what `rules/haskell/ghci/ghci_script`
  asks for.
- A toolchain rule takes what it needs from other targets as `exec_dep`,
  files included. A toolchain built on its own
  (`buck2 build toolchains//:haskell`) has no target platform, and a
  `source` or `dep` attribute that names a target fails there with "Platform
  is not bound"; as a dependency of a configured target it would work, which
  hides the mistake.
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
  down. That goes for the unpacked sources of a package too, since the
  scripts give paths relative to them: out of a dynamic action, a
  content-based source directory made buck2 compute those relative paths
  from the path it would otherwise have had, and hsc2hs got a data dir that
  did not exist. The downloads themselves can be content-based.
- A download can use a content-based path when buck2 knows its digest and its
  size up front: a `sha256` is enough for the digest, the size comes from
  `size_bytes` or the server's `Content-Length`. Hackage reports a size for
  sdists but not for `.cabal` files. The plan has both sizes, read off the
  index, and `pkg_src.bzl` passes them as `size_bytes`.
- buck2 does not download a file without a checksum. Anything that has to be
  looked up in a document that changes over time (such as which revision a
  cabal file is) belongs in the `plan` step, not in the rules that fetch
  sources.
- Every library unit has a package db of its own, whatever built it. A
  consumer gets one `-package-db` (GHC) or `--package-db=` (`Setup.hs`, after
  `--package-db=clear --package-db=global`) for each unit it needs that is
  not the compiler's, from the `CabalUnitTSet` of `CabalLibraryInfo`, and
  what the registrations refer to as hidden inputs.
- A build tool's environment (`<pkg>_datadir`) is made of absolute paths
  where it is used: hsc2hs writes its data dir into an `#include` of a C
  file it generates elsewhere. `tools/run.sh` and `build_env` in
  `cabal_install/setup.bzl` do it; a data dir of a plan unit is a path
  under its prefix, not a projection, since it only exists when the package
  has data files.
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
  through `toolchains//:haskell`, the downloaded GHC unless told otherwise.
  cabal-solver-plan is not on `PATH` (see "Commands").
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
