

def project_as_package_conf(package_conf):
  return package_conf

PackageDb = transitive_set(
  args_projections = {
    "package_conf": project_as_package_conf,
  },
)

PackageInfo = provider(
  fields = {
    "unit_id": provider_field(str),
    "pkg_name": provider_field(str),
    "package_db": provider_field(PackageDb),
  }
)

basic_unit = {
  "unit_id": attrs.string(),
  "pkg_name": attrs.string(),
  "pkg_version": attrs.string(),
  "depends": attrs.list(attrs.dep(), default = []),
}
