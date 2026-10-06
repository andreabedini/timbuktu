#!/bin/sh
# Load the library in the GHCi of a haskell_ghci target and call it.
#
#   ghci.sh DIR
#
# DIR is the output of the haskell_ghci target.
set -eu

out=$(printf '%s\n' 'import Report' 'mapM_ putStrLn report' | "$1/ghci" 2>&1) || {
    echo "$out"
    exit 1
}
echo "$out"
echo "$out" | grep -q 'The answer is (42,42)'
echo "$out" | grep -q 'Embedded: Hello from a data file'
