"""
Build rules for legacy packages (i.e. anything other than the simple build-type).
"""

load(
    "common.bzl",
    "CabalPackageInfo",
    "PackageConfTSet",
    "UnitInfo",
    "build_env",
    "common_unit_attrs",
    "configure_args",
    "mkInstallDirs",
    "mkProviders",
    "source_unit_attrs",
)

def _build_legacy_impl(ctx: AnalysisContext) -> list[Provider]:
    # For legacy packages (i.e. anything other than the simple build-type) we
    # have to configure and build in a single step, since we do not really know
    # what is gong to be written where.
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    env = build_env(ctx.attrs.exec_deps)

    installdirs = mkInstallDirs(ctx.actions)

    # configure

    build = ctx.actions.declare_output("build", dir = True)
    builddir = cmd_args(build, parent = 1)

    package_db = ctx.actions.declare_output("package.conf.d", dir = True)
    package_conf = package_db.project("{}.conf".format(ctx.attrs.unit_id))

    configure_cmd = cmd_args(
        env,
        setup,
        "configure",
        cmd_args(builddir, format = "--builddir={}"),
        cmd_args(installdirs.args, ignore_artifacts = True),
        configure_args(ctx),
        delimiter = " ",
    )

    configure_cmd.add("--ipi={}".format(ctx.attrs.unit_id))

    # build

    build_cmd = cmd_args(
        env,
        setup,
        "build",
        cmd_args(build.as_output(), parent = 1, format = "--builddir={}"),
        delimiter = " ",
    )

    # copy

    copy_cmd = cmd_args(
        env,
        setup,
        "copy",
        cmd_args(builddir, format = "--builddir={}"),
        delimiter = " ",
    )

    register_cmd = cmd_args(
        env,
        setup,
        "register",
        cmd_args(builddir, format = "--builddir={}"),
        cmd_args(package_conf, format = "--gen-pkg-config={}"),
        delimiter = " ",
    )

    ghc_cmd = cmd_args(
        "ghc-pkg",
        "recache",
        cmd_args(package_db.as_output(), format = "--package-db={}"),
        delimiter = " ",
    )

    build_sh_content = cmd_args(
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        cmd_args("mkdir", "-p", installdirs.prefix.as_output(), delimiter = " "),
        cmd_args(srcdir, format = "cd {}"),
        cmd_args(configure_cmd, relative_to = srcdir),
        cmd_args(build_cmd, relative_to = srcdir),
        cmd_args(copy_cmd, relative_to = srcdir),
        cmd_args(register_cmd, relative_to = srcdir),
    )

    build_sh = ctx.actions.write(
        "build_legacy.sh",
        build_sh_content,
        is_executable = True,
        with_inputs = True,
    )

    ctx.actions.run(
        cmd_args(
            build_sh,
            hidden = [
                srcdir,
                setup,
                build.as_output(),
                installdirs.prefix.as_output(),
                package_conf.as_output(),
            ],
        ),
        category = "cabal_build_legacy",
    )

    package_conf_tset = ctx.actions.tset(
        PackageConfTSet,
        value = package_conf,
        children = [
            dep[UnitInfo].package_conf_tset
            for dep in ctx.attrs.deps
        ],
    )

    providers = [
        DefaultInfo(
            default_outputs = [
                installdirs.prefix,
                package_conf,
            ],
        ),
        UnitInfo(
            id = ctx.attrs.unit_id,
            name = ctx.attrs.pkg_name,
            version = ctx.attrs.pkg_version,
            package_conf = package_conf,
            package_conf_tset = package_conf_tset,
        ),
    ]

    providers.extend(mkProviders(ctx, package_db, installdirs))

    return providers

build_legacy = rule(
    impl = _build_legacy_impl,
    attrs =
        common_unit_attrs |
        source_unit_attrs |
        {"setup": attrs.dep(providers = [RunInfo])},
)
