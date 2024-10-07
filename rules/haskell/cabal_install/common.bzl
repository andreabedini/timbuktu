load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//haskell:util.bzl", "get_artifact_suffix")
load("@prelude//linking:link_info.bzl", "LinkStyle")
load("//rules/haskell/toolchain.bzl", "HaskellToolchainLibraries")

CabalPackageInfo = provider(
    fields = {
        "pkg_name": provider_field(str),
        "pkg_version": provider_field(str),
        "pkg_id": provider_field(str),
        "srcdir": provider_field(Artifact),
        "cabalfile": provider_field(Artifact),
    },
)

def project_as_package_conf(package_conf):
    return package_conf

PackageConfTSet = transitive_set(
    args_projections = {
        "package_conf": project_as_package_conf,
    },
)

UnitInfo = provider(
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
    fields = ["mangledPkgName", "exe", "datadir"],
)

common_unit_attrs = {
    "unit_id": attrs.string(),
    "pkg_name": attrs.string(),
    "pkg_version": attrs.string(),
    "deps": attrs.list(attrs.dep(), default = []),
}

source_unit_attrs = {
    "exec_deps": attrs.list(attrs.exec_dep(providers = [ExeDependInfo]), default = []),
    "flags": attrs.dict(attrs.string(), attrs.bool()),
    "src": attrs.dep(providers = [CabalPackageInfo]),
    "_haskell_toolchain": attrs.toolchain_dep(
        providers = [HaskellToolchainInfo, HaskellPlatformInfo, HaskellToolchainLibraries],
        default = "toolchains//:haskell",
    ),
}

def manglePkgName(name: str) -> str:
    # NOTE: taken from build-env, check with Cabal
    return name.replace("-", "_")

def package_db(ctx: AnalysisContext, tset: PackageConfTSet) -> cmd_args:
    cache = ctx.actions.declare_output("package.conf.d", "package.cache")
    ctx.actions.run(
        cmd_args(
            "ghc-pkg",
            "recache",
            cmd_args(cache.as_output(), format = "--package-db={}", parent = 1),
            hidden = [
                ctx.actions.symlink_file("package.conf.d/{}.conf".format(package_conf.owner.name), package_conf)
                for package_conf in tset.traverse()
            ],
        ),
        category = "packagedb",
    )
    return cmd_args(cache, parent = 1)

def output_args(ctx: AnalysisContext) -> cmd_args:
    link_style = LinkStyle("static")
    enable_profiling = False
    suffix = ""

    artifact_suffix = get_artifact_suffix(link_style, enable_profiling, suffix)
    objects = ctx.actions.declare_output("objects-" + artifact_suffix, dir = True)
    hi = ctx.actions.declare_output("hi-" + artifact_suffix, dir = True)
    stubs = ctx.actions.declare_output("stubs-" + artifact_suffix, dir = True)

    return cmd_args(
        "-odir",
        objects.as_output(),
        "-hidir",
        hi.as_output(),
        "-hiedir",
        hi.as_output(),
        "-stubdir",
        stubs.as_output(),
    )

def _flags(ctx: AnalysisContext) -> cmd_args:
    return cmd_args([("+" if value else "-") + name for name, value in ctx.attrs.flags.items()], format = "--flags={}")

def _dependency(unitInfo: UnitInfo) -> str:
    if unitInfo.lib_name:
        return "--dependency={}:{}={}".format(unitInfo.name, unitInfo.lib_name, unitInfo.id)
    else:
        return "--dependency={}={}".format(unitInfo.name, unitInfo.id)

def _dependencies(ctx: AnalysisContext) -> list[str]:
    return [_dependency(d[UnitInfo]) for d in ctx.attrs.deps]

def configure_args(ctx: AnalysisContext) -> cmd_args:
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
    tset_deps = ctx.actions.tset(
        PackageConfTSet,
        children = [
            dep[UnitInfo].package_conf_tset
            for dep in ctx.attrs.deps
        ],
    )
    return cmd_args(
        cmd_args(haskell_toolchain.compiler, format = "--with-compiler={}"),
        "--exact-configuration",
        "--ghc-option=-hide-all-packages",
        "--exact-configuration",
        "--package-db=clear",
        "--package-db=global",
        cmd_args(package_db(ctx, tset_deps), format = "--package-db={}"),
        _dependencies(ctx),
        _flags(ctx),
    )

def build_env(exec_deps: list[Dependency]) -> cmd_args:
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

def _in_dir(*script, work_dir):
    return cmd_args("env", "-C", work_dir, cmd_args(relative_to = work_dir, *script))
