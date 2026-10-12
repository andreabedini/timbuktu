#!/bin/sh
# Run the executable that takes its packages from haskell_unit targets.
#
#   count.sh EXE
set -eu

test "$("$1")" = '[("a",3),("b",2),("c",1)]'
