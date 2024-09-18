load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("common.bzl", "CabalPackageInfo", "PackageInfo", "PackageConfTSet", "package_db", "output_args")


def _setup_simple(ctx: AnalysisContext, setup: Artifact):
  haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
  setup_hs = ctx.actions.write("Setup.hs", "import Distribution.Simple; main = defaultMain")
  compile_cmd = cmd_args(
    haskell_toolchain.compiler,
    haskell_toolchain.compiler_flags,
    output_args(ctx),
    "-o",
    setup.as_output(),
    setup_hs,
  )
  ctx.actions.run(compile_cmd, category = "setup")


def _setup_configure(ctx: AnalysisContext, setup: Artifact):
  haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
  setup_hs = ctx.actions.write("Setup.hs", "import Distribution.Simple; main = defaultMainWithHooks autoconfUserHooks")
  compile_cmd = cmd_args(
    haskell_toolchain.compiler,
    haskell_toolchain.compiler_flags,
    output_args(ctx),
    "-o",
    setup.as_output(),
    setup_hs,
  )
  ctx.actions.run(compile_cmd, category = "setup")


def _setup_custom(ctx : AnalysisContext, setup: Artifact):
  haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

  # TODO setup.lhs
  setup_hs = ctx.attrs.src[CabalPackageInfo].srcdir.project("Setup.hs")

  tset = ctx.actions.tset(
    PackageConfTSet,
    children = [dep[PackageInfo].package_conf_tset for dep in ctx.attrs.depends]
  )

  dependencies = cmd_args([dep[PackageInfo].unit_id for dep in ctx.attrs.depends], prepend="-package-id")

  compile_cmd =  cmd_args(
    haskell_toolchain.compiler,
    haskell_toolchain.compiler_flags,
    output_args(ctx),
    "-o",
    setup.as_output(),
    setup_hs,
  )

  compile_cmd.add(
    "-hide-all-packages",
    "-clear-package-db",
    "-global-package-db",
    cmd_args(package_db(ctx, tset), format = "-package-db {}"),
    dependencies
  )

  ctx.actions.run(compile_cmd, category = "setup")


def _setup_impl(ctx : AnalysisContext) -> list[Provider]:
  cabalfile = ctx.attrs.src[CabalPackageInfo].cabalfile

  setup = ctx.actions.declare_output("Setup")

  cabaljson = ctx.actions.declare_output("cabal.json")
  ctx.actions.run(
    cmd_args(ctx.attrs._cabal2json[RunInfo], cabalfile, cabaljson.as_output()),
    category = "cabal2json"
  )

  def f(ctx, artifacts, outputs):
    gpd = artifacts[cabaljson].read_json()
    if gpd["build-type"] == "Simple":
      _setup_simple(ctx, outputs[setup])
    elif gpd["build-type"] == "Configure":
      _setup_configure(ctx, outputs[setup])
    elif gpd["build-type"] == "Custom":
      _setup_custom(ctx, outputs[setup])
    else:
      fail("Unsupported build-type: {}".format(gpd["build-type"]))

  ctx.actions.dynamic_output(
    dynamic = [cabaljson],
    inputs = [],
    outputs = [setup.as_output()],
    f = f)

  # TODO exe depends and data dirs

  return [
    DefaultInfo(default_output = setup),
    RunInfo(args = setup)
  ]

setup = rule(
  impl = _setup_impl,
  attrs = {
    "src": attrs.dep(providers = [CabalPackageInfo]),
    "depends": attrs.list(attrs.dep(), default = []),
    "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo]),
    "_cabal2json": attrs.dep(provider = [RunInfo], default = "//helpers:cabal2json"),
  }
)

