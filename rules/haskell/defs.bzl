"""
Wrappers around the prelude's Haskell rules.
"""

load("@prelude//rules.bzl", _haskell_binary = "haskell_binary")

def _package_flags(toolchain_libs: list[str]) -> list[str]:
    flags = []
    for lib in toolchain_libs:
        flags.extend(["-package", lib])
    return flags

def haskell_binary(
        toolchain_libs: list[str] = [],
        compiler_flags: list[str] = [],
        linker_flags: list[str] = [],
        **kwargs):
    """haskell_binary with the `toolchain_libs` attribute of the Mercury prelude.

    The upstream prelude has no notion of toolchain libraries: the packages in
    the compiler's global package db are visible when compiling but are not
    passed to the linker. Here each name in `toolchain_libs` becomes a
    `-package` flag for both steps, and nothing else from the global package db
    is visible.

    Args:
        toolchain_libs: names of packages from the compiler's global package db.
        compiler_flags: as in the prelude rule.
        linker_flags: as in the prelude rule.
        **kwargs: passed to the prelude rule.
    """
    package_flags = _package_flags(toolchain_libs)
    _haskell_binary(
        compiler_flags = ["-hide-all-packages"] + package_flags + compiler_flags,
        linker_flags = package_flags + linker_flags,
        **kwargs
    )
