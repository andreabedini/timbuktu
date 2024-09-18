load("@prelude//linking:link_info.bzl", "LinkStyle")
load("@prelude//haskell:util.bzl", "get_artifact_suffix")

CabalPackageInfo = provider(
  fields = {
    "pkg_name": provider_field(str),
    "pkg_version": provider_field(str),
    "pkg_id": provider_field(str),
    "srcdir": provider_field(Artifact),
    "cabalfile": provider_field(Artifact),
    "cabaljson": provider_field(Artifact),
  }
)

def project_as_package_conf(package_conf):
  return package_conf


PackageConfTSet = transitive_set(
  args_projections = {
    "package_conf": project_as_package_conf,
  },
)


PackageInfo = provider(
  fields = {
    "unit_id": provider_field(str),
    "pkg_name": provider_field(str),
    "package_conf": provider_field(Artifact | None, default = None),
    "package_conf_tset": provider_field(PackageConfTSet),
  }
)


common_unit_attrs = {
  "unit_id": attrs.string(),
  "pkg_name": attrs.string(),
  "pkg_version": attrs.string(),
  "depends": attrs.list(attrs.dep(), default = []),
}


def package_db(ctx : AnalysisContext, tset : PackageConfTSet) -> cmd_args:
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
  return cmd_args(cache, parent=1)


def output_args(ctx: AnalysisContext) -> cmd_args:
  link_style = LinkStyle("static")
  enable_profiling = False
  suffix = ""

  artifact_suffix = get_artifact_suffix(link_style, enable_profiling, suffix)
  objects = ctx.actions.declare_output("objects-" + artifact_suffix, dir = True)
  hi = ctx.actions.declare_output("hi-" + artifact_suffix, dir = True)
  stubs = ctx.actions.declare_output("stubs-" + artifact_suffix, dir = True)

  return cmd_args(
      "-odir",
      objects.as_output(),
      "-hidir",
      hi.as_output(),
      "-hiedir",
      hi.as_output(),
      "-stubdir",
      stubs.as_output(),
  )
