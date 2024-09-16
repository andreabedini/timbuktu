
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


basic_unit = {
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


def ghc_package_db(ctx : AnalysisContext, tset : PackageConfTSet) -> cmd_args:
  return cmd_args(
    "-hide-all-packages",
    "-clear-package-db",
    "-global-package-db",
    cmd_args(package_db(ctx, tset), format = "-package-db {}")
  )

def cabal_package_db(ctx : AnalysisContext, tset : PackageConfTSet) -> cmd_args:
  return cmd_args(
    "--exact-configuration",
    "--package-db=clear",
    "--package-db=global",
    cmd_args(package_db(ctx, tset), format = "--package-db={}")
  )

