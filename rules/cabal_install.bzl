load("cabal_install/configured_unit.bzl", "configured_unit")
load("cabal_install/pkg_src.bzl", "unit_src")
load("cabal_install/pre_existing_unit.bzl", "pre_existing_unit")
load("cabal_install/utils.bzl", "normalise_legacy_unit")


_as_source = lambda dep: ":{}".format(dep)


def interpret_plan(planjson : str):
  plan = json.decode(planjson)
  units = map(normalise_legacy_unit, plan["install-plan"])

  srcs = {}

  for unit in units:
    pprint(unit)
    if unit["type"] == "configured" and unit["style"] == "global":
      pkg_name = unit['pkg-name']
      pkg_version = unit['pkg-version']
      pkg_id = "{}-{}".format(pkg_name, pkg_version)

      if pkg_id not in srcs:
        srcs[pkg_id] = \
          unit_src(
            name = pkg_id,
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
        src = _as_source(pkg_id),
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


def _cabal_project_impl(ctx: AnalysisContext) -> list[Provider]:
  builddir = ctx.actions.declare_output("dist-newstyle", dir = True)
  ctx.actions.run(
    [
      "cabal", "build", "--dry-run",
      "--project-file", ctx.attrs.project_file,
      "--builddir", builddir.as_output(),
      ctx.attrs.targets,
    ],
    category = "cabal_install"
  )
  return [
    DefaultInfo(default_output = builddir.project("cache/plan.json"))
  ]


cabal_project = rule(
  impl = _cabal_project_impl,
  attrs = {
    "project_file": attrs.source(),
    "targets": attrs.list(attrs.string(), default = ["all"]),
  },
)
