#!/bin/sh
# Run a command from inside a package's source directory, the way Cabal does.
#
#   run.sh DIR [--path=DIR | --mkdir=DIR | NAME=PATH]... -- COMMAND [ARG]...
#
# Relative paths, in the options and in COMMAND, are relative to DIR. The
# environment variables (a build tool's <pkg>_datadir) get absolute paths: a
# tool can write them into a file somewhere else, as hsc2hs does with
# `#include "<datadir>/template-hsc.h"`.
set -eu

cd "$1"
shift

while [ "$1" != "--" ]; do
    case "$1" in
    --path=*) PATH="$PWD/${1#--path=}:$PATH" ;;
    --mkdir=*) mkdir -p "${1#--mkdir=}" ;;
    *=/*) export "$1" ;;
    *=*) export "${1%%=*}=$PWD/${1#*=}" ;;
    *)
        echo "run.sh: unexpected argument: $1" >&2
        exit 2
        ;;
    esac
    shift
done
shift

export PATH
exec "$@"
