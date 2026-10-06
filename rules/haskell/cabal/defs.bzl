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

    cabal_toolchain_library(name = "base")
"""

load(":package.bzl", _cabal_package = "cabal_package")
load(
    ":simple.bzl",
    _cabal_simple_executable = "cabal_simple_executable",
    _cabal_simple_library = "cabal_simple_library",
    _cabal_simple_test = "cabal_simple_test",
    _cabal_toolchain_library = "cabal_toolchain_library",
)

cabal_package = _cabal_package
cabal_simple_library = _cabal_simple_library
cabal_simple_executable = _cabal_simple_executable
cabal_simple_test = _cabal_simple_test
cabal_toolchain_library = _cabal_toolchain_library
