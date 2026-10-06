"""
What the Haskell rules of the prelude expect from a library.

The prelude and Cabal do not agree on what a library is. For Cabal a library
is its registration: GHC is told a unit-id and finds interface files, objects
and what else to link in the package db. The prelude only uses the package db
to compile, exposes a dependency by package name (`-package <name>`), and
links by itself: it passes the archives or the shared objects of every
dependency to the linker, in dependency order.

So a library built by the cabal_simple rules has to say twice where its code
is, once in its registration and once in the providers below.
"""

load(
    "@prelude//cxx:cxx_toolchain_types.bzl",
    "LinkerType",
    "PicBehavior",
)
load(
    "@prelude//haskell:library_info.bzl",
    "HaskellLibraryInfo",
    "HaskellLibraryInfoTSet",
    "HaskellLibraryProvider",
)
load("@prelude//haskell:link_info.bzl", "HaskellLinkInfo")
load(
    "@prelude//linking:link_info.bzl",
    "Archive",
    "ArchiveLinkable",
    "LinkInfo",
    "LinkInfos",
    "LinkStyle",
    "LinkedObject",
    "MergedLinkInfo",
    "SharedLibLinkable",
    "create_merged_link_info",
    "default_output_style_for_link_strategy",
    "to_link_strategy",
)
load(
    "@prelude//linking:linkable_graph.bzl",
    "create_linkable_graph",
    "create_linkable_graph_node",
    "create_linkable_node",
)
load(
    "@prelude//linking:shared_libraries.bzl",
    "SharedLibraryInfo",
    "create_shared_libraries",
    "merge_shared_libraries",
)

# The rule that calls prelude_library_providers needs this attribute, the
# prelude reads it when it adds the library to its graph of linkables.
prelude_library_attrs = {
    "labels": attrs.list(attrs.string(), default = []),
}

def prelude_library_providers(
        ctx: AnalysisContext,
        name: str,
        version: str,
        unit_id: str,
        package_db: Artifact,
        hi: Artifact,
        inputs: list[Artifact],
        static_lib: Artifact | None,
        shared_lib: (str, Artifact) | None,
        linker_flags: list[typing.Any],
        deps: list[Dependency]) -> list[Provider]:
    """Describe a registered library to the Haskell rules of the prelude.

    Args:
      ctx: the context of the library's rule
      name: the name in the registration, what `-package` takes
      version: the version in the registration
      unit_id: the id in the registration
      package_db: a package db with the registration
      hi: the directory of the interface files
      inputs: what else the registration refers to
      static_lib: the archive, None for a library without code
      shared_lib: soname and file of the shared object. None when there is no
        code or the name of the file is not known during analysis.
      linker_flags: what linking against the library takes besides the
        library itself (extra-libraries, ld-options)
      deps: the libraries this one depends on. The ones the prelude cannot
        use, as the ones that come with the compiler, are skipped.
    Returns:
      the providers `haskell_binary` and `haskell_library` look for in `deps`
    """
    haskell_deps = [dep[HaskellLinkInfo] for dep in deps if HaskellLinkInfo in dep]
    linkable_deps = [dep for dep in deps if MergedLinkInfo in dep]

    libs = {}
    prof_libs = {}
    infos = {}
    prof_infos = {}
    link_infos = {}
    for link_style in LinkStyle:
        # NOTE: there is one archive, built without -fPIC. It is good enough
        # to link an executable with the static_pic style, not to link a
        # shared object. It also stands in for the shared object when we
        # cannot name it.
        if link_style == LinkStyle("shared") and shared_lib:
            lib = shared_lib[1]
            linkables = [SharedLibLinkable(lib = lib)]
        elif static_lib:
            lib = static_lib
            linkables = [ArchiveLinkable(archive = Archive(artifact = lib), linker_type = LinkerType("gnu"))]
        else:
            lib = None
            linkables = []

        # NOTE: the prelude only uses libs to make them inputs of the
        # compiler, which may load them to run Template Haskell.
        libs[link_style] = HaskellLibraryInfo(
            name = name,
            db = package_db,
            id = unit_id,
            import_dirs = {False: hi},
            stub_dirs = [],
            libs = inputs + ([lib] if lib else []),
            version = version,
            is_prebuilt = True,
            profiling_enabled = False,
        )
        infos[link_style] = ctx.actions.tset(
            HaskellLibraryInfoTSet,
            value = libs[link_style],
            children = [dep.info[link_style] for dep in haskell_deps],
        )

        # There are no profiling libraries, but the prelude wants an entry for
        # each link style even when nothing asks for profiling.
        prof_libs[link_style] = HaskellLibraryInfo(
            name = name,
            db = package_db,
            id = unit_id,
            import_dirs = {},
            stub_dirs = [],
            libs = [],
            version = version,
            is_prebuilt = True,
            profiling_enabled = True,
        )
        prof_infos[link_style] = ctx.actions.tset(
            HaskellLibraryInfoTSet,
            value = prof_libs[link_style],
            children = [dep.prof_info[link_style] for dep in haskell_deps],
        )

        output_style = default_output_style_for_link_strategy(to_link_strategy(link_style))
        link_infos[output_style] = LinkInfos(
            default = LinkInfo(
                linkables = linkables,
                post_flags = linker_flags,
            ),
        )

    solibs = {}
    if shared_lib:
        soname, so = shared_lib
        solibs[soname] = LinkedObject(output = so, unstripped_output = so)
    shared_libs = create_shared_libraries(ctx, solibs)

    return [
        HaskellLibraryProvider(lib = libs, prof_lib = prof_libs),
        HaskellLinkInfo(info = infos, prof_info = prof_infos),
        create_merged_link_info(
            ctx,
            pic_behavior = PicBehavior("supported"),
            link_infos = link_infos,
            exported_deps = [dep[MergedLinkInfo] for dep in linkable_deps],
        ),
        merge_shared_libraries(
            ctx.actions,
            shared_libs,
            [dep[SharedLibraryInfo] for dep in deps if SharedLibraryInfo in dep],
        ),
        create_linkable_graph(
            ctx,
            node = create_linkable_graph_node(
                ctx,
                linkable_node = create_linkable_node(
                    ctx = ctx,
                    exported_deps = linkable_deps,
                    link_infos = link_infos,
                    shared_libs = shared_libs,
                    default_soname = None,
                ),
            ),
            deps = linkable_deps,
        ),
    ]

def prelude_unit_link_providers(
        ctx: AnalysisContext,
        link_static: Artifact,
        link_shared: Artifact,
        inputs: list[Artifact] = [],
        deps: list[Dependency] = []) -> list[Provider]:
    """Describe a unit that is already in a package db to the linking of the prelude.

    GHC links the libraries it is told about with `-package`, but it puts
    them before the libraries the prelude passes: a linker that reads its
    arguments once does not go back to them for what a later library needs.
    Here they are given again, by the library that needs them.

    This is the linking alone. See root//rules/haskell:unit.bzl for how the
    compiler gets to know about the unit.

    Args:
      ctx: the context of the unit's rule
      link_static: a file with the linker options to link the unit
        statically, one per line
      link_shared: the same, to link it dynamically
      inputs: the libraries those options refer to, when they are not part of
        the compiler
      deps: the units this one depends on
    Returns:
      the providers `haskell_binary` and `haskell_library` look for in `deps`
    """
    link_infos = {}
    for link_style in LinkStyle:
        args = link_shared if link_style == LinkStyle("shared") else link_static
        output_style = default_output_style_for_link_strategy(to_link_strategy(link_style))
        link_infos[output_style] = LinkInfos(
            default = LinkInfo(
                # NOTE: the linker reads the file. GHC would take a plain
                # @file for a file of its own options.
                post_flags = [cmd_args(args, format = "-Wl,@{}", hidden = inputs)],
            ),
        )

    linkable_deps = [dep for dep in deps if MergedLinkInfo in dep]
    return [
        create_merged_link_info(
            ctx,
            pic_behavior = PicBehavior("supported"),
            link_infos = link_infos,
            exported_deps = [dep[MergedLinkInfo] for dep in linkable_deps],
        ),
        create_linkable_graph(
            ctx,
            node = create_linkable_graph_node(
                ctx,
                linkable_node = create_linkable_node(
                    ctx = ctx,
                    exported_deps = linkable_deps,
                    link_infos = link_infos,
                    default_soname = None,
                ),
            ),
            deps = linkable_deps,
        ),
    ]
