#!/bin/sh
# Check that the generator makes the targets of every transcription here
# (but `ghc`, which has no .cabal file): `generate.bxl:check` compares what
# it would generate with each package, attribute by attribute. The options
# are those of the table in ../README.md.
#
#   sh examples/cabal_simple/tests/generate.sh
#
# Run it by hand from the root of the repository: it runs buck2, which a test
# cannot.
set -u

ghc=--compiler-prefix=//examples/cabal_simple/ghc:
status=0

check() {
    package=$1
    shift
    if buck2 bxl //rules/haskell/cabal/generate.bxl:check -- --against "//examples/cabal_simple/$package" "$@" >/dev/null 2>"${TMPDIR:-/tmp}/generate-$package.log"; then
        echo "ok: $package"
    else
        echo "FAILED: $package"
        grep -v '^\[' "${TMPDIR:-/tmp}/generate-$package.log" | tail -n 30
        status=1
    fi
}

check hello --cabal-file examples/cabal_simple/hello/hello.cabal
check cxx --cabal-file examples/cabal_simple/cxx/uses-cxx.cabal --pkgconfig twice=:twice
check lexer --cabal-file examples/cabal_simple/lexer/lexer.cabal --tool alex:alex=//examples/cabal_simple/alex:exe
check cparse --cabal-file examples/cabal_simple/cparse/cparse.cabal "$ghc" --dep language-c=//examples/cabal_simple/language-c:lib
check alex --sdist //examples/cabal_simple/alex:alex-3.5.1.0 --tests false
check happy-lib --sdist //examples/cabal_simple/happy-lib:happy-lib-2.2 "$ghc" --tests false
check happy --sdist //examples/cabal_simple/happy:happy-2.2 "$ghc" --dep happy-lib=//examples/cabal_simple/happy-lib:lib --tests false
check language-c --sdist //examples/cabal_simple/language-c:language-c-0.10.2 "$ghc" --tool happy:happy=//examples/cabal_simple/happy:exe --tool alex:alex=//examples/cabal_simple/alex:exe --tests false

exit $status
