"""
Build rules that reproduce Cabal's `build-type: Simple`.

    cabal_package(
        name = "hello",
        version = "0.1.0.0",
        srcs = glob(["**"]),
    )

    cabal_simple_library(
        name = "lib",
        package = ":hello",
        hs_source_dirs = ["src"],
        exposed_modules = ["Hello"],
        build_depends = [":base"],
        default_language = "Haskell2010",
    )

    haskell_unit(name = "base")

`haskell_unit` is not one of these rules: it is for whatever is already in a
package db, here a library that comes with the compiler. Load it from
root//rules/haskell:defs.bzl.
"""

load(":package.bzl", _cabal_package = "cabal_package")
load(
    ":simple.bzl",
    _cabal_simple_executable = "cabal_simple_executable",
    _cabal_simple_library = "cabal_simple_library",
    _cabal_simple_test = "cabal_simple_test",
)

cabal_package = _cabal_package
cabal_simple_library = _cabal_simple_library
cabal_simple_executable = _cabal_simple_executable
cabal_simple_test = _cabal_simple_test
