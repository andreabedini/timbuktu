#!/bin/sh
# Check that the rules refuse what they do not know or do not support, and
# say so: every directory in refusals/ is a case, a BUCK file (BUCK.in) that
# has to fail with the message in `expected`, and the files it needs.
#
#   sh rules/haskell/tests/refusals.sh [CASE]...
#
# Run it by hand from the root of the repository: it runs buck2, which a test
# cannot. Each case becomes a package in scratch/ (ignored by version
# control) while it is built; the BUCK file is removed afterwards, so that
# `//...` is not left with packages that fail.
set -u

here=rules/haskell/tests
status=0

for case in ${*:-$(ls "$here/refusals")}; do
    dir=$here/scratch/$case
    mkdir -p "$dir"
    cp "$here/refusals/$case/"* "$dir/"
    mv "$dir/BUCK.in" "$dir/BUCK"
    if buck2 build "//$dir:" >"$dir/log" 2>&1; then
        echo "FAILED: $case: it builds"
        status=1
    elif grep -qF -f "$here/refusals/$case/expected" "$dir/log"; then
        echo "ok: $case"
    else
        echo "FAILED: $case: not with \"$(cat "$here/refusals/$case/expected")\""
        grep -v '^\[' "$dir/log" | tail -n 20
        status=1
    fi
    rm -f "$dir/BUCK"
done

exit $status
