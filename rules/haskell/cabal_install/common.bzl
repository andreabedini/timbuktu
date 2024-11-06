"""
Common definitions for cabal-install plans.
"""

load(
    "@prelude//cxx:cxx_toolchain_types.bzl",
    "LinkerType",
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
    "SharedLibLinkable",
)
load(
    "//rules/haskell/toolchain.bzl",
    "HaskellToolchainLibrariesInfo",
)

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

def project_as_package_conf(package_conf):
    return package_conf

# buildifier: disable=name-conventions
PackageConfTSet = transitive_set(
    args_projections = {
        "package_conf": project_as_package_conf,
    },
)

UnitInfo = provider(
    doc = "TODO",
    # @unsorted-dict-items
    fields = {
        "id": provider_field(str),
        "name": provider_field(str),
        "version": provider_field(str),
        "lib_name": provider_field(str | None, default = None),
        "package_conf": provider_field(Artifact | None, default = None),
        "package_conf_tset": provider_field(PackageConfTSet),
    },
)

ExeDependInfo = provider(
    doc = "TODO",
    fields = ["mangledPkgName", "exe", "datadir"],
)

haskell_toolchain_attrs = {
    "_haskell_toolchain": attrs.toolchain_dep(
        providers = [HaskellToolchainInfo, HaskellPlatformInfo, HaskellToolchainLibrariesInfo],
        default = "toolchains//:haskell",
    ),
}

common_unit_attrs = {
    "deps": attrs.list(attrs.dep(), default = []),
    "pkg_name": attrs.string(),
    "pkg_version": attrs.string(),
    "unit_id": attrs.string(),
}

source_unit_attrs = haskell_toolchain_attrs | {
    "exec_deps": attrs.list(attrs.exec_dep(providers = [ExeDependInfo]), default = []),
    "flags": attrs.dict(attrs.string(), attrs.bool()),
    "src": attrs.dep(providers = [CabalPackageInfo]),
}

def manglePkgName(name: str) -> str:
    # NOTE: taken from build-env, check with Cabal
    return name.replace("-", "_")

def package_db(ctx: AnalysisContext, tset: PackageConfTSet) -> cmd_args:
    cache = ctx.actions.declare_output("package_db", "package.cache")
    ctx.actions.run(
        cmd_args(
            "ghc-pkg",
            "recache",
            cmd_args(cache.as_output(), format = "--package-db={}", parent = 1),
            hidden = [
                ctx.actions.symlink_file("package_db/{}.conf".format(package_conf.owner.name), package_conf)
                for package_conf in tset.traverse()
            ],
        ),
        category = "packagedb",
    )
    return cmd_args(cache, parent = 1)

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

    tset_deps = ctx.actions.tset(
        PackageConfTSet,
        children = [
            dep[UnitInfo].package_conf_tset
            for dep in ctx.attrs.deps
        ],
    )

    args.add(cmd_args(package_db(ctx, tset_deps), format = "--package-db={}"))

    for d in ctx.attrs.deps:
        unitInfo = d[UnitInfo]
        if unitInfo.lib_name:
            args.add("--dependency={}:{}={}".format(unitInfo.name, unitInfo.lib_name, unitInfo.id))
        else:
            args.add("--dependency={}={}".format(unitInfo.name, unitInfo.id))

        # hli = d[HaskellLibraryProvider].lib[LinkStyle("static")]
        # args.add(cmd_args(hli.db, format = "--package-db={}"))

        # # FIXME: missing libname
        # args.add("--dependency={}={}".format(hli.name, hli.id))

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
        path = cmd_args([k[ExeDependInfo].exe for k in exec_deps], parent = 1, delimiter = ":")
        env.add(cmd_args(path, format = "PATH={}:$PATH"))

    for dep in exec_deps:
        env.add(cmd_args(
            [
                cmd_args(dep[ExeDependInfo].mangledPkgName, format = "{}_datadir"),
                dep[ExeDependInfo].datadir,
            ],
            delimiter = "=",
        ))

    return env

InstallDirs = record(
    prefix = Artifact,
    libdir = Artifact,
    args = cmd_args,
)

def mkInstallDirs(actions) -> InstallDirs:
    prefix = actions.declare_output("prefix", dir = True)
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
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
    compiler = haskell_toolchain.compiler

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
        if link_style == LinkStyle("static"):
            # FIXME extension
            libs.append(installdirs.libdir.project("libHS{}.a".format(ctx.attrs.unit_id)))
        elif link_style == LinkStyle("shared"):
            # FIXME extension
            libs.append(installdirs.libdir.project("libHS{}-{}.so".format(ctx.attrs.unit_id, compiler)))

        hlibinfo = HaskellLibraryInfo(
            name = ctx.attrs.pkg_name,
            db = package_db,
            # import_dirs = { False: prefix.project("lib"), },
            import_dirs = {},
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

        if link_style == LinkStyle("shared"):
            linkables = [shared_linkable(lib) for lib in libs]
        elif link_style == LinkStyle("static"):
            linkables = [archive_linkable(lib) for lib in libs]

        if link_style == LinkStyle("shared"):
            prof_linkables = [shared_linkable(lib) for lib in prof_libs]
        elif link_style == LinkStyle("static"):
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

    return [haskell_lib_provider, haskell_link_infos]
