load("@toolchains//haskell.bzl", "haskell_toolchain")
load("cabal_install/configured_unit.bzl", "configured_unit")
load("cabal_install/setup.bzl", "setup")
load("cabal_install/pkg_src.bzl", "unit_src")
load("cabal_install/pre_existing_unit.bzl", "pre_existing_unit")
load("cabal_install/utils.bzl", "normalise_legacy_unit")


_as_source = lambda dep: ":{}".format(dep)


def interpret_plan(planjson : str):
  plan = json.decode(planjson)
  units = map(normalise_legacy_unit, plan["install-plan"])

  srcs = {}

  haskell_toolchain(
    name = "haskell_toolchain",
    compiler = plan["compiler-id"],
    linker = plan["compiler-id"],
    packager = plan["compiler-id"].replace("ghc", "ghc-pkg"),
  )

  for unit in units:
    if unit["type"] == "configured" and unit["style"] == "global":
      pkg_name = unit['pkg-name']
      pkg_version = unit['pkg-version']
      pkg_id = "{}-{}".format(pkg_name, pkg_version)

      normalise_legacy_unit(unit)
      
      if pkg_id not in srcs:
        srcs[pkg_id] = \
          unit_src(
            name = pkg_id,
            pkg_name = unit['pkg-name'],
            pkg_version = unit['pkg-version'],
            pkg_src = unit["pkg-src"],
            pkg_src_sha256 = unit['pkg-src-sha256'],
            pkg_cabal_sha256 = unit.get('pkg-cabal-sha256'),
          )

        setup(
          name = pkg_id + "-setup",
          src = _as_source(pkg_id),
          depends = map(_as_source, unit.get("setup-depends", [])),
          _haskell_toolchain = ":haskell_toolchain",
        )

      configured_unit(
        name = unit['id'],
        unit_id = unit['id'],
        pkg_name = unit['pkg-name'],
        pkg_version = unit['pkg-version'],
        flags = unit['flags'],
        depends = map(_as_source, unit.get("depends", [])),
        exe_depends = map(_as_source, unit.get("exe-depends", [])),
        src = _as_source(pkg_id),
        component_name = unit['component-name'],
        setup = _as_source(pkg_id + "-setup"),
        _haskell_toolchain = ":haskell_toolchain",
      )

    elif unit["type"] == "pre-existing":
      pre_existing_unit(
        name = unit['id'],
        unit_id = unit['id'],
        pkg_name = unit['pkg-name'],
        pkg_version = unit['pkg-version'],
        depends = map(_as_source, unit["depends"]),
        _haskell_toolchain = ":haskell_toolchain",
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
