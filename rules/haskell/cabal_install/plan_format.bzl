"""
Reading a build plan: the JSON cabal-solver-plan prints, format 2 (see the
docs/plan-format.md of cabal-solver-plan).

A plan is a dependency graph. Its units are numbered by their position in
`units`, dependencies first, and those numbers only say which unit an edge
(`depends`, `exe-depends`, `setup-depends`, `targets`) points to: they can
change from one plan to the next, and never become part of a name, a
unit-id or a scope. A configured unit has no unit-id either; what a unit is
called is up to us (`unit_names`, and unit_id.bzl for its unit-id).

plan.bxl (to write a plan out as targets) and dynamic_plan (in a dynamic
action) read a plan with `decode_plan`, which checks the values the format draws from a
fixed set: a value that is not one of those below fails, rather than be
taken for one of them. A new build type or build style in cabal-install
reaches the plan interpreter as a new value here, or as a new format.
"""

FORMAT = 2

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

def unit_names(where: str, plan: dict[str, typing.Any]) -> list[str]:
    """What each unit of a plan is called, by its number.

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
      the names, in the order of `units`
    """
    names = []
    taken = {}
    for unit in plan["units"]:
        if unit["type"] == "pre-existing":
            name = unit["unit-id"]
        else:
            name = "{}-{}".format(unit["name"], unit["version"])
            if unit["build-style"] == "per-component":
                kind, cname = component(unit["component"])
                if cname:
                    name += "-{}-{}".format(kind, cname)
                elif kind != "lib":
                    fail("{}: unit {} is the component `{}`, which has no name".format(where, unit["id"], unit["component"]))
        if name in taken:
            fail("{}: two units would both be called `{}`: the one of {} and the one of {}".format(
                where,
                name,
                ", ".join(taken[name]["qualified-names"]),
                ", ".join(unit["qualified-names"]),
            ))
        taken[name] = unit
        names.append(name)
    return names

def _check_edges(where: str, what: str, limit: int, ids: list[typing.Any]):
    for i in ids:
        if type(i) != "int" or i < 0 or i >= limit:
            fail("{}: {} has `{}`, which is not the number of a unit before it".format(where, what, i))

def decode_plan(where: str, text: str) -> dict[str, typing.Any]:
    """Decode a plan, and check what can only have values from a fixed set,
    and that its units make a graph, dependencies first.

    Args:
      where: the target, for messages
      text: the plan, as cabal-solver-plan prints it
    Returns:
      the plan
    """
    plan = json.decode(text)
    if plan.get("format") != FORMAT:
        fail("{}: the plan is of format {}, not {}. Make it again with a cabal-solver-plan that prints format {}.".format(where, plan.get("format"), FORMAT, FORMAT))
    for package in plan["packages"]:
        _check(where, "the build type of " + package["id"], package["build-type"], BUILD_TYPES)
        _check(where, "the source type of " + package["id"], package["src"]["type"], SOURCE_TYPES)
    for position, unit in enumerate(plan["units"]):
        if unit["id"] != position:
            fail("{}: unit {} is in position {} of `units`; its id has to be its position".format(where, unit["id"], position))
        what = "unit {} ({}-{})".format(position, unit["name"], unit["version"])
        _check(where, "the type of " + what, unit["type"], UNIT_TYPES)
        _check_edges(where, "`depends` of " + what, position, unit["depends"])
        if unit["type"] == "configured":
            _check(where, "the build style of " + what, unit["build-style"], BUILD_STYLES)
            _check_edges(where, "`exe-depends` of " + what, position, unit["exe-depends"])
            _check_edges(where, "`setup-depends` of " + what, position, unit["setup-depends"])
        for c in [unit["component"]] if "component" in unit else unit.get("components", []):
            _check(where, "the component kind of " + what, component(c)[0], COMPONENT_KINDS)
    _check_edges(where, "`targets`", len(plan["units"]), plan["targets"])
    return plan
