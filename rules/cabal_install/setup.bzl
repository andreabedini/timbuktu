load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("common.bzl", "CabalPackageInfo", "PackageInfo", "PackageConfTSet", "ghc_package_db")


def _setup_simple(ctx : AnalysisContext, setup_exe : Artifact):
  ghc = ctx.attrs._haskell_toolchain[HaskellToolchainInfo].compiler
  ctx.actions.run(
    cmd_args(ghc, ctx.attrs._setup_simple_hs, "-o", setup_exe.as_output()),
    category = "setup"
  )


def _setup_configure(ctx : AnalysisContext, setup_exe : Artifact):
  ghc = ctx.attrs._haskell_toolchain[HaskellToolchainInfo].compiler
  ctx.actions.run(
    cmd_args(ghc, ctx.attrs._setup_configure_hs, "-o", setup_exe.as_output()),
    category = "setup"
  )


def _setup_custom(ctx : AnalysisContext, setup_exe : Artifact):
  ghc = ctx.attrs._haskell_toolchain[HaskellToolchainInfo].compiler

  # TODO setup.lhs
  setup_hs = ctx.attrs.src[CabalPackageInfo].srcdir.project("Setup.hs")

  tset = ctx.actions.tset(
    PackageConfTSet,
    children = [dep[PackageInfo].package_conf_tset for dep in ctx.attrs.depends]
  )

  dependencies = cmd_args([dep[PackageInfo].unit_id for dep in ctx.attrs.depends], prepend="-package-id")

  ctx.actions.run(
    cmd_args(ghc, ghc_package_db(ctx, tset), dependencies, setup_hs, "-o", setup_exe.as_output()),
    category = "setup"
  )


def _setup_impl(ctx : AnalysisContext) -> list[Provider]:
  cabaljson = ctx.attrs.src[CabalPackageInfo].cabaljson

  setup_exe = ctx.actions.declare_output("Setup")

  def f(ctx, artifacts, outputs):
    gpd = artifacts[cabaljson].read_json()
    if gpd["build-type"] == "Simple":
      return _setup_simple(ctx, outputs[setup_exe])
    elif gpd["build-type"] == "Configure":
      return _setup_configure(ctx, outputs[setup_exe])
    elif gpd["build-type"] == "Custom":
      return _setup_custom(ctx, outputs[setup_exe])
    else:
      fail("Unsupported build-type: {}".format(gpd["build-type"]))

  ctx.actions.dynamic_output(
    dynamic = [cabaljson],
    inputs = [],
    outputs = [setup_exe.as_output()],
    f = f)

  # TODO exe depends and data dirs

  return [
    DefaultInfo(default_output = setup_exe),
    RunInfo(args = setup_exe)
  ]

setup = rule(
  impl = _setup_impl,
  attrs = {
    "src": attrs.dep(providers = [CabalPackageInfo]),
    "depends": attrs.list(attrs.dep(), default = []),
    "_haskell_toolchain": attrs.toolchain_dep(default = "toolchains//:haskell", providers = [HaskellToolchainInfo, HaskellPlatformInfo]),
    "_setup_simple_hs" : attrs.source(default = "//rules/cabal_install:setup_simple.hs"),
    "_setup_configure_hs" : attrs.source(default = "//rules/cabal_install:setup_configure.hs"),
  }
)

