"""
cabal_package: the package-level fields of a package description.

The components (cabal_simple_library, cabal_simple_executable) refer to it for
the package name, the version and the source tree.
"""

load(":fields.bzl", "PACKAGE_FIELDS", "check_spec_version", "field_attrs")
load(":providers.bzl", "CabalPackageInfo")

# Fields we carry around because they end up in the registration of a
# library, see simple.bzl.
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

# The build types of Cabal 3.14. The rules build Simple; the others run code
# of the package's own at build time, which only its Setup.hs can do (see
# root//rules/haskell/cabal_install).
_BUILD_TYPES = ["Simple", "Configure", "Custom", "Hooks"]

def _attr_name(field: str) -> str:
    return field.replace("-", "_")

def _cabal_package_impl(ctx: AnalysisContext) -> list[Provider]:
    check_spec_version(ctx.label, ctx.attrs.cabal_version)
    build_type = ctx.attrs.build_type
    if build_type not in _BUILD_TYPES:
        fail("{}: build-type `{}` is not one Cabal had when these rules were written".format(ctx.label, build_type))
    if build_type != "Simple":
        fail("{}: build-type {} is not supported, only Simple is; a build plan builds the others".format(ctx.label, build_type))

    srcs = ctx.attrs.srcs
    root = ctx.attrs.root
    if isinstance(srcs, list):
        # Lay the files out the way they are in the package, the package
        # being `root` when it is a directory of the BUCK file's.
        prefix = root + "/" if root else ""
        layout = {}
        for src in srcs:
            if not src.short_path.startswith(prefix):
                fail("{}: {} is not in the package's directory, {}".format(ctx.label, src.short_path, root))
            layout[src.short_path.removeprefix(prefix)] = src
        srcdir = ctx.actions.symlinked_dir("srcdir", layout)
    elif root:
        fail("{}: `root` is for `srcs` given as a list of files".format(ctx.label))
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
        # Where the package is, when `srcs` lists files from a directory
        # above it (a BUCK file for several packages, as a plan's is): the
        # directory, relative to the BUCK file, that has the .cabal file.
        "root": attrs.option(attrs.string(), default = None),
    } | field_attrs(PACKAGE_FIELDS),
)
