"""
Common definitions for cabal-install plans.
"""

load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//haskell/library_info.bzl", "HaskellLibraryInfo", "HaskellLibraryProvider")
load("@prelude//linking:link_info.bzl", "LinkStyle")
load("//rules/haskell/toolchain.bzl", "HaskellToolchainLibrariesInfo")

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

# def package_db(ctx: AnalysisContext, tset: PackageConfTSet) -> cmd_args:
#     cache = ctx.actions.declare_output("package.conf.d", "package.cache")
#     ctx.actions.run(
#         cmd_args(
#             "ghc-pkg",
#             "recache",
#             cmd_args(cache.as_output(), format = "--package-db={}", parent = 1),
#             hidden = [
#                 ctx.actions.symlink_file("package.conf.d/{}.conf".format(package_conf.owner.name), package_conf)
#                 for package_conf in tset.traverse()
#             ],
#         ),
#         category = "packagedb",
#     )
#     return cmd_args(cache, parent = 1)

def _flags(ctx: AnalysisContext) -> cmd_args:
    return cmd_args([("+" if value else "-") + name for name, value in ctx.attrs.flags.items()], format = "--flags={}")

# def _dependency(libinfo: HaskellLibraryInfo) -> str:
#     # if unitInfo.lib_name:
#     #     return "--dependency={}:{}={}".format(libinfo.name, libinfo.lib_name, libinfo.id)
#     # else:
#     return "--dependency={}={}".format(libinfo.name, libinfo.id)

def _dependencies(ctx: AnalysisContext) -> cmd_args:
    args = cmd_args()
    for d in ctx.attrs.deps:
        hli = d[HaskellLibraryProvider].lib[LinkStyle("static")]
        args.add("--dependency={}={}".format(hli.name, hli.id))
    return args

def configure_args(ctx: AnalysisContext) -> cmd_args:
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

    # tset_deps = ctx.actions.tset(
    #     PackageConfTSet,
    #     children = [
    #         dep[UnitInfo].package_conf_tset
    #         for dep in ctx.attrs.deps
    #     ],
    # )
    return cmd_args(
        cmd_args(haskell_toolchain.compiler, format = "--with-compiler={}"),
        "--exact-configuration",
        "--ghc-option=-hide-all-packages",
        "--exact-configuration",
        "--package-db=clear",
        "--package-db=global",
        # cmd_args(package_db(ctx, tset_deps), format = "--package-db={}"),
        _dependencies(ctx),
        _flags(ctx),
    )

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
