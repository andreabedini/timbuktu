"""
cabal_package: the package-level fields of a package description.

The components (cabal_simple_library, cabal_simple_executable) refer to it for
the package name, the version and the source tree.
"""

load(":providers.bzl", "CabalPackageInfo")

# Fields we carry around because they end up in the package registration.
_metadata_fields = [
    "license",
    "copyright",
    "maintainer",
    "author",
    "stability",
    "homepage",
    "package-url",
    "synopsis",
    "description",
    "category",
]

def _attr_name(field: str) -> str:
    return field.replace("-", "_")

def _cabal_package_impl(ctx: AnalysisContext) -> list[Provider]:
    if ctx.attrs.build_type != "Simple":
        fail("build-type: {} is not supported, only Simple is".format(ctx.attrs.build_type))

    srcs = ctx.attrs.srcs
    if isinstance(srcs, list):
        # Lay the files out the way they are in the package.
        srcdir = ctx.actions.symlinked_dir("srcdir", {src.short_path: src for src in srcs})
    else:
        srcdir = srcs

    metadata = {}
    for field in _metadata_fields:
        value = getattr(ctx.attrs, _attr_name(field))
        if value:
            metadata[field] = value

    return [
        DefaultInfo(default_output = srcdir),
        CabalPackageInfo(
            name = ctx.attrs.package_name or ctx.label.name,
            version = ctx.attrs.version,
            srcdir = srcdir,
            data_dir = ctx.attrs.data_dir,
            data_files = ctx.attrs.data_files,
            metadata = metadata,
        ),
    ]

cabal_package = rule(
    impl = _cabal_package_impl,
    # @unsorted-dict-items
    attrs = {
        # The `name` field, when it differs from the name of the target.
        "package_name": attrs.option(attrs.string(), default = None),
        "version": attrs.string(),
        # The package's source tree: either a directory (in the repository or
        # the output of another rule, e.g. an unpacked sdist) or the list of
        # its files.
        "srcs": attrs.one_of(
            attrs.source(allow_directory = True),
            attrs.list(attrs.source()),
        ),
        "cabal_version": attrs.option(attrs.string(), default = None),
        "build_type": attrs.string(default = "Simple"),
        "data_dir": attrs.string(default = "."),
        "data_files": attrs.list(attrs.string(), default = []),
        # Accepted so that a package description can be transcribed as is.
        "license_file": attrs.option(attrs.string(), default = None),
        "license_files": attrs.list(attrs.string(), default = []),
        "bug_reports": attrs.option(attrs.string(), default = None),
        "tested_with": attrs.option(attrs.string(), default = None),
        "extra_source_files": attrs.list(attrs.string(), default = []),
        "extra_doc_files": attrs.list(attrs.string(), default = []),
        "extra_tmp_files": attrs.list(attrs.string(), default = []),
        "extra_files": attrs.list(attrs.string(), default = []),
    } | {
        _attr_name(field): attrs.option(attrs.string(), default = None)
        for field in _metadata_fields
    },
)
