"""
Reading a build plan: the JSON cabal-solver-plan prints, format 1 (see the
docs/plan-format.md of cabal-solver-plan).

plan.bxl (to write a plan out as targets) and dynamic_plan (in a dynamic
action) read a plan with `decode_plan`, which checks the values the format draws from a
fixed set: a value that is not one of those below fails, rather than be
taken for one of them. A new build type or build style in cabal-install
reaches the plan interpreter as a new value here, or as a new format.
"""

FORMAT = 1

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

def decode_plan(where: str, text: str) -> dict[str, typing.Any]:
    """Decode a plan, and check what can only have values from a fixed set.

    Args:
      where: the target, for messages
      text: the plan, as cabal-solver-plan prints it
    Returns:
      the plan
    """
    plan = json.decode(text)
    if plan.get("format") != FORMAT:
        fail("{}: the plan is of format {}, not {}. Make it again with the `plan` rule (cabal-solver-plan).".format(where, plan.get("format"), FORMAT))
    for package in plan["packages"]:
        _check(where, "the build type of " + package["id"], package["build-type"], BUILD_TYPES)
        _check(where, "the source type of " + package["id"], package["src"]["type"], SOURCE_TYPES)
    for unit in plan["units"]:
        _check(where, "the type of unit " + unit["id"], unit["type"], UNIT_TYPES)
        if unit["type"] == "configured":
            _check(where, "the build style of " + unit["id"], unit["build-style"], BUILD_STYLES)
        if "component" in unit:
            _check(where, "the component kind of " + unit["id"], component(unit["component"])[0], COMPONENT_KINDS)
    return plan
