load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load(
    "common.bzl",
    "CabalPackageInfo",
    "PackageConfTSet",
    "UnitInfo",
    "common_unit_attrs",
    "package_db",
    "source_unit_attrs",
)

def _component_name(ctx: AnalysisContext) -> str:
    return "lib:{}".format(ctx.attrs.pkg_name) if ctx.attrs.component_name == "lib" else ctx.attrs.component_name

def _flags(ctx: AnalysisContext) -> cmd_args:
    return cmd_args([("+" if value else "-") + name for name, value in ctx.attrs.flags.items()], format = "--flags={}")

def _dependency(unitInfo: UnitInfo) -> str:
    if unitInfo.lib_name:
        return "--dependency={}:{}={}".format(unitInfo.name, unitInfo.lib_name, unitInfo.id)
    else:
        return "--dependency={}={}".format(unitInfo.name, unitInfo.id)

def _dependencies(ctx: AnalysisContext) -> list[str]:
    return [_dependency(d[UnitInfo]) for d in ctx.attrs.depends]

def _configure_args(ctx: AnalysisContext) -> cmd_args:
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
    tset_depends = ctx.actions.tset(
        PackageConfTSet,
        children = [dep[UnitInfo].package_conf_tset for dep in ctx.attrs.depends],
    )
    return cmd_args(
        cmd_args(haskell_toolchain.compiler, format = "--with-compiler={}"),
        "--exact-configuration",
        "--ghc-option=-hide-all-packages",
        "--exact-configuration",
        "--package-db=clear",
        "--package-db=global",
        cmd_args(package_db(ctx, tset_depends), format = "--package-db={}"),
        _dependencies(ctx),
        _flags(ctx),
    )

def _step_configure(ctx: AnalysisContext):
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    setup_config = ctx.actions.declare_output("builddir", "setup-config")

    config_args = cmd_args(
        cmd_args(setup_config.as_output(), format = "--builddir={}", parent = 1),
        _configure_args(ctx),
    )

    config_args.add("--cid={}".format(ctx.attrs.unit_id))
    config_args.add(_component_name(ctx))

    configure_script, _ = ctx.actions.write(
        "configure.sh",
        [
            "#!/usr/bin/env bash",
            cmd_args(srcdir, format = "cd {}"),
            cmd_args(setup, "configure", config_args, delimiter = " ", relative_to = srcdir),
        ],
        allow_args = True,
        is_executable = True,
        with_inputs = True,
    )
    ctx.actions.run(cmd_args(configure_script, hidden = [setup_config.as_output()]), category = "configure")
    return setup_config

def _step_build(ctx: AnalysisContext, setup_config: Artifact):
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    builddir = ctx.actions.declare_output("builddir", "build", dir = True)

    build_args = cmd_args(
        cmd_args(builddir.as_output(), format = "--builddir={}", parent = 1),
    )
    if ctx.attrs.component_name:
        build_args.add(_component_name(ctx))

    build_script, _ = ctx.actions.write(
        "build.sh",
        [
            "#!/usr/bin/env bash",
            cmd_args(srcdir, format = "cd {}"),
            cmd_args(setup, "build", build_args, delimiter = " ", relative_to = srcdir),
        ],
        allow_args = True,
        is_executable = True,
        with_inputs = True,
    )
    ctx.actions.run(cmd_args(build_script, hidden = [setup_config, builddir.as_output()]), category = "build")
    return builddir

def _step_register(ctx: AnalysisContext, builddir: Artifact):
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    package_conf = ctx.actions.declare_output("{}.conf".format(ctx.attrs.unit_id))

    register_args = cmd_args(
        cmd_args(builddir, format = "--builddir={}", parent = 1),
        "--inplace",
        cmd_args(package_conf.as_output(), format = "--gen-pkg-config={}"),
    )

    if ctx.attrs.component_name:
        register_args.add(_component_name(ctx))

    register_script, _ = ctx.actions.write(
        "register.sh",
        [
            "#!/usr/bin/env bash",
            cmd_args(srcdir, format = "cd {}"),
            cmd_args(setup, "register", register_args, delimiter = " ", relative_to = srcdir),
        ],
        allow_args = True,
        is_executable = True,
        with_inputs = True,
    )
    ctx.actions.run(cmd_args(register_script, hidden = [builddir, package_conf.as_output()]), category = "register")
    return package_conf

def _configured_unit_impl(ctx: AnalysisContext) -> list[Provider]:
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

    tset_depends = ctx.actions.tset(
        PackageConfTSet,
        children = [dep[UnitInfo].package_conf_tset for dep in ctx.attrs.depends],
    )

    setup_config = _step_configure(ctx)
    builddir = _step_build(ctx, setup_config)
    package_conf = _step_register(ctx, builddir)

    package_conf_tset = ctx.actions.tset(
        PackageConfTSet,
        value = package_conf,
        children = [tset_depends],
    )

    providers = [DefaultInfo(default_output = builddir)]

    if ctx.attrs.component_name == "lib":
        providers.append(
            UnitInfo(
                id = ctx.attrs.unit_id,
                name = ctx.attrs.pkg_name,
                version = ctx.attrs.pkg_version,
                #
                package_conf = package_conf,
                package_conf_tset = package_conf_tset,
            ),
        )
    elif ctx.attrs.component_name.startswith("lib:"):
        lib_name = ctx.attrs.component_name[4:]
        providers.append(
            UnitInfo(
                id = ctx.attrs.unit_id,
                name = ctx.attrs.pkg_name,
                version = ctx.attrs.pkg_version,
                lib_name = lib_name,
                #
                package_conf = package_conf,
                package_conf_tset = package_conf_tset,
            ),
        )

    if ctx.attrs.component_name.startswith("exe:"):
        exe_name = ctx.attrs.component_name[4:]
        providers.append(RunInfo(args = [exe_name]))

    return providers

configured_unit = rule(
    impl = _configured_unit_impl,
    attrs =
        common_unit_attrs |
        source_unit_attrs |
        {"component_name": attrs.string()},
)

def _configured_legacy_unit_impl(ctx: AnalysisContext) -> list[Provider]:
    """
    For legacy packages (i.e. anything other than the simple build-type) we
    have to configure and build in a single step, since we do not really know
    what is gong to be written where.
    """
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    tset_depends = ctx.actions.tset(
        PackageConfTSet,
        children = [dep[UnitInfo].package_conf_tset for dep in ctx.attrs.depends],
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
                _configure_args(ctx),
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
        children = [tset_depends],
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

configured_legacy_unit = rule(
    impl = _configured_legacy_unit_impl,
    attrs = common_unit_attrs | source_unit_attrs,
)

def _in_dir(*script, work_dir):
    return cmd_args("env", "-C", work_dir, cmd_args(*script).relative_to(work_dir))

def _in_dir(*script, work_dir):
    return cmd_args("env", "-C", work_dir, cmd_args(*script).relative_to(work_dir))
