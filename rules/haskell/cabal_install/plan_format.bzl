"""
Reading a build plan: the JSON cabal-solver-plan prints, format 3 (see the
docs/plan-format.md of cabal-solver-plan).

A plan is a dependency graph. Its units are keyed by ids (strings), which
only say which unit an edge (`depends`, `exe-depends`, `setup-depends`,
`targets`) points to: they can change from one plan to the next, and never
become part of a name, a unit-id or a scope. Neither the ids nor the order
of `units` say anything about dependencies: `dependencies_first` follows
the edges. A configured unit has no unit-id, nor a name or a version: those
are its package's (`name_version`), and what a unit is called is up to us
(`unit_names`, and unit_id.bzl for its unit-id).

plan.bxl (to write a plan out as targets) and dynamic_plan (in a dynamic
action) read a plan with `decode_plan`, which checks the values the format draws from a
fixed set: a value that is not one of those below fails, rather than be
taken for one of them. A new build type or build style in cabal-install
reaches the plan interpreter as a new value here, or as a new format.
"""

FORMAT = 3

# The kinds of unit.
UNIT_TYPES = ["pre-existing", "configured"]

# How a configured unit is built: one component, or the whole package with
# its Setup.hs.
BUILD_STYLES = ["per-component", "whole-package"]

# The kinds of component, as in `lib:<name>` (cabal-install's
# ComponentName).
COMPONENT_KINDS = ["lib", "flib", "exe", "test", "bench"]

# The build types of Cabal 3.14. A unit's build style says how it is built;
# the build type of its package is only checked.
BUILD_TYPES = ["Simple", "Configure", "Custom", "Hooks"]

# Where the sources of a package are.
SOURCE_TYPES = ["repo-tar", "local"]

def component(name: str) -> (str, str | None):
    """The kind and the name of a component, e.g. `exe:foo` is (exe, foo).

    The main library, `lib`, has no name.
    """
    kind, _, cname = name.partition(":")
    return kind, cname or None

def _check(where: str, what: str, value: typing.Any, known: list[str]):
    if value not in known:
        fail("{}: the plan has {} `{}`, which is not one of {}. Is it newer than this plan interpreter?".format(
            where,
            what,
            value,
            ", ".join(known),
        ))

def name_version(plan: dict[str, typing.Any], unit: dict[str, typing.Any]) -> (str, str):
    """The name and the version of the package of a unit.

    A pre-existing unit gives them itself; a configured one has them from its
    entry in `packages`.
    """
    if unit["type"] == "pre-existing":
        return unit["name"], unit["version"]
    package = plan["packages"][unit["package"]]
    return package["name"], package["version"]

def unit_names(where: str, plan: dict[str, typing.Any]) -> dict[str, str]:
    """What each unit of a plan is called, by its id.

    A unit that comes with the compiler (or another package db) is called
    by its unit-id, which the package db fixes. A configured unit is
    `<name>-<version>`, then `-<kind>-<component>` unless it is the main
    library or a whole package. The solver gives a package version one
    configuration in a plan (its single instance restriction: a qualified
    name that picks a version another one picked links to it), so this
    tells configured units apart; two versions of a package can be in one
    plan. A clash fails, naming the qualified names of both units.

    Args:
      where: what the plan is, for messages
      plan: the plan, as decode_plan returns it
    Returns:
      the names, by the ids of the units
    """
    names = {}
    taken = {}
    for key, unit in plan["units"].items():
        if unit["type"] == "pre-existing":
            name = unit["unit-id"]
        else:
            name = "{}-{}".format(*name_version(plan, unit))
            if unit["build-style"] == "per-component":
                kind, cname = component(unit["component"])
                if cname:
                    name += "-{}-{}".format(kind, cname)
                elif kind != "lib":
                    fail("{}: unit {} is the component `{}`, which has no name".format(where, key, unit["component"]))
        if name in taken:
            fail("{}: two units would both be called `{}`: the one of {} and the one of {}".format(
                where,
                name,
                ", ".join(taken[name]["qualified-names"]),
                ", ".join(unit["qualified-names"]),
            ))
        taken[name] = unit
        names[key] = name
    return names

def _edges(unit: dict[str, typing.Any]) -> list[typing.Any]:
    """Every unit a unit needs built first."""
    return unit["depends"] + unit.get("exe-depends", []) + unit.get("setup-depends", [])

def dependencies_first(where: str, plan: dict[str, typing.Any]) -> list[str]:
    """The ids of the units of a plan, each after every unit it needs.

    The format does not promise an order, and json.decode gives the keys of
    an object sorted, as strings ("10" before "9"), whatever the order
    cabal-solver-plan printed them in. A cycle fails, naming the units on it
    or waiting for it.

    Args:
      where: what the plan is, for messages
      plan: the plan, with edges to units of the plan (decode_plan checks)
    Returns:
      the ids
    """
    units = plan["units"]
    done = {}
    order = []
    left = list(units.keys())

    # NOTE: Starlark has no while loop. A pass takes every unit whose edges
    # are all done, so each pass but the last takes one unit at least.
    for _ in range(len(units) + 1):
        if not left:
            break
        waiting = []
        for key in left:
            if all([d in done for d in _edges(units[key])]):
                done[key] = True
                order.append(key)
            else:
                waiting.append(key)
        if len(waiting) == len(left):
            fail("{}: the units {} depend on each other, or on units that do".format(
                where,
                ", ".join(["{} ({}-{})".format(k, *name_version(plan, units[k])) for k in waiting]),
            ))
        left = waiting
    return order

def _check_edges(where: str, what: str, units: dict[str, typing.Any], ids: list[typing.Any]):
    for i in ids:
        if type(i) != "string" or i not in units:
            fail("{}: {} has `{}`, which is not the id of a unit of the plan".format(where, what, i))

def decode_plan(where: str, text: str) -> dict[str, typing.Any]:
    """Decode a plan, and check what can only have values from a fixed set,
    and that its units make a graph with no cycles.

    Args:
      where: the target, for messages
      text: the plan, as cabal-solver-plan prints it
    Returns:
      the plan
    """
    plan = json.decode(text)
    if plan.get("format") != FORMAT:
        fail("{}: the plan is of format {}, not {}. Make it again with a cabal-solver-plan that prints format {}.".format(where, plan.get("format"), FORMAT, FORMAT))
    packages = plan["packages"]
    for pkg_id, package in packages.items():
        if pkg_id != "{}-{}".format(package["name"], package["version"]):
            fail("{}: the package {} is {} {}; its key has to be `<name>-<version>`".format(where, pkg_id, package["name"], package["version"]))
        _check(where, "the build type of " + pkg_id, package["build-type"], BUILD_TYPES)
        _check(where, "the source type of " + pkg_id, package["src"]["type"], SOURCE_TYPES)
    units = plan["units"]
    for key, unit in units.items():
        _check(where, "the type of unit " + key, unit["type"], UNIT_TYPES)
        if unit["type"] == "configured" and unit["package"] not in packages:
            fail("{}: unit {} is of the package {}, which is not one of the plan's".format(where, key, unit["package"]))
        what = "unit {} ({}-{})".format(key, *name_version(plan, unit))
        _check_edges(where, "`depends` of " + what, units, unit["depends"])
        if unit["type"] == "configured":
            _check(where, "the build style of " + what, unit["build-style"], BUILD_STYLES)
            _check_edges(where, "`exe-depends` of " + what, units, unit["exe-depends"])
            _check_edges(where, "`setup-depends` of " + what, units, unit["setup-depends"])
        for c in [unit["component"]] if "component" in unit else unit.get("components", []):
            _check(where, "the component kind of " + what, component(c)[0], COMPONENT_KINDS)
    _check_edges(where, "`targets`", units, plan["targets"])
    dependencies_first(where, plan)
    return plan
