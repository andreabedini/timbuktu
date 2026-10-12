"""
Providers of the cabal_simple rules. What a library or an executable hands to
its dependents is in root//rules/haskell:providers.bzl, shared with the other
rule sets.
"""

CabalPackageInfo = provider(
    doc = "The package-level part of a package description.",
    # @unsorted-dict-items
    fields = {
        "name": provider_field(str),
        "version": provider_field(str),
        # The root of the package's source tree. Every path in the package
        # description is relative to it.
        "srcdir": provider_field(Artifact),
        "data_dir": provider_field(str),
        "data_files": provider_field(list[str]),
        # The fields that end up in the package registration (license,
        # synopsis, ...), keyed by their cabal name.
        "metadata": provider_field(dict[str, str]),
    },
)
