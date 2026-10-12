"""
Common definitions for cabal-install plans.
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
load("//rules/haskell:providers.bzl", "CabalExecutableInfo", "CabalLibraryInfo", "CabalUnit", "CabalUnitTSet", "mangle")
load("//rules/haskell:toolchain.bzl", "GhcToolchainInfo")
load("//rules/haskell:unit.bzl", "resolve_unit")

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

def dep_units(ctx: AnalysisContext, value: CabalUnit | None = None) -> CabalUnitTSet:
    """The units of the dependencies, and `value` if given."""
    children = [dep[CabalLibraryInfo].units for dep in ctx.attrs.deps]
    if value:
        return ctx.actions.tset(CabalUnitTSet, value = value, children = children)
    return ctx.actions.tset(CabalUnitTSet, children = children)

def _flags(ctx: AnalysisContext) -> cmd_args:
    return cmd_args([("+" if value else "-") + name for name, value in ctx.attrs.flags.items()], format = "--flags={}")

def configure_args(ctx: AnalysisContext) -> cmd_args:
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

    args = cmd_args(
        cmd_args(haskell_toolchain.compiler, format = "--with-compiler={}"),
        "--exact-configuration",
        "--package-db=clear",
        "--package-db=global",
    )

    # One package db for each unit that is not the compiler's, the way the
    # cabal_simple rules do it.
    units = dep_units(ctx)
    args.add(units.project_as_args("setup_package_db"))
    args.add(cmd_args(hidden = units.project_as_args("artifacts")))

    for dep in ctx.attrs.deps:
        info = dep[CabalLibraryInfo]
        if not info.id or not info.name:
            fail("{}: Setup.hs is told each dependency by package name and unit-id during analysis, and {} does not know {}".format(
                ctx.label,
                dep.label,
                "its unit-id (give haskell_unit an `id`)" if info.name else "its package name",
            ))
        if info.lib_name:
            args.add("--dependency={}:{}={}".format(info.name, info.lib_name, info.id))
        else:
            args.add("--dependency={}={}".format(info.name, info.id))

    args.add(_flags(ctx))
    return args

def build_env(exec_deps: list[Dependency]) -> cmd_args:
    """Create the command line to set up the build environment

    Args:
      exec_deps: list of exe-dependencies
    Returns:
      cmd_args: command line
    """
    env = cmd_args()

    if exec_deps:
        path = cmd_args([k[CabalExecutableInfo].exe for k in exec_deps], parent = 1, delimiter = ":")
        env.add(cmd_args(path, format = "PATH={}:$PATH"))

    # NOTE: the paths have to be absolute: a tool can write them into a file
    # somewhere else, as hsc2hs does with `#include "<datadir>/template-hsc.h"`.
    # The scripts run from the package's directory, which is what the paths
    # are relative to.
    for dep in exec_deps:
        for name, value in dep[CabalExecutableInfo].env.items():
            env.add(cmd_args(value, format = name + "=$PWD/{}"))

    return env

InstallDirs = record(
    prefix = Artifact,
    libdir = Artifact,
    args = cmd_args,
)

def mkInstallDirs(actions) -> InstallDirs:
    prefix = actions.declare_output("prefix", dir = True, has_content_based_path = False)
    args = cmd_args(
        cmd_args(prefix, format = "--prefix=$(realpath {})"),
        "--libdir='$prefix/lib'",
        "--libsubdir=",
        "--dynlibdir='$prefix/lib'",
        "--libexecdir='$prefix/libexec'",
        "--libexecsubdir=",
        "--datadir='$prefix/data'",
        "--datasubdir=",
        "--docdir='$prefix/doc'",
    )
    return InstallDirs(
        prefix = prefix,
        libdir = prefix.project("lib"),
        args = args,
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

def library_info(ctx: AnalysisContext, package_db: Artifact, installdirs: InstallDirs, lib_name: str | None) -> CabalLibraryInfo:
    """What a library unit hands to its dependents, whatever rule set they are of.

    Args:
      ctx: the context of the unit's rule
      package_db: a package db with the unit's registration and nothing else
      installdirs: where Setup.hs copied the unit
      lib_name: the name of the sublibrary, None for the main library
    Returns:
      the CabalLibraryInfo of the unit
    """
    pkg_name = ctx.attrs.pkg_name
    unit_id = ctx.attrs.unit_id

    # The cabal_simple rules want to hear what the registration says.
    # NOTE: a sublibrary is registered with a name of its own (z-<pkg>-z-<lib>),
    # so it is only looked for by id.
    resolved = resolve_unit(
        ctx.actions,
        ctx.attrs._haskell_toolchain[GhcToolchainInfo],
        ctx.label,
        package_db,
        unit_id,
        None if lib_name else pkg_name,
        ctx.attrs.pkg_version,
    )
    return CabalLibraryInfo(
        name = pkg_name,
        lib_name = lib_name,
        id = unit_id,
        unit = resolved.unit,
        units = dep_units(ctx, CabalUnit(
            id = unit_id,
            package_db = package_db,
            # The registration refers to the installation prefix.
            artifacts = [installdirs.prefix],
            data_dir = (mangle(pkg_name) + "_datadir", data_dir(installdirs)),
        )),
    )

def data_dir(installdirs: InstallDirs) -> cmd_args:
    """Where Setup.hs copied the data-files of the package.

    NOTE: not a projection of the prefix, since the directory is only there
    when the package has data-files.
    """
    return cmd_args(installdirs.prefix, "/data", delimiter = "")
