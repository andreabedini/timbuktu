load("@prelude//haskell:toolchain.bzl", "HaskellToolchainInfo")
load("@toolchains//ghcup:defs.bzl", "GhcDistributionInfo")

HaskellToolchainLibrary = provider(
    fields = {
        "name": provider_field(str),
    },
)

def _haskell_boot_library(ctx: AnalysisContext) -> list[Provider]:
    compiler = ctx.attrs._haskell_toolchain[HaskellToolchainInfo].compiler
    packager = ctx.attrs._haskell_toolchain[HaskellToolchainInfo].packager

    output_dir = ctx.actions.declare_output("lib", "boot", dir = True)
    boot_lib = ctx.actions.declare_output("lib", "boot-compiler.so")

    ctx.actions.run(
        cmd_args(
            compiler,
            "-boot",
            "-outputdir",
            output_dir.as_output(),
            "-o",
            boot_lib.as_output(),
        ),
        category = "ghc",
        identifier = boot_lib.basename,
    )

    return [
        DefaultInfo(),
        HaskellToolchainLibrary(name = ctx.attrs.pkg_name),
    ]

haskell_boot_library = rule(
    impl = _haskell_boot_library,
    attrs = {
        "pkg_name": attrs.string(),
        "_haskell_toolchain": attrs.toolchain_dep(
            providers = [HaskellToolchainInfo],
            default = "@toolchains//:haskell",
        ),
    },
)

def _haskell_library(ctx: AnalysisContext) -> list[Provider]:
    compiler = ctx.attrs._haskell_toolchain[HaskellToolchainInfo].compiler
    packager = ctx.attrs._haskell_toolchain[HaskellToolchainInfo].packager
    ghc_version = ctx.attrs._haskell_toolchain[GhcDistributionInfo].version

    unit_id = ctx.attrs.unit_id or "{pkg_name}-{pkg_version}".format(pkg_name = ctx.attrs.pkg_name, pkg_version = ctx.attrs.pkg_version)
    lib_name = "HS{unit_id}".format(unit_id = unit_id)

    package_conf = ctx.actions.declare_output("package.conf.d", "{unit_id}.conf".format(unit_id = unit_id))
    package_cache = ctx.actions.declare_output("package.conf.d", "package.cache")

    output_dir = ctx.actions.declare_output("lib", unit_id, dir = True)
    shared_lib = ctx.actions.declare_output("lib", "lib{libname}-ghc{ghc_version}.so".format(libname = lib_name, ghc_version = ghc_version))
    static_lib = ctx.actions.declare_output("lib", "lib{libname}.a".format(libname = lib_name))

    common_args = cmd_args(
        "--make",
        "-package",
        "ghc",
        "-i",
        cmd_args(ctx.attrs.srcs, format = "-i{}"),
        "-this-unit-id",
        unit_id,
        cmd_args(ctx.attrs.modules),
    )

    ctx.actions.run(
        cmd_args(
            compiler,
            "-static",
            "-dynamic-too",
            "-outputdir",
            output_dir.as_output(),
            common_args,
        ),
        category = "ghc",
        identifier = static_lib.basename,
    )

    obj_files = [
        output_dir.project("{obj}.o".format(unit_id = unit_id, obj = m.replace(".", "/")))
        for m in ctx.attrs.modules
    ]

    ctx.actions.run(
        cmd_args(
            "ar",
            "-r",
            static_lib.as_output(),
            *obj_files
        ),
        category = "ar",
    )

    ctx.actions.run(
        cmd_args(
            compiler,
            "-shared",
            "-dynamic",
            "-outputdir",
            output_dir,
            common_args,
            "-o",
            shared_lib.as_output(),
        ),
        category = "ghc",
        identifier = shared_lib.basename,
    )

    ctx.actions.run(
        cmd_args(
            packager,
            "recache",
            "--package-db",
            cmd_args(package_cache.as_output(), parent = 1),
        ),
        category = "ghc_pkg",
    )

    ctx.actions.write(
        package_conf.as_output(),
        format_package_conf(
            name = ctx.attrs.pkg_name,
            version = ctx.attrs.pkg_version,
            visibility = "public",
            id = unit_id,
            key = unit_id,
            exposed = "True",
            exposed_modules = " ".join(ctx.attrs.modules),
            import_dirs = cmd_args(output_dir),
            library_dirs = cmd_args(static_lib, parent = 1),
            library_dirs_static = cmd_args(static_lib, parent = 1),
            dynamic_library_dirs = cmd_args(shared_lib, parent = 1),
            hs_libraries = lib_name,
            depends = " ".join(["base-4.21.0.0-5b43", "containers-0.7-40d4", "directory-1.3.9.0-cbf1", "filepath-1.5.4.0-04d4", "ghc-9.12.2-c687", "os-string-2.0.7-6e72"]),
        ),
        allow_args = True,
        with_inputs = True,
    )

    return [
        DefaultInfo(
            default_outputs = [shared_lib, static_lib, package_conf, package_cache],
        ),
    ]

haskell_library = rule(
    impl = _haskell_library,
    attrs = {
        "pkg_name": attrs.string(),
        "pkg_version": attrs.string(),
        "unit_id": attrs.option(attrs.string(), default = None),
        "modules": attrs.list(attrs.string(), default = []),
        "srcs": attrs.list(attrs.source()),
        "deps": attrs.list(attrs.string(), default = []),
        "_haskell_toolchain": attrs.toolchain_dep(
            providers = [GhcDistributionInfo, HaskellToolchainInfo],
            default = "@toolchains//:haskell",
        ),
    },
)

def format_package_conf(**attrs):
    s = cmd_args(delimiter = "\n")
    for k, v in attrs.items():
        s.add(cmd_args(k, v, delimiter = ": "))
    return s
