"""
A build plan as targets, and as the text of a BUCK file.

The plan is the JSON that cabal-solver-plan prints (format 2, see the
docs/plan-format.md of cabal-solver-plan), decoded by `decode_plan`.
`plan_targets` makes, for each entry:

- a package: the target `<name>-<version>-src`, its sources
  (`repo_package`);
- a unit that comes with the compiler (or another package db): a
  haskell_unit named after its unit-id;
- a unit built one component at a time (build-type Simple): a `build`
  target;
- a unit built as a whole package (any other build type): a `build_legacy`
  target, and `<name>-<version>-setup`, its Setup.hs compiled by the
  prelude.

Units are named by `unit_names` (plan_format.bzl), and their unit-ids are
made up by the rules (unit_id.bzl): the numbers the plan gives its units
only say where the edges go.

The units the plan was made for (its `targets`) get an alias too: the name
of the package for the main library, `<kind>-<name>` for another component
(e.g. `exe-shake`).

`buck_file` writes them out; plan.bxl is how it is run.

NOTE: every unit uses the toolchain (toolchains//:haskell), which has to be
the compiler the plan was made with (`compiler-id`).
"""

load("//rules/haskell:buck_text.bzl", "call", "load_order")
load(":plan_format.bzl", "component", "unit_names")

# Where each rule the targets use is loaded from; `alias` is built in.
_LOADS = {
    "build": "@root//rules/haskell/cabal_install:build.bzl",
    "build_legacy": "@root//rules/haskell/cabal_install:build_legacy.bzl",
    "haskell_binary": "@root//rules/haskell:defs.bzl",
    "haskell_unit": "@root//rules/haskell:defs.bzl",
    "repo_package": "@root//rules/haskell/cabal_install:pkg_src.bzl",
}

def _src(package_id: str) -> str:
    return package_id + "-src"

def _alias_name(unit: dict[str, typing.Any]) -> str:
    kind, cname = component(unit["component"]) if "component" in unit else ("lib", None)
    if kind == "lib" and not cname:
        return unit["name"]
    return "{}-{}".format(kind, cname)

def _unit_targets(where: str, unit: dict[str, typing.Any], plan: dict[str, typing.Any], names: list[str]) -> list[struct]:
    """The targets of a configured unit."""
    units = plan["units"]

    def target(i):
        return ":" + names[i]

    for exe in unit["exe-depends"]:
        if units[exe]["build-style"] != "per-component":
            fail("{}: {} needs an executable of {}, which is built as a whole package; only its library is available".format(where, names[unit["id"]], names[exe]))

    name = names[unit["id"]]
    common = [
        ("pkg_name", unit["name"]),
        ("pkg_version", unit["version"]),
    ]
    rest = [
        ("src", ":" + _src(unit["package"])),
        ("flags", unit["flags"]),
        ("deps", [target(d) for d in unit["depends"]] or None),
        ("exec_deps", [target(d) for d in unit["exe-depends"]] or None),
        ("visibility", ["PUBLIC"]),
    ]

    if unit["build-style"] == "per-component":
        return [struct(rule = "build", attrs = [("name", name)] + common + [("component_name", unit["component"])] + rest)]

    # A whole package: its own Setup.hs, with what it depends on, or Cabal
    # and base when the plan does not say.
    setup = unit["package"] + "-setup"
    setup_depends = unit["setup-depends"]
    return [
        struct(rule = "haskell_binary", attrs = [
            ("name", setup),
            ("srcs", {"Main.hs": ":{}[Setup.hs]".format(_src(unit["package"]))}),
            ("toolchain_libs", [units[d]["name"] for d in setup_depends if units[d]["type"] == "pre-existing"] if setup_depends else ["base", "Cabal"]),
            ("deps", [target(d) for d in setup_depends if units[d]["type"] != "pre-existing"] or None),
        ]),
        struct(rule = "build_legacy", attrs = [("name", name)] + common + [("setup", ":" + setup)] + rest),
    ]

def _pre_existing(unit: dict[str, typing.Any], names: list[str]) -> struct:
    db = unit.get("db", "global")
    return struct(rule = "haskell_unit", attrs = [
        ("name", names[unit["id"]]),
        ("id", unit["unit-id"]),
        ("package_name", unit["name"]),
        ("version", unit["version"]),
        ("lib_name", component(unit["component"])[1]),
        ("db", None if db == "global" else db),
        ("deps", [":" + names[d] for d in unit["depends"]] or None),
        ("visibility", ["PUBLIC"]),
    ])

def plan_targets(where: str, plan: dict[str, typing.Any]) -> list[struct]:
    """The targets of a plan, as data, in sections.

    Args:
      where: what the plan is, for messages
      plan: the plan, as decode_plan returns it
    Returns:
      a list of struct(comment, targets): the aliases of the plan's targets,
      then a section for each package with its sources and its units, then
      the units that are already built; each target is struct(rule, attrs),
      with the attributes in order
    """
    units = plan["units"]
    names = unit_names(where, plan)

    aliases = {}
    for i in plan["targets"]:
        alias_name = _alias_name(units[i])
        if alias_name in aliases:
            fail("{}: the targets {} and {} would both be called `{}`".format(where, names[aliases[alias_name]], names[i], alias_name))
        aliases[alias_name] = i

    sections = [struct(
        comment = "What the plan was made for",
        targets = [
            struct(rule = "alias", attrs = [("name", alias_name), ("actual", ":" + names[i]), ("visibility", ["PUBLIC"])])
            for alias_name, i in aliases.items()
        ],
    )]

    for package in plan["packages"]:
        targets = [struct(rule = "repo_package", attrs = [("name", _src(package["id"])), ("package", package)])]
        for unit in units:
            if unit["type"] == "configured" and unit["package"] == package["id"]:
                targets.extend(_unit_targets(where, unit, plan, names))
        sections.append(struct(comment = package["id"], targets = targets))

    sections.append(struct(
        comment = "What is already built: units of the compiler or of another package db",
        targets = [_pre_existing(unit, names) for unit in units if unit["type"] == "pre-existing"],
    ))

    # Every name is taken once; unit_names has checked the units' names
    # among themselves.
    taken = {}
    for section in sections:
        for t in section.targets:
            name = t.attrs[0][1]
            if name in taken:
                fail("{}: two targets would both be called `{}`: a {} and a {}".format(where, name, taken[name], t.rule))
            taken[name] = t.rule
    return sections

def buck_file(plan: dict[str, typing.Any], command: str, where: str = "the plan") -> str:
    """The text of a BUCK file with the targets of a plan.

    Args:
      plan: the plan, as decode_plan returns it
      command: how to make the file again, for its header
      where: what the plan is, for messages
    Returns:
      the text, as buildifier formats it
    """
    sections = plan_targets(where, plan)
    rules = {t.rule: None for s in sections for t in s.targets if t.rule in _LOADS}
    loads = {}
    for rule in sorted(rules.keys()):
        loads.setdefault(_LOADS[rule], []).append(rule)

    lines = [
        "# Generated by root//rules/haskell/cabal_install/plan.bxl from a plan that",
        "# cabal-solver-plan made for {} on {}-{}, with the index".format(plan["compiler-id"], plan["arch"], plan["os"]),
        "# of {}. Make it again with".format(
            ", ".join(["{} as of {}".format(repo, state) for repo, state in plan["index-state"].items()]) or "no repository",
        ),
        "#",
        "#   " + command,
        "",
    ]
    for module in load_order(loads.keys()):
        lines.append("load({}, {})".format(repr(module), ", ".join([repr(r) for r in loads[module]])))
    out = "\n".join(lines) + "\n"
    for section in sections:
        if section.targets:
            out += "\n# {}\n\n".format(section.comment) + "\n".join([call(t.rule, t.attrs) for t in section.targets])
    return out
