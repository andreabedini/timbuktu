"""
Build rules for the simple build-type.
"""

load("@prelude//:paths.bzl", "paths")
load(
    "@prelude//cxx:cxx_toolchain_types.bzl",
    "LinkerType",
)
load(
    "@prelude//haskell:toolchain.bzl",
    "HaskellPlatformInfo",
    "HaskellToolchainInfo",
)
load(
    "@prelude//haskell/library_info.bzl",
    "HaskellLibraryInfo",
    "HaskellLibraryInfoTSet",
    "HaskellLibraryProvider",
)
load(
    "@prelude//linking:link_info.bzl",
    "Archive",
    "ArchiveLinkable",
    "LinkInfo",
    "LinkInfos",
    "LinkStyle",
    "SharedLibLinkable",
)
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
    "mkInstallDirs",
    "mkProviders",
    "source_unit_attrs",
)

def _build_impl(ctx: AnalysisContext) -> list[Provider]:
    srcdir = ctx.attrs.src[CabalPackageInfo].srcdir
    setup = ctx.attrs.setup[RunInfo]

    # NOTE: I need to copy so I know (statically) where the datadir is
    # WARN: This still does not work because the units I build do not provide
    # the information the prelude expects.

    env = build_env(ctx.attrs.exec_deps)

    installdirs = mkInstallDirs(ctx.actions)

    setup_config = ctx.actions.declare_output("setup-config")

    build = ctx.actions.declare_output("build", dir = True)
    builddir = cmd_args(build, parent = 1)

    package_db = ctx.actions.declare_output("package.conf.d", dir = True)
    package_conf = package_db.project("{}.conf".format(ctx.attrs.unit_id))

    # configure

    configure_cmd = cmd_args(
        env,
        setup,
        "configure",
        cmd_args(builddir, format = "--builddir={}", ignore_artifacts = True),
        cmd_args(installdirs.args, ignore_artifacts = True),
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
    )

    configure_sh = ctx.actions.write(
        "configure.sh",
        configure_sh_content,
        with_inputs = True,
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
        cmd_args(builddir, format = "--builddir={}", ignore_artifacts = True),
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
        with_inputs = True,
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
    )

    copy_sh = ctx.actions.write(
        "copy.sh",
        copy_sh_content,
        with_inputs = True,
        is_executable = True,
    )

    ctx.actions.run(
        cmd_args(copy_sh, hidden = [installdirs.prefix.as_output()]),
        category = "cabal_copy",
    )

    # register

    register_cmd = cmd_args(
        env,
        setup,
        "register",
        cmd_args(builddir, format = "--builddir={}"),
        cmd_args(package_conf.as_output(), format = "--gen-pkg-config={}"),
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
    )

    register_sh = ctx.actions.write(
        "register.sh",
        register_sh_content,
        is_executable = True,
    )

    ctx.actions.run(
        cmd_args(register_sh, hidden = [installdirs.prefix, package_db.as_output()]),
        category = "cabal_register",
    )

    # providers

    providers = [
        # provider
        DefaultInfo(
            default_outputs = [installdirs.prefix, package_conf],
        ),
    ]

    package_conf_tset = ctx.actions.tset(
        PackageConfTSet,
        value = package_conf,
        children = [
            dep[UnitInfo].package_conf_tset
            for dep in ctx.attrs.deps
        ],
    )

    # shared_libs = {
    #     "libHSCabal-3.12.0.0-7126-ghc9.10.1.so": "lib/x86_64-linux-ghc-9.10.1/libHSCabal-3.12.0.0-7126-ghc9.10.1.so",
    # },
    # static_libs = [
    #     "lib/x86_64-linux-ghc-9.10.1/Cabal-3.12.0.0-7126/libHSCabal-3.12.0.0-7126.a",
    # ],
    # profiled_static_libs = [
    #     "lib/x86_64-linux-ghc-9.10.1/Cabal-3.12.0.0-7126/libHSCabal-3.12.0.0-7126_p.a",
    # ],

    if ctx.attrs.component_name == "lib" or ctx.attrs.component_name.startswith("lib:"):
        lib_name = ctx.attrs.component_name[4:] or None

        providers.extend(mkProviders(ctx, package_db, installdirs))

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
        exe = installdirs.prefix.project(paths.join("bin", exe_name))
        providers.extend([
            RunInfo(args = exe),
            # NOTE: this is an artifact not cmd_args
            ExeDependInfo(
                mangledPkgName = manglePkgName(ctx.attrs.pkg_name),
                exe = exe,
                datadir = installdirs.prefix.project("data"),
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
