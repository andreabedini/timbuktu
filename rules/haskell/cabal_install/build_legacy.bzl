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
    "source_unit_attrs",
)

def _build_legacy_impl(ctx: AnalysisContext) -> list[Provider]:
    # For legacy packages (i.e. anything other than the simple build-type) we
    # have to configure and build in a single step, since we do not really know
    # what is gong to be written where.
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    env = build_env(ctx.attrs.exec_deps)

    # configure

    prefix = ctx.actions.declare_output("prefix", dir = True)
    builddir = ctx.actions.declare_output("dist", dir = True)
    packagedb = ctx.actions.declare_output("package.conf.d", dir = True)

    configure_cmd = cmd_args(
        env,
        setup,
        "configure",
        cmd_args(builddir, format = "--builddir={}", ignore_artifacts = True),
        cmd_args(prefix, format = "--prefix=$(realpath {})", ignore_artifacts = True),
        "--libsubdir=",
        "--libexecsubdir=",
        "--datadir='$prefix/data'",
        "--datasubdir=",
        "--docdir='$prefix/doc'",
        configure_args(ctx),
        cmd_args(packagedb, format = "--package-db={}", ignore_artifacts = True),
        delimiter = " ",
    )

    configure_cmd.add("--ipi={}".format(ctx.attrs.unit_id))

    # build

    build_cmd = cmd_args(
        env,
        setup,
        "build",
        cmd_args(builddir, format = "--builddir={}", ignore_artifacts = True),
        delimiter = " ",
    )

    # copy

    copy_cmd = cmd_args(
        env,
        setup,
        "copy",
        cmd_args(builddir, format = "--builddir={}", ignore_artifacts = True),
        delimiter = " ",
    )

    register_cmd = cmd_args(
        env,
        setup,
        "register",
        cmd_args(builddir, format = "--builddir={}", ignore_artifacts = True),
        delimiter = " ",
    )

    build_sh_content = cmd_args(
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        cmd_args("mkdir", "-p", prefix.as_output(), delimiter = " "),
        cmd_args(srcdir, format = "cd {}"),
        cmd_args(configure_cmd, relative_to = srcdir),
        cmd_args(build_cmd, relative_to = srcdir),
        cmd_args(copy_cmd, relative_to = srcdir),
        cmd_args(register_cmd, relative_to = srcdir),
        hidden = [srcdir, setup, builddir.as_output(), prefix.as_output()],
    )

    build_sh = ctx.actions.write(
        "build.sh",
        build_sh_content,
        is_executable = True,
        with_inputs = True,
    )

    ctx.actions.run(
        cmd_args(build_sh, hidden = [prefix.as_output(), builddir.as_output(), packagedb.as_output()]),
        category = "build_legacy",
    )

    # package_conf_tset = ctx.actions.tset(
    #     PackageConfTSet,
    #     value = package_conf,
    #     children = [
    #         dep[UnitInfo].package_conf_tset
    #         for dep in ctx.attrs.deps
    #     ],
    # )

    return [
        DefaultInfo(
            default_outputs = [prefix, packagedb],
        ),
        # UnitInfo(
        #     id = ctx.attrs.unit_id,
        #     name = ctx.attrs.pkg_name,
        #     version = ctx.attrs.pkg_version,
        #     package_conf = package_conf,
        #     package_conf_tset = package_conf_tset,
        # ),
    ]

build_legacy = rule(
    impl = _build_legacy_impl,
    attrs =
        common_unit_attrs |
        source_unit_attrs |
        {"setup": attrs.dep(providers = [RunInfo])},
)
