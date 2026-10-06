"""
Rule to generate a plan
"""

load("@prelude//haskell:toolchain.bzl", "HaskellToolchainInfo")

# cabal-install records the checksum of the cabal file each unit was planned
# with, but not which Hackage revision that is nor how big it is. A revision
# can only be downloaded by number, and buck2 wants the size of a download up
# front to give it a content-based path. This looks both up and adds them to
# the plan as "pkg-cabal-revision" and "pkg-cabal-size".
#
# NOTE: this cannot be done when fetching the sources, because buck2 only
# downloads files it has a checksum for and the list of revisions of a package
# grows over time.
_ADD_CABAL_FILES_SH = """#!/usr/bin/env bash
set -euo pipefail

plan=$1
out=$2

cabal_files=$(mktemp)
trap 'rm -f "$cabal_files"' EXIT

jq --raw-output '
  [ ."install-plan"[]
  | select(."pkg-cabal-sha256" != null and ."pkg-src".repo.uri != null)
  | (."pkg-src".repo.uri | sub("/$"; "") | sub("^http://hackage.haskell.org"; "https://hackage.haskell.org"))
    + "/package/" + ."pkg-name" + "-" + ."pkg-version" + " " + ."pkg-cabal-sha256"
  ] | unique | .[]
' "$plan" |
    while read -r url sha256; do
        id=${url##*/}
        revision=$(curl --fail --silent --show-error --location "$url/revisions/.json" |
            jq --arg sha256 "$sha256" 'map(select(.sha256 == $sha256) | .number) | first')
        if [ "$revision" = null ]; then
            echo "no revision of $id has sha256 $sha256" >&2
            exit 1
        fi
        size=$(curl --fail --silent --show-error --location "$url/revision/$revision.cabal" | wc -c)
        jq --null-input --compact-output --arg id "$id" --argjson revision "$revision" --argjson size "$size" '{($id): {"pkg-cabal-revision": $revision, "pkg-cabal-size": $size}}'
    done >"$cabal_files"

jq --slurpfile cabal_files "$cabal_files" '
  ($cabal_files | add // {}) as $by_pkg
  | ."install-plan" |= map(
      if ."pkg-cabal-sha256" != null then
        . + ($by_pkg[."pkg-name" + "-" + ."pkg-version"] // {})
      else
        .
      end
    )
' "$plan" >"$out"
"""

def _plan_impl(ctx: AnalysisContext) -> list[Provider]:
    builddir = ctx.actions.declare_output("dist-newstyle", dir = True)
    cabal = ctx.attrs._cabal_toolchain[RunInfo]
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
    ctx.actions.run(
        cmd_args(
            cabal,
            "build",
            "-v",
            "--dry-run",
            cmd_args(haskell_toolchain.compiler, format = "--with-compiler={}"),
            cmd_args(builddir.as_output(), format = "--builddir={}"),
            cmd_args(ctx.attrs.project_file, format = "--project-file={}"),
            ctx.attrs.args,
            cmd_args(ctx.attrs.targets),
        ),
        category = "cabal_plan",
    )

    add_cabal_files_sh = ctx.actions.write("add_cabal_files.sh", _ADD_CABAL_FILES_SH, is_executable = True)
    plan = ctx.actions.declare_output("plan.json")
    ctx.actions.run(
        cmd_args(add_cabal_files_sh, builddir.project("cache/plan.json"), plan.as_output()),
        category = "cabal_plan_cabal_files",
        local_only = True,
    )
    return [DefaultInfo(default_output = plan)]

plan = rule(
    impl = _plan_impl,
    attrs = {
        "project_file": attrs.source(doc = "The project file to use."),
        "targets": attrs.list(
            attrs.string(),
            default = ["all"],
            doc = "The targets to build.",
        ),
        "args": attrs.list(
            attrs.arg(),
            default = [],
            doc = "Additional arguments to pass to cabal-install",
        ),
        "_cabal_toolchain": attrs.toolchain_dep(default = "toolchains//:cabal"),
        "_haskell_toolchain": attrs.toolchain_dep(
            default = "toolchains//:haskell",
            providers = [HaskellToolchainInfo],
        ),
    },
)
