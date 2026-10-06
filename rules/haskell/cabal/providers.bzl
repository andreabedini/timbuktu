"""
Providers shared by the cabal_simple rules.
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

# What a built library leaves behind for its dependents.
CabalUnit = record(
    id = str,
    # A package db containing only this unit.
    package_db = Artifact,
    # What the registration in the package db refers to: interface files,
    # libraries, headers.
    artifacts = list[Artifact],
    # Where the data-files of its package are, for the sake of Paths_<pkg>:
    # the name of the environment variable and its value.
    data_dir = (str, cmd_args),
)

def _project_package_db(unit: CabalUnit) -> cmd_args:
    return cmd_args("-package-db", unit.package_db)

def _project_artifacts(unit: CabalUnit) -> cmd_args:
    return cmd_args(unit.artifacts)

# buildifier: disable=name-conventions
CabalUnitTSet = transitive_set(
    args_projections = {
        "artifacts": _project_artifacts,
        "package_db": _project_package_db,
    },
)

CabalUnitInfo = provider(
    doc = """What configuring a library tells us about it.

    This is the outcome of a dynamic action: for the libraries that come with
    the compiler we have to look into the global package db, for the others we
    have to resolve their dependencies first.
    """,
    # @unsorted-dict-items
    fields = {
        "id": provider_field(str),
        # Package name.
        "name": provider_field(str),
        "version": provider_field(str),
        # The modules one can import: their name, the unit that defines them
        # and their name there. The latter two differ from this unit and the
        # name for reexported modules.
        "exposed_modules": provider_field(dict[str, (str, str)]),
        # The directories of the headers that come with the compiler's
        # libraries this unit depends on, itself included.
        "global_include_dirs": provider_field(list[str]),
    },
)

CabalLibraryInfo = provider(
    doc = "A library that can be listed in build-depends.",
    # @unsorted-dict-items
    fields = {
        # Package name.
        "name": provider_field(str),
        # None for the main library, the name of the sublibrary otherwise.
        "lib_name": provider_field(str | None, default = None),
        # Resolves to CabalUnitInfo
        "unit": provider_field(DynamicValue),
        # The units built from source this library needs, itself included.
        "units": provider_field(CabalUnitTSet),
    },
)

CabalExecutableInfo = provider(
    doc = "An executable that can be listed in build-tool-depends.",
    # @unsorted-dict-items
    fields = {
        "name": provider_field(str),
        "exe": provider_field(Artifact),
        # Environment the executable expects, as Cabal sets it up for build
        # tools (i.e. <pkg>_datadir).
        "env": provider_field(dict[str, cmd_args]),
    },
)

def mangle(name: str) -> str:
    """Turn a package name into something usable in an identifier.

    Args:
      name: a package or program name
    Returns:
      `name` with everything but letters and digits replaced by underscores
    """
    return "".join([c if c.isalnum() else "_" for c in name.elems()])
