load("@prelude//decls/toolchains_common.bzl", "toolchains_common")
load("@prelude//haskell:toolchain.bzl", "HaskellToolchainInfo")
load(
  "common.bzl",
  "PackageInfo",
  "PackageConfTSet",
  "basic_unit"
)


def _component_name(ctx : AnalysisContext) -> str:
  return "lib:{}".format(ctx.attrs.pkg_name) if ctx.attrs.component_name == "lib" else ctx.attrs.component_name


def _flags(ctx : AnalysisContext) -> cmd_args:
  return cmd_args([("+" if value else "-") + name for name, value in ctx.attrs.flags.items()], format="--flags={}")


def _dependencies(ctx : AnalysisContext) -> list[str]:
  return ["--dependency={}={}".format(d[PackageInfo].pkg_name, d[PackageInfo].unit_id) for d in ctx.attrs.depends]


def _package_db(ctx : AnalysisContext, tset : PackageConfTSet) -> cmd_args:
  cache = ctx.actions.declare_output("package_db", "package.cache")
  ctx.actions.run(
    cmd_args(
      "ghc-pkg", "recache",
      cmd_args(cache.as_output(), format="--package-db={}", parent=1),
      hidden = [
        ctx.actions.symlink_file("package_db/{}.conf".format(package_conf.owner.name), package_conf)
        for package_conf in tset.traverse()
      ]
    ),
    category = "packagedb"
  )
  return cmd_args(
    "--package-db=clear",
    "--package-db=global",
    cmd_args(cache, format = "--package-db={}", parent=1)
  )


def _configure_args(ctx : AnalysisContext) -> cmd_args:
  haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

  configure_args = cmd_args()
  configure_args.add("--with-ghc", haskell_toolchain.compiler)

  configure_args.add(_flags(ctx))
  configure_args.add("--cid={}".format(ctx.attrs.unit_id))
  configure_args.add("--exact-configuration")
  configure_args.add("--ghc-option=-hide-all-packages")
  configure_args.add(_dependencies(ctx))
  configure_args.add(_component_name(ctx))

  return configure_args


def _configured_unit_impl(ctx : AnalysisContext) -> list[Provider]:
  setup_helper = ctx.attrs._setup_helper[RunInfo]

  tset_children = ctx.actions.tset(
    PackageConfTSet,
    children = [dep[PackageInfo].package_conf_tset for dep in ctx.attrs.depends]
  )

  config = ctx.actions.declare_output("builddir", "setup-config")
  configure_cmd = cmd_args(
    setup_helper, "configure",
    cmd_args(config.as_output(), format = "--builddir={}", parent=1),
    _package_db(ctx, tset_children),
    _configure_args(ctx),
  )
  ctx.actions.run(_in_dir(configure_cmd, work_dir=ctx.attrs.src), category = "configure")

  build = ctx.actions.declare_output("builddir", "build", dir = True)
  build_cmd = cmd_args(
    setup_helper, "build",
    cmd_args(build.as_output(), format = "--builddir={}", parent=1),
    _component_name(ctx),
    hidden = [config]
  )
  ctx.actions.run(_in_dir(build_cmd, work_dir=ctx.attrs.src), category = "build")

  package_conf = ctx.actions.declare_output("package.conf")
  register_cmd = cmd_args(
    setup_helper, "register",
    cmd_args(build, format = "--builddir={}", parent=1),
    "--inplace",
    cmd_args(package_conf.as_output(), format="--gen-pkg-config={}"),
    _component_name(ctx),
  )
  ctx.actions.run(_in_dir(register_cmd, work_dir=ctx.attrs.src), category = "register")

  package_conf_tset = ctx.actions.tset(PackageConfTSet, value = package_conf, children = [tset_children])

  return [
    DefaultInfo(
      default_output = build
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
    "flags": attrs.dict(attrs.string(), attrs.bool()),
    "src": attrs.source(),
    "component_name": attrs.string(),
    "exe_depends": attrs.list(attrs.dep(), default = []),
    "_setup_helper": attrs.default_only(attrs.dep(default = "//cabal_install:setup_helper.sh")),
    "_haskell_toolchain": toolchains_common.haskell(),
  } | basic_unit,
)


def _in_dir(*script, work_dir):
  return cmd_args("env", "-C", work_dir, cmd_args(*script).relative_to(work_dir))

