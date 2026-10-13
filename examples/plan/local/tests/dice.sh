#!/bin/sh
# Run the executable of the local package: five rolls of a die.
#
#   dice.sh EXE
set -eu

out=$("$1")
echo "$out" | grep -Eqx '[1-6]( [1-6]){4}'
