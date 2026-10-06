"""
Wrappers around the prelude's Haskell rules.

The upstream prelude has no notion of toolchain libraries: the packages in the
compiler's global package db are visible when compiling but are not passed to
the linker. With these wrappers each name in `toolchain_libs` becomes a
`-package` flag for both steps, and nothing else from the global package db is
visible.
"""

load("@prelude//rules.bzl", _haskell_binary = "haskell_binary", _haskell_library = "haskell_library")

def _package_flags(toolchain_libs: list[str]) -> list[str]:
    flags = []
    for lib in toolchain_libs:
        flags.extend(["-package", lib])
    return flags

def _compiler_flags(toolchain_libs: list[str]) -> list[str]:
    # NOTE: -global-package-db is what GHC does anyway. It is for the sake of
    # prelude//haskell/ide/ide.bxl, which takes the global package db away
    # before it adds these flags.
    return ["-global-package-db", "-hide-all-packages"] + _package_flags(toolchain_libs)

def haskell_binary(
        toolchain_libs: list[str] = [],
        compiler_flags: list[str] = [],
        linker_flags: list[str] = [],
        **kwargs):
    """haskell_binary with the `toolchain_libs` attribute of the Mercury prelude.

    Args:
        toolchain_libs: names of packages from the compiler's global package db.
        compiler_flags: as in the prelude rule.
        linker_flags: as in the prelude rule.
        **kwargs: passed to the prelude rule.
    """
    _haskell_binary(
        compiler_flags = _compiler_flags(toolchain_libs) + compiler_flags,
        linker_flags = _package_flags(toolchain_libs) + linker_flags,
        **kwargs
    )

def haskell_library(
        toolchain_libs: list[str] = [],
        compiler_flags: list[str] = [],
        linker_flags: list[str] = [],
        **kwargs):
    """haskell_library with the `toolchain_libs` attribute of the Mercury prelude.

    Args:
        toolchain_libs: names of packages from the compiler's global package db.
        compiler_flags: as in the prelude rule.
        linker_flags: as in the prelude rule; they are for its shared library.
        **kwargs: passed to the prelude rule.
    """
    _haskell_library(
        compiler_flags = _compiler_flags(toolchain_libs) + compiler_flags,
        linker_flags = _package_flags(toolchain_libs) + linker_flags,
        **kwargs
    )
