load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//haskell:util.bzl", "get_artifact_suffix")
load("@prelude//linking:link_info.bzl", "LinkStyle")

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
    "setup": attrs.exec_dep(),
    "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell"),
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
