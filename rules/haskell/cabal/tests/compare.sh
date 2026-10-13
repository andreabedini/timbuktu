#!/bin/sh
# Check that a file is what is expected, and show how it is not.
#
#   compare.sh EXPECTED ACTUAL
set -eu

diff -u "$1" "$2"
