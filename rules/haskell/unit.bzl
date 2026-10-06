"""
A unit that is already in a package db.

    haskell_unit(name = "base")
    haskell_unit(name = "base", id = "base-4.21.0.0-b7a5")
    haskell_unit(name = "foo", db = "path/to/package.conf.d", inputs = [...])

The package db is the one that comes with the compiler unless `db` says
otherwise. The unit is found there by its id when one is given, by the name of
its package otherwise; either way GHC is told its id whenever we are the ones
calling it.

Every rule set can depend on one, each one looking at what it understands:

- The cabal_simple rules wait for a dynamic value: the registration of the
  unit is read off the package db when it is needed. Nothing has to be known
  beforehand.

- The plan interpreter gives `--dependency=<name>=<id>` to Setup.hs, and
  builds its command lines during analysis: it needs both as attributes,
  which a plan has.

- The Haskell rules of the prelude can only say `-package <name>`, so they
  need the name of the package as an attribute and have no use for the id.
  They do the linking themselves, and for that the unit gives them a file
  with the options for the linker, written when the package db is read.
"""

load("@prelude//haskell:library_info.bzl", "HaskellLibraryInfo", "HaskellLibraryInfoTSet", "HaskellLibraryProvider")
load("@prelude//haskell:link_info.bzl", "HaskellLinkInfo")
load("@prelude//linking:link_info.bzl", "LinkStyle")
load(
    "//rules/haskell/cabal:ghc_toolchain.bzl",
    "GhcDynamicInfo",
    "GhcToolchainInfo",
    "ghc_packages",
    "ghc_toolchain_attrs",
)
load("//rules/haskell/cabal:prelude.bzl", "prelude_library_attrs", "prelude_unit_link_providers")
load("//rules/haskell/cabal:providers.bzl", "CabalLibraryInfo", "CabalUnit", "CabalUnitInfo", "CabalUnitTSet")
load("//rules/haskell/cabal_install:common.bzl", "PackageConfTSet", "UnitInfo")

def _parse_exposed_modules(unit_id: str, text: str) -> dict[str, (str, str)]:
    """The exposed-modules of a registration: `A B` or `A, B from unit-id:C`"""
    exposed = {}
    for item in text.split(",") if "," in text else text.split():
        words = item.split()
        if len(words) == 3 and words[1] == "from":
            defining_unit, _, original = words[2].rpartition(":")
            exposed[words[0]] = (defining_unit, original)
        elif len(words) == 1:
            exposed[words[0]] = (unit_id, words[0])
    return exposed

def _resolve_impl(
        actions: AnalysisActions,
        ghc: ResolvedDynamicValue,
        db: list[ArtifactValue],
        label: Label,
        id: str | None,
        name: str | None,
        version: str | None,
        link_static: OutputArtifact,
        link_shared: OutputArtifact) -> list[Provider]:
    ghc_info = ghc.providers[GhcDynamicInfo]
    if db:
        # The package db given, on top of the one of the compiler.
        packages, by_name = ghc_packages(db[0].read_string())
        where = "the package db"
    else:
        packages, by_name = ghc_info.packages, ghc_info.by_name
        where = "the package db of GHC {}".format(ghc_info.version)

    if id:
        if id not in packages:
            fail("{}: there is no unit `{}` in {}".format(label, id, where))
        pkg = packages[id]
        if name and pkg.name != name:
            fail("{}: the unit `{}` is of the package `{}`, not `{}`".format(label, id, pkg.name, name))
    else:
        if name not in by_name:
            fail("{}: there is no package called `{}` in {}".format(label, name, where))
        pkg = packages[by_name[name]]
    if version and pkg.version != version:
        fail("{}: the unit `{}` in {} has version {}, not {}".format(label, pkg.id, where, pkg.version, version))

    # This unit and what it depends on, each one after what it depends on.
    closure = []
    seen = {}
    todo = [(pkg.id, False)]
    steps = 2
    for p in packages.values():
        steps += 2 + 2 * len(p.depends)
    for _ in range(steps):
        if not todo:
            break
        unit, visited = todo.pop()
        if visited:
            closure.append(packages[unit])
        elif unit not in seen and unit in packages:
            seen[unit] = None
            todo.append((unit, True))
            todo.extend([(d, False) for d in packages[unit].depends])

    # Headers of this unit and of what it depends on
    include_dirs = {}
    for p in closure:
        for d in p.include_dirs:
            include_dirs[d] = None

    # What a linker needs to link against this unit, for the sake of rules
    # that do not leave linking to GHC (see cabal/prelude.bzl). A linker wants
    # a library after what needs it. The run-time system is left out: it comes
    # in several flavours and GHC picks one.
    static = []
    shared = []
    for p in reversed(closure):
        if p.name == "rts":
            continue
        static += ["-L" + d for d in p.library_dirs]
        static += ["-l" + lib for lib in p.hs_libraries]
        shared += ["-L" + d for d in p.dynamic_library_dirs]
        shared += ["-l{}-ghc{}".format(lib, ghc_info.version) for lib in p.hs_libraries]
        for flags in (static, shared):
            flags.extend(["-l" + lib for lib in p.extra_libraries])
            flags.extend(p.ld_options)
    actions.write(link_static, static)
    actions.write(link_shared, shared)

    return [
        CabalUnitInfo(
            id = pkg.id,
            name = pkg.name,
            version = pkg.version,
            exposed_modules = _parse_exposed_modules(pkg.id, pkg.exposed_modules),
            global_include_dirs = list(include_dirs.keys()),
        ),
    ]

_resolve = dynamic_actions(
    impl = _resolve_impl,
    attrs = {
        "db": dynattrs.list(dynattrs.artifact_value()),
        "ghc": dynattrs.dynamic_value(),
        "id": dynattrs.value(str | None),
        "label": dynattrs.value(Label),
        "link_shared": dynattrs.output(),
        "link_static": dynattrs.output(),
        "name": dynattrs.value(str | None),
        "version": dynattrs.value(str | None),
    },
)

def _haskell_unit_impl(ctx: AnalysisContext) -> list[Provider]:
    toolchain = ctx.attrs._ghc[GhcToolchainInfo]
    id = ctx.attrs.id
    version = ctx.attrs.version
    inputs = ctx.attrs.inputs
    deps = ctx.attrs.deps

    # A unit given by id has the name of a package only if it is told.
    name = ctx.attrs.package_name or (None if id else ctx.label.name)

    db = None if ctx.attrs.db == "global" else ctx.attrs.db
    if inputs and not db:
        fail("{}: `inputs` are what the registrations of `db` refer to, and there is no `db`".format(ctx.label))

    # What is in the package db, when it is not the one the toolchain already
    # knows about.
    dump = []
    if db:
        out = ctx.actions.declare_output("package-db")
        cmd = cmd_args(
            toolchain.ghc_pkg,
            "dump",
            # NOTE: ghc-pkg only shows the package dbs it is told, and what
            # this one depends on is likely to be in the compiler's.
            "--global",
            cmd_args(db, format = "--package-db={}"),
            "--expand-pkgroot",
            ">",
            out.as_output(),
            delimiter = " ",
        )
        ctx.actions.run(
            cmd_args("sh", "-c", cmd),
            category = "ghc_info",
            identifier = "package-db",
            # The answer has paths of this machine in it.
            local_only = True,
        )
        dump.append(out)

    link_static = ctx.actions.declare_output("link-static.args")
    link_shared = ctx.actions.declare_output("link-shared.args")
    unit = ctx.actions.dynamic_output_new(_resolve(
        ghc = toolchain.dynamic,
        db = dump,
        label = ctx.label,
        id = id,
        name = name,
        version = version,
        link_shared = link_shared.as_output(),
        link_static = link_static.as_output(),
    ))

    # The package db, for whoever is told the unit by id: the units of the
    # compiler need none.
    children = [dep[CabalLibraryInfo].units for dep in deps if CabalLibraryInfo in dep]
    if db:
        units = ctx.actions.tset(
            CabalUnitTSet,
            value = CabalUnit(id = id, package_db = db, artifacts = inputs, data_dir = None),
            children = children,
        )
    else:
        units = ctx.actions.tset(CabalUnitTSet, children = children)

    providers = [
        DefaultInfo(sub_targets = {
            "link-shared": [DefaultInfo(default_output = link_shared)],
            "link-static": [DefaultInfo(default_output = link_static)],
        }),
        # For the cabal_simple rules
        CabalLibraryInfo(
            name = name,
            unit = unit,
            units = units,
        ),
    ]

    # For the linking of the prelude
    providers += prelude_unit_link_providers(ctx, link_static, link_shared, inputs, deps)

    # For the plan interpreter, which finds the units of the compiler by
    # itself and only wants to hear how they are called.
    if id and name and not db:
        providers.append(UnitInfo(
            id = id,
            name = name,
            version = version or "",
            lib_name = ctx.attrs.lib_name,
            package_conf = None,
            package_conf_tset = ctx.actions.tset(PackageConfTSet),
        ))

    # For the compiling of the prelude: `-package <name>`
    if name:
        # NOTE: the field wants an artifact and the package db of the compiler
        # is not one. Nothing reads it there: a package db is only given to
        # GHC out of a HaskellLinkInfo.
        prelude_db = db or ctx.actions.write("no-package-db", "")
        libs = {}
        prof_libs = {}
        for link_style in LinkStyle:
            libs[link_style], prof_libs[link_style] = [
                HaskellLibraryInfo(
                    name = name,
                    db = prelude_db,
                    id = id or "",
                    import_dirs = {},
                    stub_dirs = [],
                    libs = inputs,
                    # NOTE: only haskell_ghci asks for it, and it does not
                    # work without.
                    version = version or "",
                    is_prebuilt = True,
                    profiling_enabled = profiling,
                )
                for profiling in (False, True)
            ]
        providers.append(HaskellLibraryProvider(lib = libs, prof_lib = prof_libs))

        # ... and `-package-db`. The prelude also copies the id in the
        # registration of a library that depends on this unit, so it has to
        # be the real thing.
        if db and id:
            haskell_deps = [dep[HaskellLinkInfo] for dep in deps if HaskellLinkInfo in dep]
            providers.append(HaskellLinkInfo(
                info = {
                    s: ctx.actions.tset(HaskellLibraryInfoTSet, value = v, children = [d.info[s] for d in haskell_deps])
                    for s, v in libs.items()
                },
                prof_info = {
                    s: ctx.actions.tset(HaskellLibraryInfoTSet, value = v, children = [d.prof_info[s] for d in haskell_deps])
                    for s, v in prof_libs.items()
                },
            ))

    return providers

haskell_unit = rule(
    doc = "A unit that is already in a package db, e.g. `base`. See the top of unit.bzl.",
    impl = _haskell_unit_impl,
    # @unsorted-dict-items
    attrs = {
        # The package db the unit is in: the one that comes with the compiler,
        # or a directory.
        "db": attrs.one_of(attrs.enum(["global"]), attrs.source(allow_directory = True), default = "global"),
        # What the registrations in `db` refer to: interface files, libraries.
        "inputs": attrs.list(attrs.source(allow_directory = True), default = []),
        # The unit. Without an id, it is whatever unit of the package the
        # package db has.
        "id": attrs.option(attrs.string(), default = None),
        # The name of the package as the registration has it. It defaults to
        # the name of the target for a unit without an id.
        "package_name": attrs.option(attrs.string(), default = None),
        # When given, it has to be the version the unit turns out to have.
        "version": attrs.option(attrs.string(), default = None),
        # The name of the sublibrary, for the sake of the plan interpreter.
        "lib_name": attrs.option(attrs.string(), default = None),
        # The units it depends on. A unit of the compiler needs none: what it
        # depends on is in the same package db. A unit of another package db
        # needs the ones that are neither there nor in the compiler's.
        "deps": attrs.list(attrs.dep(), default = []),
    } | ghc_toolchain_attrs | prelude_library_attrs,
)
