#!/bin/sh
# Ask prelude//haskell/ide/ide.bxl how to load a source file, as an IDE would,
# and check that GHC accepts the answer.
#
#   ide.sh [FILE]
#
# This is not a buck2 test, a test cannot run buck2: run it by hand. It needs
# the default toolchain, which is where it takes GHC from.
set -eu

cd "$(buck2 root --kind project)"
file=${1:-root//examples/prelude/Report.hs}

ghc=$(buck2 build toolchains//:haskell --show-full-output | awk '{print $2}')/bin/ghc
flags=$(mktemp)
trap 'rm -f "$flags"' EXIT

# One argument per line: options first, then the sources.
buck2 bxl prelude//haskell/ide/ide.bxl:ide_for_file -- --bios true --file "$file" >"$flags"
xargs -d '\n' "$ghc" -fno-code <"$flags"
