load("@prelude//:paths.bzl", "paths")
load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load(
    "common.bzl",
    "CabalPackageInfo",
    "ExeDependInfo",
    "PackageConfTSet",
    "UnitInfo",
    "common_unit_attrs",
    "configure_args",
    "manglePkgName",
    "package_db",
    "source_unit_attrs",
)

def _build_legacy_impl(ctx: AnalysisContext) -> list[Provider]:
    """
    For legacy packages (i.e. anything other than the simple build-type) we
    have to configure and build in a single step, since we do not really know
    what is gong to be written where.
    """
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
    setup = ctx.attrs.setup[RunInfo]
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir

    tset_deps = ctx.actions.tset(
        PackageConfTSet,
        children = [dep[UnitInfo].package_conf_tset for dep in ctx.attrs.deps],
    )

    builddir = ctx.actions.declare_output("builddir")
    package_conf = ctx.actions.declare_output("{}.conf".format(ctx.attrs.unit_id))

    script = ctx.actions.write(
        "script.sh",
        [
            "#!/usr/bin/env bash",
            "pwd",
            cmd_args(builddir.as_output(), format = "PREFIX=$(realpath {})"),
            "set -euo pipefail",
            cmd_args(srcdir, format = "cd {}"),
            cmd_args(
                setup,
                "configure",
                cmd_args(builddir.as_output(), format = "--builddir={}"),
                "--prefix=$PREFIX",
                configure_args(ctx),
                "--ipi={}".format(ctx.attrs.unit_id),
                delimiter = " ",
                relative_to = srcdir,
            ),
            cmd_args(
                setup,
                "build",
                cmd_args(builddir.as_output(), format = "--builddir={}"),
                delimiter = " ",
                relative_to = srcdir,
            ),
            cmd_args(
                setup,
                "register",
                cmd_args(builddir.as_output(), format = "--builddir={}"),
                cmd_args(package_conf.as_output(), format = "--gen-pkg-config={}"),
                "--inplace",
                delimiter = " ",
                relative_to = srcdir,
            ),
        ],
        is_executable = True,
        with_inputs = True,
    )
    ctx.actions.run(
        cmd_args(script, hidden = [builddir.as_output(), package_conf.as_output()]),
        category = "build_legacy",
    )

    package_conf_tset = ctx.actions.tset(
        PackageConfTSet,
        value = package_conf,
        children = [tset_deps],
    )

    return [
        DefaultInfo(
            default_output = builddir,
        ),
        UnitInfo(
            id = ctx.attrs.unit_id,
            name = ctx.attrs.pkg_name,
            version = ctx.attrs.pkg_version,
            package_conf = package_conf,
            package_conf_tset = package_conf_tset,
        ),
    ]

build_legacy = rule(
    impl = _build_legacy_impl,
    attrs =
        common_unit_attrs |
        source_unit_attrs |
        {"setup": attrs.dep(providers = [RunInfo])},
)

def _in_dir(*script, work_dir):
    return cmd_args("env", "-C", work_dir, cmd_args(relative_to = work_dir, *script))
