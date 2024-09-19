load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load(
    "common.bzl",
    "CabalPackageInfo",
    "PackageConfTSet",
    "PackageInfo",
    "common_unit_attrs",
    "package_db",
)

def _component_name(ctx: AnalysisContext) -> str:
    return "lib:{}".format(ctx.attrs.pkg_name) if ctx.attrs.component_name == "lib" else ctx.attrs.component_name

def _flags(ctx: AnalysisContext) -> cmd_args:
    return cmd_args([("+" if value else "-") + name for name, value in ctx.attrs.flags.items()], format = "--flags={}")

def _dependencies(ctx: AnalysisContext) -> list[str]:
    return ["--dependency={}={}".format(d[PackageInfo].pkg_name, d[PackageInfo].unit_id) for d in ctx.attrs.depends]

def _configure_args(ctx: AnalysisContext) -> cmd_args:
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
    tset_depends = ctx.actions.tset(
        PackageConfTSet,
        children = [dep[PackageInfo].package_conf_tset for dep in ctx.attrs.depends],
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
        children = [dep[PackageInfo].package_conf_tset for dep in ctx.attrs.depends],
    )

    setup_config = _step_configure(ctx)
    builddir = _step_build(ctx, setup_config)
    package_conf = _step_register(ctx, builddir)

    package_conf_tset = ctx.actions.tset(
        PackageConfTSet,
        value = package_conf,
        children = [tset_depends],
    )

    return [
        DefaultInfo(
            default_output = builddir,
        ),
        PackageInfo(
            unit_id = ctx.attrs.unit_id,
            pkg_name = ctx.attrs.pkg_name,
            package_conf = package_conf,
            package_conf_tset = package_conf_tset,
        ),
    ]

configured_unit = rule(
    impl = _configured_unit_impl,
    attrs = {
        "src": attrs.dep(providers = [CabalPackageInfo]),
        "flags": attrs.dict(attrs.string(), attrs.bool()),
        "component_name": attrs.string(),
        "exe_depends": attrs.list(attrs.dep(), default = []),
        "setup": attrs.exec_dep(providers = [RunInfo]),
        "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell"),
    } | common_unit_attrs,
)

def _configured_legacy_unit_impl(ctx: AnalysisContext) -> list[Provider]:
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    tset_depends = ctx.actions.tset(
        PackageConfTSet,
        children = [dep[PackageInfo].package_conf_tset for dep in ctx.attrs.depends],
    )

    builddir = ctx.actions.declare_output("builddir")
    package_conf = ctx.actions.declare_output("{}.conf".format(ctx.attrs.unit_id))

    script = ctx.actions.write(
        "script.sh",
        [
            "#!/usr/bin/env bash",
            "set -euo pipefail",
            cmd_args(srcdir, format = "cd {}"),
            cmd_args(
                setup,
                "configure",
                cmd_args(builddir.as_output(), format = "--builddir={}"),
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
        PackageInfo(
            unit_id = ctx.attrs.unit_id,
            pkg_name = ctx.attrs.pkg_name,
            package_conf = package_conf,
            package_conf_tset = package_conf_tset,
        ),
    ]

configured_legacy_unit = rule(
    impl = _configured_legacy_unit_impl,
    attrs = {
        "src": attrs.dep(providers = [CabalPackageInfo]),
        "flags": attrs.dict(attrs.string(), attrs.bool()),
        "exe_depends": attrs.list(attrs.dep(), default = []),
        "setup": attrs.exec_dep(providers = [RunInfo]),
        "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell"),
    } | common_unit_attrs,
)

def _in_dir(*script, work_dir):
    return cmd_args("env", "-C", work_dir, cmd_args(*script).relative_to(work_dir))

def _in_dir(*script, work_dir):
    return cmd_args("env", "-C", work_dir, cmd_args(*script).relative_to(work_dir))
