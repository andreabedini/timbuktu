#!/bin/sh
# Generate a lexer with alex.
#
#   alex.sh ALEX DATADIR FILE.x
set -eu

out=$(mktemp)
trap 'rm -f "$out"' EXIT

alex_datadir=$2 "$1" --outfile="$out" "$3"
grep -q '^alex_scan_tkn' "$out"
