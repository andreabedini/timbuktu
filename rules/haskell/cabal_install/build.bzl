"""
Build rules for the simple build-type.
"""

load("@prelude//:paths.bzl", "paths")
load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//haskell/library_info.bzl", "HaskellLibraryInfo", "HaskellLibraryProvider")
load("@prelude//linking:link_info.bzl", "LinkStyle")
load(
    "common.bzl",
    "CabalPackageInfo",
    "ExeDependInfo",
    "PackageConfTSet",
    "UnitInfo",
    "build_env",
    "common_unit_attrs",
    "configure_args",
    "manglePkgName",
    "source_unit_attrs",
)

def _build_impl(ctx: AnalysisContext) -> list[Provider]:
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    # NOTE: I need to copy so I know (statically) where the datadir is
    # WARN: This still does not work because the units I build do not provide
    # the information the prelude expects.

    env = build_env(ctx.attrs.exec_deps)

    # configure

    prefix = ctx.actions.declare_output("prefix", dir = True)

    installdirs = cmd_args(
        cmd_args(prefix, format = "--prefix=$(realpath {})"),
        "--libsubdir=",
        "--libexecsubdir=",
        "--datadir='$prefix/data'",
        "--datasubdir=",
        "--docdir='$prefix/doc'",
    )

    setup_config = ctx.actions.declare_output("setup-config")
    build = ctx.actions.declare_output("build", dir = True)
    builddir = cmd_args(build, parent = 1)

    configure_cmd = cmd_args(
        env,
        setup,
        "configure",
        cmd_args(builddir, format = "--builddir={}"),
        installdirs,
        configure_args(ctx),
        delimiter = " ",
    )

    configure_cmd.add("--cid={}".format(ctx.attrs.unit_id))

    if ctx.attrs.component_name:
        configure_cmd.add(_component_name(ctx))

    configure_sh_content = cmd_args(
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        cmd_args(srcdir, format = "cd {}"),
        cmd_args(configure_cmd, relative_to = srcdir),
        ignore_artifacts = True,
    )

    configure_sh = ctx.actions.write(
        "configure.sh",
        configure_sh_content,
        is_executable = True,
    )

    ctx.actions.run(
        cmd_args(configure_sh, hidden = [srcdir, setup, setup_config.as_output()]),
        category = "cabal_configure",
    )

    # build

    build_cmd = cmd_args(
        env,
        setup,
        "build",
        cmd_args(builddir, format = "--builddir={}"),
        delimiter = " ",
    )

    if ctx.attrs.component_name:
        build_cmd.add(_component_name(ctx))

    build_sh_content = cmd_args(
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        cmd_args(srcdir, format = "cd {}"),
        cmd_args(build_cmd, relative_to = srcdir),
    )

    build_sh = ctx.actions.write(
        "build.sh",
        build_sh_content,
        is_executable = True,
    )

    ctx.actions.run(
        cmd_args(build_sh, hidden = [setup_config, build.as_output()]),
        category = "cabal_build",
    )

    # copy

    copy_cmd = cmd_args(
        env,
        setup,
        "copy",
        cmd_args(builddir, format = "--builddir={}"),
        delimiter = " ",
    )

    if ctx.attrs.component_name:
        copy_cmd.add(_component_name(ctx))

    copy_sh_content = cmd_args(
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        cmd_args(srcdir, format = "cd {}"),
        cmd_args(copy_cmd, relative_to = srcdir),
        ignore_artifacts = True,
    )

    copy_sh = ctx.actions.write(
        "copy.sh",
        copy_sh_content,
        is_executable = True,
    )

    ctx.actions.run(
        cmd_args(copy_sh, hidden = [builddir, prefix.as_output()]),
        category = "cabal_copy",
    )

    # register

    package_db = ctx.actions.declare_output("package.conf.d", dir = True)
    package_conf = package_db.project("{}.conf".format(ctx.attrs.unit_id))

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
        cmd_args(package_db, format = "--package-db={}"),
        delimiter = " ",
    )

    if ctx.attrs.component_name:
        register_cmd.add(_component_name(ctx))

    register_sh_content = cmd_args(
        "#!/usr/bin/env bash",
        "set -euo pipefail",
        cmd_args(srcdir, format = "cd {}"),
        cmd_args("mkdir", package_db, delimiter = " ", relative_to = srcdir),
        cmd_args(register_cmd, relative_to = srcdir),
        cmd_args(ghc_cmd, relative_to = srcdir),
        ignore_artifacts = True,
    )

    register_sh = ctx.actions.write(
        "register.sh",
        register_sh_content,
        is_executable = True,
    )

    ctx.actions.run(
        cmd_args(register_sh, hidden = [builddir, package_conf.as_output()]),
        category = "cabal_register",
    )

    # providers

    providers = [
        # provider
        DefaultInfo(
            default_outputs = [prefix, package_conf],
        ),
    ]

    # package_conf_tset = ctx.actions.tset(
    #     PackageConfTSet,
    #     value = package_conf,
    #     children = [
    #         dep[UnitInfo].package_conf_tset
    #         for dep in ctx.attrs.deps
    #     ],
    # )

    if ctx.attrs.component_name == "lib" or ctx.attrs.component_name.startswith("lib:"):
        lib_name = ctx.attrs.component_name[4:] or None

        hli = HaskellLibraryProvider(
            lib = {
                LinkStyle("shared"): HaskellLibraryInfo(
                    name = ctx.attrs.pkg_name,
                    version = ctx.attrs.pkg_version,
                    id = ctx.attrs.unit_id,
                    db = package_db,
                    import_dirs = {},
                    stub_dirs = [],
                    libs = [],
                    is_prebuilt = True,
                    profiling_enabled = False,
                ),
                LinkStyle("static"): HaskellLibraryInfo(
                    name = ctx.attrs.pkg_name,
                    version = ctx.attrs.pkg_version,
                    id = ctx.attrs.unit_id,
                    db = package_db,
                    import_dirs = {},
                    stub_dirs = [],
                    libs = [],
                    is_prebuilt = True,
                    profiling_enabled = False,
                ),
            },
        )

        providers.append(hli)

        # providers.append(
        #     UnitInfo(
        #         id = ctx.attrs.unit_id,
        #         name = ctx.attrs.pkg_name,
        #         version = ctx.attrs.pkg_version,
        #         lib_name = lib_name,
        #         #
        #         package_conf = package_conf,
        #         package_conf_tset = package_conf_tset,
        #     ),
        # )

    if ctx.attrs.component_name.startswith("exe:"):
        exe_name = ctx.attrs.component_name[4:]
        exe = prefix.project(paths.join("bin", exe_name))
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

build = rule(
    impl = _build_impl,
    attrs =
        common_unit_attrs |
        source_unit_attrs |
        {
            "component_name": attrs.string(),
            "setup": attrs.dep(
                default = "//rules/haskell/cabal_install/helpers:setup_simple",
                providers = [RunInfo],
            ),
        },
)

def _component_name(ctx: AnalysisContext) -> str:
    return "lib:{}".format(ctx.attrs.pkg_name) if ctx.attrs.component_name == "lib" else ctx.attrs.component_name
