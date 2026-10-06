# CLAUDE.md

Guidance for Claude Code when working in this repository.

## What this is

Experiments in building Haskell with Buck2, focused on projects that use cabal.
Two approaches live side by side:

1. Hand-written targets using the Haskell rules from the Buck2 prelude
   (`BUCK`, `Cabal/BUCK`, `tmp/alex-3.5.1.0/BUCK`).
2. Mapping a cabal-install build plan (`plan.json`) onto a Buck2 target graph,
   building each unit through `Setup.hs` the way cabal-install does
   (`rules/haskell/cabal_install/`, `projects/`).

This is a research sandbox, not a product. History is mostly `wip` commits, the
code is reworked wholesale, and large parts are commented out or left
half-migrated. Do not assume a file is in use because it exists.

## Current state (2026-10-06)

The repository runs on the upstream prelude bundled with buck2, with a
downloaded GHC 9.12.2. It used to depend on the Mercury fork of the prelude
(see "Prelude" below); that dependency is gone.

Built and run on that setup:

- `//:main`, `//rules/haskell/helpers:parse_fields`, `//tmp/alex-3.5.1.0:alex`
- `//rules/haskell/cabal_install/helpers:setup_simple` and `:setup_configure`
- `toolchains//:something`
- `//projects/shake:plan`, and the whole plan through `interpret_plan`: the
  `shake` executable unit builds and prints its version.

Known broken or untested:

- `Cabal/BUCK` and `tmp/BUCK` load the deleted `rules/haskell/toolchain.bzl`.
- `rules/haskell/LibraryInfo.bzl` loads `build_info_fields`, which
  `BuildInfo.bzl` does not define.
- Every project other than shake still pins `index-state: 2024-09-19`, which
  has no install plan for GHC 9.12. The plans embedded in
  `projects/aeson-diff/BUCK` and `projects/cabal-install/BUCK` were made with
  GHC 9.8.2 / 9.10.1 and name units the current toolchain does not have.
- `build_legacy.bzl` and the legacy branch of `interpret_plan.bzl` have not
  run since the move; shake's plan has no legacy units.
- `cabal_install.bxl:make_plan` looks up `toolchains//:ghc`, which does not
  exist. `Cabal/bxl/import_toolchain.bxl` and
  `rules/haskell/helpers/import_toolchain.hs` belong to the old generated
  toolchain flow.
- `alex` builds but crashes at run time: the `Paths_<pkg>` template in
  `rules/haskell/cabal/paths.bzl` does `read "3.5.1" :: Version`.
- `README.md` describes the old toolchain flow.

## Commands

```sh
mise install                       # buck2 (latest prerelease), buildifier, lefthook
buck2 targets //projects/shake:    # what parses in one package
buck2 build //:main                # smallest Haskell target
buck2 build //projects/shake:plan --show-output   # cabal dry-run -> plan.json
buck2 build toolchains//:haskell   # downloads the GHC bindist (about 290 MB)
buildifier BUCK path/to/file.bzl   # format Starlark
buck2 starlark lint path/to/file.bzl
```

Units of an interpreted plan are targets named by unit-id, for example
`//projects/shake:shake-0.19.9-e-shake-<hash>`; `buck2 run <target> -- --version`
runs an executable unit.

Avoid `//...`: it walks into `.jj/` and `.claude/worktrees/`, which hold other
copies of the tree.

There are no tests; "does it build and run" is the check.

`toolchains/ghcup/metadata.bzl` (about 16.8k lines) is generated, never edit it
by hand:

```sh
yq .ghcupDownloads ~/.ghcup/cache/ghcup-0.0.9.yaml -o json | sed 's/null/None/' > toolchains/ghcup/metadata.bzl
```

To refresh a project's plan: build `:plan`, then replace the JSON inside the
`interpret_plan(...)` call in the project's `BUCK` with the new `plan.json`.

## Layout

- `.buckconfig` — cells `root`, `prelude`, `toolchains`; the prelude is
  `[external_cells] prelude = bundled`. Remote execution (BuildBuddy) is
  commented out; `platforms/` holds the matching RE platform definition, also
  unused.
- `prelude/` — no longer used by the build. It is a git worktree of
  `../buck2-prelude` (the Mercury fork, mid-2025) kept for reference; the
  branch `timbuktu-prelude` in that clone holds its commit.
- `toolchains/` — `BUCK` wires system cxx/python/genrule toolchains plus
  `:haskell` (GHC 9.12.2) and `:cabal` (3.14.2.0). `ghcup/defs.bzl` picks a
  bindist URL and hash out of GHCup's metadata for the host OS/arch and wraps it
  in `http_archive`. `defs.bzl` builds `HaskellToolchainInfo` from the unpacked
  bindist and exposes the global package db as a dynamic value
  (`HaskellPackageDbInfo`, id/name/version per unit); `something` is a debug
  rule that prints it. Nothing consumes that value yet.
- `rules/haskell/defs.bzl` — `haskell_binary` wrapper that adds a
  `toolchain_libs` attribute (see "Design rules").
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
  - `pre_existing_unit.bzl` — units from the compiler's global package db;
    carries only a `UnitInfo`.
  - `common.bzl` — providers (`UnitInfo`, `PackageConfTSet`, `CabalPackageInfo`,
    `ExeDependInfo`), configure arguments, install dirs, and `mkProviders`,
    which adapts a built unit to the prelude's `HaskellLibraryProvider` /
    `HaskellLinkInfo`.
  - `plan_json_to_buildozer_script.jq` — an alternative path: turn a plan into
    a buildozer script (used by `cabal_install.bxl:thing`). It emits rule kinds
    (`configured_unit`, `project_toolchain`, …) that are not defined anywhere.
  - `helpers/setup_simple.hs` — `Setup.hs` with a `postConf` hook that dumps
    `local-build-info.json` (components, modules, GHC arguments).
- `rules/haskell/cabal/` — `Paths_<pkg>` module and `cabal_macros.h` generators.
- `rules/haskell/hackage.bzl` — `hackage_package` (`http_archive` from Hackage,
  no cabal-file revisions) and `module_path`.
- `rules/haskell/helpers/defs.bzl` — an experimental from-scratch
  `haskell_library` that drives `ghc --make` directly; hardcodes GHC 9.12.2
  unit-ids. Not loaded by anything.
- `projects/<name>/` — a `cabal.project` pinned by `index-state`, plus a `BUCK`
  with a `plan(...)` target and, where a plan has been pasted in, an
  `interpret_plan(...)` call. The embedded plans make some `BUCK` files
  20–80 KB; search them, don't read them whole.
- `tmp/` — scratch. `tmp/alex-3.5.1.0`, `tmp/binary-0.8.9.2` and
  `tmp/Cabal-syntax-3.14.0.0` are unpacked upstream sdists (don't edit their
  sources); `tmp/tmp.bzl` is an experiment that configures with `setup_simple`
  and then invokes GHC from a dynamic action using the dumped build info.
- `cabal_project_dynamic.bzl` — entirely commented out; an abandoned
  `dynamic_output` design kept for reference.

## Design rules that matter

- In the plan interpreter, dependencies are always passed by unit-id:
  `--exact-configuration`, `--dependency=<pkg>[:<lib>]=<unit-id>`. Never let
  Cabal choose a unit by name there. Both the global package db and
  cabal-install plans speak unit-ids.
- Hand-written targets name compiler-provided packages with `toolchain_libs`
  on the `haskell_binary` from `rules/haskell/defs.bzl`. It becomes
  `-hide-all-packages -package <name>` when compiling and `-package <name>`
  when linking. The upstream prelude has no equivalent: without it, packages
  from the global db are visible to the compiler but missing at link time.
  This selects by name, not unit-id; doing better needs the dynamic package db
  value.
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
- Package dbs are composed from a transitive set of `.conf` files
  (`PackageConfTSet`) and recached per consumer, starting from
  `--package-db=clear --package-db=global`.
- Actions that must run inside the source directory write a small bash script
  (`cd <srcdir>` then a command made relative with `relative_to = srcdir`) and
  declare inputs/outputs through `hidden`.
- Tools come from the toolchain (`HaskellToolchainInfo.compiler`,
  `.packager`), not from `PATH`.

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
- Version control is jj (colocated). The `main` bookmark is well behind the
  working copy; current work sits on unnamed descendants of it.

## Environment

- `mise.toml` installs buck2, buildifier and lefthook. It sets no environment.
- GHC, cabal and ghcup from `~/.ghcup` are on `PATH`, but builds go through
  `toolchains//:haskell` and `toolchains//:cabal`.
- Sibling checkouts under `../`: `buck2-prelude` (jj clone of the prelude fork,
  remotes `origin`, `MercuryTechnologies`, `upstream`), `buck2-prelude-temp`
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
- `buildifier` on `PATH` is a mise stub that tries to install itself and cannot
  inside the sandbox; ask the user to run it.
