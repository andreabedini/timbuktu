"""
A build plan as targets.

    interpret_plan("shake", <the output of a plan target, as a string>)

The plan is the JSON that cabal-solver-plan prints (format 1, see the
docs/plan-format.md of cabal-solver-plan). For each entry it makes:

- a package: the target `<name>-<version>`, its sources;
- a unit that comes with the compiler (or another package db): a
  haskell_unit named after its unit-id;
- a unit built one component at a time (build-type Simple): a `build`
  target named after its unit-id;
- a unit built as a whole package (any other build type): a `build_legacy`
  target named after its unit-id, and `<name>-<version>-setup`, its
  Setup.hs compiled by the prelude.

The units the plan was made for (its `targets`) get an alias too: the name
of the package for the main library, `<kind>-<name>` for another component
(e.g. `exe-shake`).

NOTE: every unit uses the toolchain (toolchains//:haskell), which has to be
the compiler the plan was made with (`compiler-id`).
"""

load("//rules/haskell:defs.bzl", "haskell_binary", "haskell_unit")
load("build.bzl", "build")
load("build_legacy.bzl", "build_legacy")
load("pkg_src.bzl", "pkg_src")
load("plan_format.bzl", "component", "decode_plan")

def _target(unit_id: str) -> str:
    return ":" + unit_id

def _alias_name(unit: dict[str, typing.Any]) -> str:
    kind, cname = component(unit["component"]) if "component" in unit else ("lib", None)
    if kind == "lib" and not cname:
        return unit["name"]
    return "{}-{}".format(kind, cname)

def interpret_plan(name: str, planjson: str):
    """Make the targets of a build plan.

    Args:
      name: a name for the plan, for error messages
      planjson: the plan, as cabal-solver-plan prints it
    """
    plan = decode_plan(name, planjson)

    units = {unit["id"]: unit for unit in plan["units"]}

    for package in plan["packages"]:
        pkg_src(name = package["id"], package = package)

    for unit in plan["units"]:
        if unit["type"] == "pre-existing":
            haskell_unit(
                name = unit["id"],
                id = unit["id"],
                package_name = unit["name"],
                version = unit["version"],
                lib_name = component(unit["component"])[1],
                db = unit.get("db", "global"),
                deps = map(_target, unit["depends"]),
                visibility = ["PUBLIC"],
            )
            continue

        for exe in unit["exe-depends"]:
            if units[exe]["build-style"] != "per-component":
                fail("{}: {} needs an executable of {}, which is built as a whole package; only its library is available".format(name, unit["id"], exe))

        common = dict(
            name = unit["id"],
            unit_id = unit["id"],
            pkg_name = unit["name"],
            pkg_version = unit["version"],
            src = _target(unit["package"]),
            flags = unit["flags"],
            deps = map(_target, unit["depends"]),
            exec_deps = map(_target, unit["exe-depends"]),
            visibility = ["PUBLIC"],
        )

        if unit["build-style"] == "per-component":
            build(component_name = unit["component"], **common)
        elif unit["build-style"] == "whole-package":
            # The package's own Setup.hs, with what it depends on, or Cabal
            # and base when the plan does not say.
            setup = unit["package"] + "-setup"
            setup_depends = unit["setup-depends"]
            haskell_binary(
                name = setup,
                srcs = {"Main.hs": ":{}[Setup.hs]".format(unit["package"])},
                toolchain_libs = [units[d]["name"] for d in setup_depends if units[d]["type"] == "pre-existing"] if setup_depends else ["base", "Cabal"],
                deps = [_target(d) for d in setup_depends if units[d]["type"] != "pre-existing"],
            )
            build_legacy(setup = _target(setup), **common)

    aliases = {}
    for unit_id in plan["targets"]:
        alias_name = _alias_name(units[unit_id])
        if alias_name in aliases:
            fail("{}: the targets {} and {} would both be called `{}`".format(name, aliases[alias_name], unit_id, alias_name))
        aliases[alias_name] = unit_id
        native.alias(name = alias_name, actual = _target(unit_id), visibility = ["PUBLIC"])
