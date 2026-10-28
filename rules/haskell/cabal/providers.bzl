"""
Providers of the cabal_simple rules. What a library or an executable hands to
its dependents is in timbuktu//rules/haskell:providers.bzl, shared with the other
rule sets.
"""

CabalCxxLinkInfo = provider(
    doc = """What linking against the C and C++ libraries of a library takes:
    those of its cxx_deps, and those of the libraries it depends on. Cabal
    passes them to hsc2hs, from the registrations of the dependencies.""",
    fields = {
        # A LinkInfosTSet, of the static_pic link infos.
        "libs": provider_field(typing.Any),
    },
)

CabalPackageInfo = provider(
    doc = "The package-level part of a package description.",
    # @unsorted-dict-items
    fields = {
        "name": provider_field(str),
        "version": provider_field(str),
        # The root of the package's source tree. Every path in the package
        # description is relative to it.
        "srcdir": provider_field(Artifact),
        # The files of the source tree, by their path in it, when `srcs` is
        # a list of files: a component lays other directories over them (see
        # `generated` in simple.bzl). None when `srcs` is a directory.
        "files": provider_field(dict[str, Artifact] | None, default = None),
        "data_dir": provider_field(str),
        "data_files": provider_field(list[str]),
        # The fields that end up in the package registration (license,
        # synopsis, ...), keyed by their cabal name.
        "metadata": provider_field(dict[str, str]),
    },
)
