#!/bin/sh
# Run the shake that a dynamic_plan built.
#
#   shake.sh EXE
set -eu

"$1" --version | grep -q '^Shake build system, version 0\.19\.9'
