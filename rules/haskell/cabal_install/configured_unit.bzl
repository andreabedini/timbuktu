load("@prelude//:paths.bzl", "paths")
load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load(
    "common.bzl",
    "CabalPackageInfo",
    "ExeDependInfo",
    "PackageConfTSet",
    "UnitInfo",
    "common_unit_attrs",
    "manglePkgName",
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
    return [_dependency(d[UnitInfo]) for d in ctx.attrs.deps]

def _configure_args(ctx: AnalysisContext) -> cmd_args:
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

def _configured_unit_impl(ctx: AnalysisContext) -> list[Provider]:
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    setup_config = ctx.actions.declare_output("builddir", "setup-config")
    builddir = ctx.actions.declare_output("builddir", "build", dir = True)
    prefix = ctx.actions.declare_output("prefix", dir = True)
    package_conf = ctx.actions.declare_output("package.conf.d", "{}.conf".format(ctx.attrs.unit_id))

    # configure

    config_args = cmd_args(
        "-v",
        cmd_args(setup_config.as_output(), format = "--builddir={}", parent = 1),
    )

    config_args.add(
        cmd_args(prefix, format = "--prefix=$(realpath {})", ignore_artifacts = True),
        "--libsubdir=",
        "--libexecsubdir=",
        "--datadir=\\$prefix/data",
        "--datasubdir=",
        "--docdir=\\$prefix/doc",
    )

    # TODO: refactor
    config_args.add(_configure_args(ctx))
    config_args.add("--cid={}".format(ctx.attrs.unit_id))
    config_args.add(_component_name(ctx))

    env = cmd_args()

    if ctx.attrs.exec_deps:
        path = cmd_args([k[ExeDependInfo].exe for k in ctx.attrs.exec_deps], parent = 1, delimiter = ":")
        env.add(cmd_args(path, format = "PATH={}:$PATH"))

    for dep in ctx.attrs.exec_deps:
        env.add(cmd_args(
            [
                cmd_args(dep[ExeDependInfo].mangledPkgName, format = "{}_datadir"),
                dep[ExeDependInfo].datadir,
            ],
            delimiter = "=",
        ))

    ctx.actions.run(
        cmd_args("sh", "-c", cmd_args(
            cmd_args(srcdir, format = "cd {}"),
            cmd_args(
                env,
                setup,
                "configure",
                config_args,
                relative_to = srcdir,
                delimiter = " ",
            ),
            delimiter = "; ",
        )),
        category = "cabal_configure",
    )

    # build

    build_args = cmd_args(
        cmd_args(builddir.as_output(), format = "--builddir={}", parent = 1),
    )
    if ctx.attrs.component_name:
        build_args.add(_component_name(ctx))

    ctx.actions.run(
        cmd_args("sh", "-c", cmd_args(
            cmd_args(srcdir, format = "cd {}"),
            cmd_args(env, setup, "build", build_args, relative_to = srcdir, delimiter = " "),
            delimiter = "; ",
            hidden = [setup_config],
        )),
        category = "cabal_build",
    )

    # copy

    copy_args = cmd_args(
        cmd_args(builddir, format = "--builddir={}", parent = 1),
    )

    if ctx.attrs.component_name:
        copy_args.add(_component_name(ctx))

    ctx.actions.run(
        cmd_args("sh", "-c", cmd_args(
            cmd_args(srcdir, format = "cd {}"),
            # Pre-create output directories because I cannot tell if the
            # package is going to populate them or not.
            # [cmd_args(install_dirs.values(), format = "mkdir {}", ignore_artifacts = True, relative_to = srcdir)],
            cmd_args(env, setup, "copy", "-v", copy_args, relative_to = srcdir, delimiter = " "),
            delimiter = "; ",
            hidden = [prefix.as_output(), builddir],
        )),
        category = "cabal_copy",
    )

    # register

    register_args = cmd_args(
        cmd_args(builddir, format = "--builddir={}", parent = 1),
    )

    register_args.add(cmd_args(package_conf.as_output(), format = "--gen-pkg-config={}"))

    if ctx.attrs.component_name:
        register_args.add(_component_name(ctx))

    ctx.actions.run(
        cmd_args("sh", "-c", cmd_args(
            cmd_args(srcdir, format = "cd {}"),
            # Pre-create output directories because I cannot tell if the
            # package is going to populate them or not.
            # [cmd_args(install_dirs.values(), format = "mkdir {}", ignore_artifacts = True, relative_to = srcdir)],
            cmd_args(env, setup, "register", register_args, relative_to = srcdir, delimiter = " "),
            delimiter = "; ",
            hidden = [builddir],
        )),
        category = "cabal_register",
    )

    # providers

    providers = [DefaultInfo(
        default_outputs = [prefix],
    )]

    package_conf_tset = ctx.actions.tset(
        PackageConfTSet,
        value = package_conf,
        children = [
            dep[UnitInfo].package_conf_tset
            for dep in ctx.attrs.deps
        ],
    )

    if ctx.attrs.component_name == "lib" or ctx.attrs.component_name.startswith("lib:"):
        lib_name = ctx.attrs.component_name[4:] or None
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
        exe = builddir.project(paths.join(exe_name, exe_name))
        providers.extend([
            RunInfo(args = exe),
            # NOTE: this is an artifact not cmd_args
            ExeDependInfo(
                mangledPkgName = manglePkgName(ctx.attrs.pkg_name),
                exe = exe,
                datadir = prefix.project("data"),
            ),
        ])

    return providers

configured_unit = rule(
    impl = _configured_unit_impl,
    attrs =
        common_unit_attrs |
        source_unit_attrs |
        {
            "component_name": attrs.string(),
            "setup": attrs.dep(
                default = "//rules/haskell/cabal_install:setup_simple",
                providers = [RunInfo],
            ),
        },
)

def _configured_legacy_unit_impl(ctx: AnalysisContext) -> list[Provider]:
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

configured_legacy_unit = rule(
    impl = _configured_legacy_unit_impl,
    attrs =
        common_unit_attrs |
        source_unit_attrs |
        {"setup": attrs.dep(providers = [RunInfo])},
)

def _in_dir(*script, work_dir):
    return cmd_args("env", "-C", work_dir, cmd_args(relative_to = work_dir, *script))
