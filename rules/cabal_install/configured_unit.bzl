load(
  "@prelude//haskell:toolchain.bzl",
  "HaskellToolchainInfo",
  "HaskellPlatformInfo",
)
load(
  "common.bzl",
  "CabalPackageInfo",
  "PackageInfo",
  "PackageConfTSet",
  "basic_unit",
  "cabal_package_db",
)


def _component_name(ctx : AnalysisContext) -> str:
  return "lib:{}".format(ctx.attrs.pkg_name) if ctx.attrs.component_name == "lib" else ctx.attrs.component_name


def _flags(ctx : AnalysisContext) -> cmd_args:
  return cmd_args([("+" if value else "-") + name for name, value in ctx.attrs.flags.items()], format="--flags={}")


def _dependencies(ctx : AnalysisContext) -> list[str]:
  return ["--dependency={}={}".format(d[PackageInfo].pkg_name, d[PackageInfo].unit_id) for d in ctx.attrs.depends]


def _configured_unit_impl(ctx : AnalysisContext) -> list[Provider]:
  haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]
  setup = ctx.attrs.setup[RunInfo]

  srcdir = ctx.attrs.src[CabalPackageInfo].srcdir

  tset_children = ctx.actions.tset(
    PackageConfTSet,
    children = [dep[PackageInfo].package_conf_tset for dep in ctx.attrs.depends]
  )

  config = ctx.actions.declare_output("builddir", "setup-config")
  configure_cmd = cmd_args(
    setup, "configure",
    cmd_args(config.as_output(), format = "--builddir={}", parent=1),
    "--with-ghc", haskell_toolchain.compiler,
    "--cid={}".format(ctx.attrs.unit_id),
    "--exact-configuration",
    "--ghc-option=-hide-all-packages",
    cabal_package_db(ctx, tset_children),
    _dependencies(ctx),
    _flags(ctx),
    _component_name(ctx),
  )
  ctx.actions.run(_in_dir(configure_cmd, work_dir=srcdir), category = "configure")

  build_output = ctx.actions.declare_output("builddir", "build", dir = True)
  build_cmd = cmd_args(
    setup, "build",
    cmd_args(build_output.as_output(), format = "--builddir={}", parent=1),
    _component_name(ctx),
    hidden = [config]
  )
  ctx.actions.run(_in_dir(build_cmd, work_dir=srcdir), category = "build")

  package_conf = ctx.actions.declare_output("package.conf")
  register_cmd = cmd_args(
    setup, "register",
    cmd_args(build_output, format = "--builddir={}", parent=1),
    "--inplace",
    cmd_args(package_conf.as_output(), format="--gen-pkg-config={}"),
    _component_name(ctx),
  )
  ctx.actions.run(_in_dir(register_cmd, work_dir=srcdir), category = "register")

  package_conf_tset = ctx.actions.tset(
    PackageConfTSet,
    value = package_conf,
    children = [tset_children]
  )

  return [
    DefaultInfo(
      default_output = build_output,
    ),
    PackageInfo(
      unit_id = ctx.attrs.unit_id,
      pkg_name = ctx.attrs.pkg_name,
      package_conf = package_conf,
      package_conf_tset = package_conf_tset,
    )
  ]


configured_unit = rule(
  impl = _configured_unit_impl,
  attrs = {
    "src": attrs.dep(providers = [CabalPackageInfo]),
    "flags": attrs.dict(attrs.string(), attrs.bool()),
    "component_name": attrs.string(),
    "exe_depends": attrs.list(attrs.dep(), default = []),
    "setup": attrs.dep(providers = [RunInfo]),
    "_haskell_toolchain": attrs.toolchain_dep(default = "toolchains//:haskell", providers = [HaskellToolchainInfo, HaskellPlatformInfo])
  } | basic_unit,
)


def _in_dir(*script, work_dir):
  return cmd_args("env", "-C", work_dir, cmd_args(*script).relative_to(work_dir))

