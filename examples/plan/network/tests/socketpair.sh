#!/bin/sh
# Run the executable that uses the network unit of the plan.
#
#   socketpair.sh EXE
set -eu

test "$("$1")" = 'hello through a socket pair'
