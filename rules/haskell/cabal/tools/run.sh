#!/bin/sh
# Run a command from inside a package's source directory, the way Cabal does.
#
#   run.sh DIR [--path=DIR | --mkdir=DIR | NAME=VALUE]... -- COMMAND [ARG]...
#
# Relative paths, in the options and in COMMAND, are relative to DIR.
set -eu

cd "$1"
shift

while [ "$1" != "--" ]; do
    case "$1" in
    --path=*) PATH="$PWD/${1#--path=}:$PATH" ;;
    --mkdir=*) mkdir -p "${1#--mkdir=}" ;;
    *=*) export "$1" ;;
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
