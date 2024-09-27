load(
    "@prelude//haskell:library_info.bzl",
    "HaskellLibraryInfo",
    "HaskellLibraryInfoTSet",
    "HaskellLibraryProvider",
)
load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("@prelude//linking:link_info.bzl", "LinkStyle")
load("//rules/haskell/cabal_install:common.bzl", "CabalPackageInfo", "PackageConfTSet", "UnitInfo", "output_args", "package_db")

# def _setup_simple_impl(ctx: AnalysisContext) -> list[Provider]:
#     haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
#     setup_exe = ctx.actions.declare_output("Setup")
#     setup_hs = ctx.actions.write("Setup.hs", "import Distribution.Simple; main = defaultMain")
#     compile_cmd = cmd_args(
#         haskell_toolchain.compiler,
#         haskell_toolchain.compiler_flags,
#         output_args(ctx),
#         "-o",
#         setup_exe.as_output(),
#         setup_hs,
#     )
#     ctx.actions.run(compile_cmd, category = "setup")
#     return [
#         DefaultInfo(default_output = setup_exe),
#         RunInfo(args = setup_exe),
#     ]
#
# setup_simple = rule(
#     impl = _setup_simple_impl,
#     attrs = {
#         "deps": attrs.list(attrs.dep(), default = []),
#         "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell"),
#     },
# )
def setup_simple(name, deps, _haskell_toolchain):
    native.haskell_binary(
        name = name,
        deps = deps,
        srcs = {"Main.hs": "//rules/haskell/cabal_install:setup_simple.hs"},
        _haskell_toolchain = _haskell_toolchain,
    )

# def _setup_configure_impl(ctx: AnalysisContext) -> list[Provider]:
#     haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
#     setup_exe = ctx.actions.declare_output("Setup")
#     setup_hs = ctx.actions.write("Setup.hs", "import Distribution.Simple; main = defaultMainWithHooks autoconfUserHooks")
#     compile_cmd = cmd_args(
#         haskell_toolchain.compiler,
#         haskell_toolchain.compiler_flags,
#         output_args(ctx),
#         "-o",
#         setup_exe.as_output(),
#         setup_hs,
#     )
#     ctx.actions.run(compile_cmd, category = "setup")
#     return [
#         DefaultInfo(default_output = setup_exe),
#         RunInfo(args = setup_exe),
#     ]
#
# setup_configure = rule(
#     impl = _setup_configure_impl,
#     attrs = {
#         "deps": attrs.list(attrs.dep()),
#         "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell"),
#     },
# )

def setup_configure(**kwargs):
    native.haskell_binary(
        srcs = {"Main.hs": "//rules/haskell/cabal_install:setup_configure.hs"},
        **kwargs
    )

# def _setup_make_impl(ctx: AnalysisContext) -> list[Provider]:
#     haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
#     setup_exe = ctx.actions.declare_output("Setup")
#     setup_hs = ctx.actions.write("Setup.hs", "import Distribution.Make; main = defaultMain")
#     compile_cmd = cmd_args(
#         haskell_toolchain.compiler,
#         haskell_toolchain.compiler_flags,
#         output_args(ctx),
#         "-o",
#         setup_exe.as_output(),
#         setup_hs,
#     )
#     ctx.actions.run(compile_cmd, category = "setup")
#     return [
#         DefaultInfo(default_output = setup_exe),
#         RunInfo(args = setup_exe),
#     ]
#
# setup_make = rule(
#     impl = _setup_make_impl,
#     attrs = {
#         "deps": attrs.list(attrs.dep()),
#         "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell"),
#     },
# )
def setup_make(**kwargs):
    native.haskell_binary(
        srcs = {"Main.hs": "//rules/haskell/cabal_install:setup_make.hs"},
        **kwargs
    )

def _setup_custom_impl(ctx: AnalysisContext) -> list[Provider]:
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

    setup = ctx.actions.declare_output("Setup")

    # TODO setup.lhs
    setup_hs = ctx.attrs.src[CabalPackageInfo].srcdir.project("Setup.hs")

    package_confs = []
    for dep in ctx.attrs.deps:
        if UnitInfo in dep:
            package_confs.append(dep[UnitInfo].package_conf_tset)
    tset = ctx.actions.tset(PackageConfTSet, children = package_confs)

    depids = []
    for dep in ctx.attrs.deps:
        if HaskellLibraryProvider in dep:
            # TODO: hack!
            depids.append(dep[HaskellLibraryProvider].lib[LinkStyle("static")].id)
        if UnitInfo in dep:
            depids.append(dep[UnitInfo].id)
    dependencies = cmd_args(depids, prepend = "-package-id")

    # TODO exe depends and data dirs
    compile_cmd = cmd_args(
        haskell_toolchain.compiler,
        haskell_toolchain.compiler_flags,
        output_args(ctx),
        "-hide-all-packages",
        "-clear-package-db",
        "-global-package-db",
        cmd_args(package_db(ctx, tset), format = "-package-db {}"),
        dependencies,
        "-o",
        setup.as_output(),
        setup_hs,
    )
    ctx.actions.run(compile_cmd, category = "custom_setup")

    return [
        DefaultInfo(default_output = setup),
        RunInfo(args = setup),
    ]

setup_custom = rule(
    impl = _setup_custom_impl,
    attrs = {
        # FIXME: this should be attrs.source?
        "src": attrs.dep(providers = [CabalPackageInfo]),
        "deps": attrs.list(attrs.dep()),
        "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell"),
    },
)
