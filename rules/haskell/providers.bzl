"""
What a library or an executable hands to whatever depends on it.

Every rule set speaks these: the cabal_simple rules, the plan interpreter and
haskell_unit. A library of one can be a dependency of the others, and so can
an executable as a build tool.
"""

# What a library that is not in the package db of the compiler takes to be
# used.
CabalUnit = record(
    # None when it takes reading the package db to know.
    id = str | None,
    # A package db with this unit: one of its own for a library we built.
    package_db = Artifact,
    # What the registration in the package db refers to: interface files,
    # libraries, headers.
    artifacts = list[Artifact],
    # Where the data-files of its package are, for the sake of Paths_<pkg>:
    # the name of the environment variable and its value. None for a unit we
    # did not build.
    data_dir = [(str, cmd_args), None],
)

def _project_package_db(unit: CabalUnit) -> cmd_args:
    return cmd_args("-package-db", unit.package_db)

def _project_setup_package_db(unit: CabalUnit) -> cmd_args:
    return cmd_args(unit.package_db, format = "--package-db={}")

def _project_artifacts(unit: CabalUnit) -> cmd_args:
    return cmd_args(unit.artifacts)

# buildifier: disable=name-conventions
CabalUnitTSet = transitive_set(
    args_projections = {
        "artifacts": _project_artifacts,
        # For GHC
        "package_db": _project_package_db,
        # For Setup.hs
        "setup_package_db": _project_setup_package_db,
    },
)

CabalUnitInfo = provider(
    doc = """What configuring a library tells us about it.

    This is the outcome of a dynamic action: for the libraries that come with
    the compiler we have to look into the global package db, for the others we
    have to resolve their dependencies first, or read the registration a
    Setup.hs wrote.
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
        # Package name. None for a unit only known by its id (see
        # root//rules/haskell:unit.bzl).
        "name": provider_field(str | None),
        # None for the main library, the name of the sublibrary otherwise.
        "lib_name": provider_field(str | None, default = None),
        # The unit-id, when it is known during analysis: always for a library
        # we build, only when it is given for one that is already in a package
        # db. The plan interpreter cannot do without it.
        "id": provider_field(str | None, default = None),
        # Resolves to CabalUnitInfo
        "unit": provider_field(DynamicValue),
        # The units this library needs that are not in the package db of the
        # compiler, itself included.
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
