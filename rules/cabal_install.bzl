load("cabal_install/configured_unit.bzl", "configured_unit")
load("cabal_install/pkg_src.bzl", "unit_src")
load("cabal_install/pre_existing_unit.bzl", "pre_existing_unit")


_as_source = lambda dep: ":{}".format(dep)

def interpret_plan(planjson : str):
  plan = json.decode(planjson)

  for unit in plan["install-plan"]:
    if unit["type"] == "configured":
      pkg_name = unit['pkg-name']
      pkg_version = unit['pkg-version']
      pkg_id = "{}-{}".format(pkg_name, pkg_version)

      src_name = "src-{}".format(pkg_id)
      unit_src(
        name = src_name,
        pkg_name = unit['pkg-name'],
        pkg_version = unit['pkg-version'],
        pkg_src = unit["pkg-src"],
        pkg_src_sha256 = unit['pkg-src-sha256'],
      )

      configured_unit(
        name = unit['id'],
        unit_id = unit['id'],
        pkg_name = unit['pkg-name'],
        pkg_version = unit['pkg-version'],
        flags = unit['flags'],
        depends = map(_as_source, unit["depends"]),
        exe_depends = map(_as_source, unit["exe-depends"]),
        src = _as_source(src_name),
        component_name = unit['component-name'],
      )

    elif unit["type"] == "pre-existing":
      pre_existing_unit(
        name = unit['id'],
        unit_id = unit['id'],
        pkg_name = unit['pkg-name'],
        pkg_version = unit['pkg-version'],
        depends = map(_as_source, unit["depends"]),
      )

