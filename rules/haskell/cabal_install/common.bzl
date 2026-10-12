"""
What the rules of the plan interpreter share: attributes, the adapters from a
rule's context to the functions of setup.bzl, and mkProviders.
"""

load(
    "@prelude//cxx:cxx_toolchain_types.bzl",
    "LinkerType",
    "PicBehavior",
)
load(
    "@prelude//haskell:toolchain.bzl",
    "HaskellPlatformInfo",
    "HaskellToolchainInfo",
)
load(
    "@prelude//haskell/library_info.bzl",
    "HaskellLibraryInfo",
    "HaskellLibraryInfoTSet",
    "HaskellLibraryProvider",
)
load(
    "@prelude//haskell/link_info.bzl",
    "HaskellLinkInfo",
)
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
load("//rules/haskell:providers.bzl", "CabalExecutableInfo", "CabalLibraryInfo")
load("//rules/haskell:toolchain.bzl", "GhcToolchainInfo")
load(":setup.bzl", "SetupEnv", "SetupUnit")

CabalPackageInfo = provider(
    doc = "TODO",
    # @unsorted-dict-items
    fields = {
        "pkg_name": provider_field(str),
        "pkg_version": provider_field(str),
        "cabalfile": provider_field(Artifact),
        "srcdir": provider_field(Artifact),
    },
)

haskell_toolchain_attrs = {
    "_haskell_toolchain": attrs.toolchain_dep(
        providers = [HaskellToolchainInfo, HaskellPlatformInfo, GhcToolchainInfo],
        default = "toolchains//:haskell",
    ),
}

common_unit_attrs = {
    "deps": attrs.list(attrs.dep(providers = [CabalLibraryInfo]), default = []),
    "labels": attrs.list(attrs.string(), default = []),
    "pkg_name": attrs.string(),
    "pkg_version": attrs.string(),
    "unit_id": attrs.string(),
}

source_unit_attrs = haskell_toolchain_attrs | {
    "exec_deps": attrs.list(attrs.exec_dep(providers = [CabalExecutableInfo]), default = []),
    "flags": attrs.dict(attrs.string(), attrs.bool()),
    "src": attrs.dep(providers = [CabalPackageInfo]),
}

def setup_env(ctx: AnalysisContext) -> SetupEnv:
    """What the functions of setup.bzl take from a unit's rule."""
    return SetupEnv(
        actions = ctx.actions,
        ghc = ctx.attrs._haskell_toolchain[GhcToolchainInfo],
        label = ctx.label,
        scope = None,
    )

def setup_unit(ctx: AnalysisContext, component: str | None) -> SetupUnit:
    """The unit a rule's attributes describe."""
    return SetupUnit(
        id = ctx.attrs.unit_id,
        name = ctx.attrs.pkg_name,
        version = ctx.attrs.pkg_version,
        flags = ctx.attrs.flags,
        component = component,
    )

def mkProviders(ctx, package_db, installdirs) -> list[Provider]:
    # NOTE: the name of the shared library has the version of GHC in it,
    # which is not known here for the GHC in PATH. The archive is all the
    # prelude gets then.
    ghc_version = ctx.attrs._haskell_toolchain[GhcToolchainInfo].version

    haskell_infos = []
    for dep in ctx.attrs.deps:
        if HaskellLinkInfo in dep:
            haskell_infos.append(dep[HaskellLinkInfo])

    hlibinfos = {}
    prof_hlibinfos = {}
    hlinkinfos = {}
    prof_hlinkinfos = {}
    link_infos = {}
    prof_link_infos = {}
    for link_style in LinkStyle:
        libs = []
        prof_libs = []
        if link_style == LinkStyle("shared") and ghc_version:
            # FIXME extension
            libs.append(installdirs.libdir.project("libHS{}-ghc{}.so".format(ctx.attrs.unit_id, ghc_version)))
        else:
            # NOTE: Cabal builds one archive, without -fPIC. It is good enough
            # to link an executable with the static_pic style, not to link a
            # shared object.
            # FIXME extension
            libs.append(installdirs.libdir.project("libHS{}.a".format(ctx.attrs.unit_id)))

        hlibinfo = HaskellLibraryInfo(
            name = ctx.attrs.pkg_name,
            db = package_db,
            # NOTE: the package conf points into the prefix, which the prelude
            # only makes an input of the compiler through this field.
            import_dirs = {False: installdirs.prefix},
            stub_dirs = [],
            id = ctx.attrs.unit_id,
            libs = libs,
            version = ctx.attrs.pkg_version,
            is_prebuilt = True,
            profiling_enabled = False,
        )

        prof_hlibinfo = HaskellLibraryInfo(
            name = ctx.attrs.pkg_name,
            db = package_db,
            # import_dirs = { False: prefix.project("lib"), },
            import_dirs = {},
            stub_dirs = [],
            id = ctx.attrs.unit_id,
            libs = prof_libs,
            version = ctx.attrs.pkg_version,
            is_prebuilt = True,
            profiling_enabled = True,
        )

        def archive_linkable(lib):
            return ArchiveLinkable(
                archive = Archive(artifact = lib),
                linker_type = LinkerType("gnu"),
            )

        def shared_linkable(lib):
            return SharedLibLinkable(
                lib = lib,
            )

        if link_style == LinkStyle("shared") and ghc_version:
            linkables = [shared_linkable(lib) for lib in libs]
            prof_linkables = [shared_linkable(lib) for lib in prof_libs]
        else:
            linkables = [archive_linkable(lib) for lib in libs]
            prof_linkables = [archive_linkable(lib) for lib in prof_libs]

        hlibinfos[link_style] = hlibinfo

        hlinkinfos[link_style] = ctx.actions.tset(
            HaskellLibraryInfoTSet,
            value = hlibinfo,
            children = [lib.info[link_style] for lib in haskell_infos],
        )

        prof_hlibinfos[link_style] = prof_hlibinfo

        prof_hlinkinfos[link_style] = ctx.actions.tset(
            HaskellLibraryInfoTSet,
            value = prof_hlibinfo,
            children = [lib.prof_info[link_style] for lib in haskell_infos],
        )

        link_infos[link_style] = LinkInfos(
            default = LinkInfo(
                # pre_flags = ctx.attrs.exported_linker_flags,
                # post_flags = ctx.attrs.exported_post_linker_flags,
                linkables = linkables,
            ),
        )

        prof_link_infos[link_style] = LinkInfos(
            default = LinkInfo(
                # pre_flags = ctx.attrs.exported_linker_flags,
                # post_flags = ctx.attrs.exported_post_linker_flags,
                linkables = prof_linkables,
            ),
        )

    haskell_link_infos = HaskellLinkInfo(
        info = hlinkinfos,
        prof_info = prof_hlinkinfos,
    )

    haskell_lib_provider = HaskellLibraryProvider(
        lib = hlibinfos,
        prof_lib = prof_hlibinfos,
    )

    # What the prelude's link step reads: it passes the libraries of its
    # dependencies to the linker itself, the package db is only used to
    # compile.
    def to_lib_output_style(s):
        return default_output_style_for_link_strategy(to_link_strategy(s))

    merged_link_info = create_merged_link_info(
        ctx,
        pic_behavior = PicBehavior("supported"),
        link_infos = {to_lib_output_style(s): v for s, v in link_infos.items()},
        exported_deps = [dep[MergedLinkInfo] for dep in ctx.attrs.deps if MergedLinkInfo in dep],
    )

    solibs = {}
    if ghc_version:
        soname = "libHS{}-ghc{}.so".format(ctx.attrs.unit_id, ghc_version)
        so = installdirs.libdir.project(soname)
        solibs[soname] = LinkedObject(output = so, unstripped_output = so)
    shared_libs = create_shared_libraries(ctx, solibs)
    shared_library_info = merge_shared_libraries(
        ctx.actions,
        shared_libs,
        [dep[SharedLibraryInfo] for dep in ctx.attrs.deps if SharedLibraryInfo in dep],
    )

    linkable = [dep for dep in ctx.attrs.deps if MergedLinkInfo in dep]
    linkable_graph = create_linkable_graph(
        ctx,
        node = create_linkable_graph_node(
            ctx,
            linkable_node = create_linkable_node(
                ctx = ctx,
                exported_deps = linkable,
                link_infos = {to_lib_output_style(s): v for s, v in link_infos.items()},
                shared_libs = shared_libs,
                default_soname = None,
            ),
        ),
        deps = linkable,
    )

    return [haskell_lib_provider, haskell_link_infos, merged_link_info, shared_library_info, linkable_graph]
