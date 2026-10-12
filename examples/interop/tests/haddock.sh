#!/bin/sh
# Check that a haskell_haddock target documented the library.
#
#   haddock.sh DIR
#
# DIR is the output of the haskell_haddock target.
set -eu

test -f "$1/index.html"
grep -q 'What the library of' "$1/Report.html"
