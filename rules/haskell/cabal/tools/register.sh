#!/bin/sh
# Register a library in a package db of its own: Cabal's `register` step.
#
#   register.sh DB UNIT_ID CONF ABI_HASH GHC_PKG [ARG]...
#
# CONF is the InstalledPackageInfo of the unit. It refers to the outputs of
# other actions (interface files, libraries, ...) by their path from the root
# of the project, written as ${projectroot}/path. GHC knows nothing about
# that, but it knows ${pkgroot}, the directory the package db is in: we
# express one in terms of the other, so that the registration is valid from
# any working directory and wherever the project is.
set -eu

db=$1
unit_id=$2
conf=$3
abi_hash=$4
shift 4

# DB is relative to the root of the project, which is where we are.
up=$(dirname "$db" | sed 's|[^/][^/]*|..|g')

mkdir -p "$db"
{
    sed "s|\${projectroot}|\${pkgroot}/$up|g" "$conf"
    echo
    if [ -s "$abi_hash" ]; then
        printf 'abi: %s\n' "$(cat "$abi_hash")"
    fi
} >"$db/$unit_id.conf"

"$@" recache --package-db="$db"

# Not part of the package db, and it would make the output look different
# every time.
rm -f "$db/package.cache.lock"
