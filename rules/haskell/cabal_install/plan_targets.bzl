"""
A build plan as targets, and as the text of a BUCK file.

The plan is the JSON that cabal-solver-plan prints (format 3, see the
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
  prelude;
- a local package (its sources in the repository, `"src": {"type":
  "local"}`): the cabal_simple targets generate.bzl makes of what
  describe_package prints for it, `<name>-<version>-package` and one
  target for each of its units, with their dependencies taken from the
  plan. What describe_package finds a component depends on has to be what
  the plan says, or making the targets fails. Only build-type Simple.

Units are named by `unit_names` (plan_format.bzl), and their unit-ids are
made up by the rules (unit_id.bzl): the ids the plan gives its units only
say where the edges go. The targets are in the order of their names, the
packages in the order of their ids, so the file does not depend on the ids
either.

The units the plan was made for (its `targets`) get an alias too: the name
of the package for the main library, `<package>-<name>` for a sublibrary,
`<package>-test-<name>` for a test suite, `<kind>-<name>` for another
component (e.g. `exe-shake`).

`buck_file` writes them out; plan.bxl is how it is run.

NOTE: every unit uses the toolchain (toolchains//:haskell), which has to be
the compiler the plan was made with (`compiler-id`).
"""

load("//rules/haskell:buck_text.bzl", "call", "expr", "load_order")
load("//rules/haskell/cabal:generate.bzl", "package_targets")
load(":plan_format.bzl", "component", "name_version", "unit_names")

# Where each rule the targets use is loaded from; `alias` is built in.
_LOADS = {
    "build": "@timbuktu//rules/haskell/cabal_install:build.bzl",
    "build_legacy": "@timbuktu//rules/haskell/cabal_install:build_legacy.bzl",
    "haskell_binary": "@timbuktu//rules/haskell:defs.bzl",
    "haskell_unit": "@timbuktu//rules/haskell:defs.bzl",
    "repo_package": "@timbuktu//rules/haskell/cabal_install:pkg_src.bzl",
    "cabal_package": "@timbuktu//rules/haskell/cabal:defs.bzl",
    "cabal_simple_executable": "@timbuktu//rules/haskell/cabal:defs.bzl",
    "cabal_simple_library": "@timbuktu//rules/haskell/cabal:defs.bzl",
    "cabal_simple_test": "@timbuktu//rules/haskell/cabal:defs.bzl",
}

def _src(package_id: str) -> str:
    return package_id + "-src"

def _alias_name(plan: dict[str, typing.Any], unit: dict[str, typing.Any]) -> str:
    kind, cname = component(unit["component"]) if "component" in unit else ("lib", None)
    if kind == "lib" and not cname:
        return name_version(plan, unit)[0]

    # Sublibraries and test suites are named after their package: packages
    # often share their names (`test-lib`, `server`, say), more than they
    # share those of executables.
    if kind == "lib":
        return "{}-{}".format(name_version(plan, unit)[0], cname)
    if kind == "test":
        return "{}-test-{}".format(name_version(plan, unit)[0], cname)
    return "{}-{}".format(kind, cname)

def _unit_targets(where: str, key: str, plan: dict[str, typing.Any], names: dict[str, str]) -> list[struct]:
    """The targets of a configured unit."""
    units = plan["units"]
    unit = units[key]

    def target(i):
        return ":" + names[i]

    for exe in unit["exe-depends"]:
        if units[exe]["build-style"] != "per-component":
            fail("{}: {} needs an executable of {}, which is built as a whole package; only its library is available".format(where, names[key], names[exe]))

    name = names[key]
    package = plan["packages"][unit["package"]]
    common = [
        ("pkg_name", package["name"]),
        ("pkg_version", package["version"]),
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

def _pre_existing(key: str, unit: dict[str, typing.Any], names: dict[str, str]) -> struct:
    db = unit.get("db", "global")
    return struct(rule = "haskell_unit", attrs = [
        ("name", names[key]),
        ("id", unit["unit-id"]),
        ("package_name", unit["name"]),
        ("version", unit["version"]),
        ("lib_name", component(unit["component"])[1]),
        ("db", None if db == "global" else db),
        ("deps", [":" + names[d] for d in unit["depends"]] or None),
        ("visibility", ["PUBLIC"]),
    ])

def _dep_key(plan: dict[str, typing.Any], unit: dict[str, typing.Any]) -> str:
    """How generate.bzl keys a library dependency: `<package>[:<library>]`."""
    if "component" not in unit:
        # A whole-package unit (built by its Setup.hs, see plan_format.bzl)
        # is a dependency on its main library: its target is that library.
        return name_version(plan, unit)[0]
    lib = component(unit["component"])[1]
    return name_version(plan, unit)[0] + (":" + lib if lib else "")

def _tool_key(plan: dict[str, typing.Any], unit: dict[str, typing.Any]) -> str:
    """How generate.bzl keys a build tool: `<package>:<executable>`."""
    return "{}:{}".format(name_version(plan, unit)[0], component(unit["component"])[1])

def _local_targets(where: str, pkg_id: str, local: struct, plan: dict[str, typing.Any], names: dict[str, str]) -> list[struct]:
    """The cabal_simple targets of a local package of a plan."""
    package = plan["packages"][pkg_id]
    if package["build-type"] != "Simple":
        fail("{}: the local package {} has build-type {}; only Simple ones are supported, as cabal_simple targets".format(where, pkg_id, package["build-type"]))
    desc = local.description
    if desc["name"] != package["name"] or desc["version"] != package["version"]:
        fail("{}: the description of {} is of {}-{}".format(where, pkg_id, desc["name"], desc["version"]))
    plan_flags = None
    units = plan["units"]
    own = [key for key, u in units.items() if u["type"] == "configured" and u["package"] == pkg_id]

    components = {(c["kind"], c["name"]): c for c in desc["components"]}
    targets = {}
    deps = {}
    tools = {}

    def set_target(table, key, i):
        target = ":" + names[i]
        if table.get(key, target) != target:
            fail("{}: the units of {} depend on two units for `{}`: {} and {}".format(where, pkg_id, key, table[key], target))
        table[key] = target

    for key in own:
        u = units[key]
        if plan_flags != None and u["flags"] != plan_flags:
            fail("{}: the units of {} have different flags".format(where, pkg_id))
        plan_flags = u["flags"]
        if "component" not in u:
            # The solver plans a package with nothing to build (test suites
            # only, say) as a whole: it gets its cabal_package and nothing
            # else, which other rules may use.
            built = [c for c in desc["components"] if c["kind"] in ("lib", "exe") and c["buildable"]]
            if built:
                fail("{}: the plan builds {} as a whole, which has components to build".format(where, pkg_id))
            continue
        kind, cname = component(u["component"])
        c = components.get((kind, cname))
        if not c or not c["buildable"]:
            fail("{}: the plan builds {} of {}, which describe_package does not find buildable with flags {}".format(where, u["component"], pkg_id, desc["flags"]))
        targets[(kind, cname)] = names[key]

        # What the plan says the component depends on, and what the .cabal
        # file says, are the same packages.
        planned = {}
        for d in u["depends"]:
            if units[d].get("package") != pkg_id:
                planned[_dep_key(plan, units[d])] = None
                set_target(deps, _dep_key(plan, units[d]), d)
        described = {}
        for dep in c.get("build-depends", []):
            if not dep["internal"]:
                for lib in dep["libraries"]:
                    described[dep["package"] if lib == "lib" else "{}:{}".format(dep["package"], lib)] = None
        planned_tools = {}
        for e in u["exe-depends"]:
            if units[e].get("package") != pkg_id:
                planned_tools[_tool_key(plan, units[e])] = None
                set_target(tools, _tool_key(plan, units[e]), e)
        described_tools = {"{}:{}".format(t["package"], t["executable"]): None for t in c.get("build-tool-depends", []) if not t["internal"]}
        for what, p, d in [("depends on", planned, described), ("uses as build tools", planned_tools, described_tools)]:
            if sorted(p.keys()) != sorted(d.keys()):
                fail("{}: the plan and the .cabal file of {} disagree on what {} {}: only in the plan: {}; only in the .cabal file: {}".format(
                    where,
                    pkg_id,
                    u["component"],
                    what,
                    ", ".join([k for k in p if k not in d]) or "nothing",
                    ", ".join([k for k in d if k not in p]) or "nothing",
                ))
    if plan_flags != None and plan_flags != desc["flags"]:
        fail("{}: {} was described with the flags {}, the plan has {}".format(where, pkg_id, desc["flags"], plan_flags))

    root = local.root
    prefix = root + "/" if root else ""
    # NOTE: the directories of `generated` stay in the glob: the components
    # leave them out (see `generated` in simple.bzl). Buck2 matches exclude
    # patterns regardless of case, and `compiler/thrift/**` would take
    # hsthrift's compiler/Thrift away too.
    exclude = ["BUCK", "dist-newstyle/**"]
    srcs = expr('glob(\n        ["{}**"],\n        exclude = [{}],\n    )'.format(prefix, ", ".join(['"{}{}"'.format(prefix, e) for e in exclude])))
    made = package_targets(
        desc,
        [],
        srcs,
        deps = deps,
        tools = tools,
        names = targets,
        package_target = pkg_id + "-package",
        root = root,
        pkgconfig = local.pkgconfig,
        generated = local.generated,
        extra_libraries = local.extra_libraries,
        package_label = local.package_target,
        public_package = True,
    )
    if made.units:
        fail("{}: {} needs units the plan does not have: {}".format(where, pkg_id, ", ".join(made.units)))
    made_names = [t.attrs[0][1] for t in made.targets]
    for key, name in targets.items():
        if name not in made_names:
            fail("{}: the plan builds {} {} of {}, which has no cabal_simple rule".format(where, key[0], key[1] or "", pkg_id))
    return made.targets

def plan_targets(where: str, plan: dict[str, typing.Any], local: dict[str, struct] = {}) -> list[struct]:
    """The targets of a plan, as data, in sections.

    Args:
      where: what the plan is, for messages
      plan: the plan, as decode_plan returns it
      local: for each local package of the plan, by its id, struct(description,
        root, pkgconfig, generated, extra_libraries, package_target): what
        describe_package printed for it,
        with the flags of the plan; its directory relative to the BUCK file
        (None for the directory of the BUCK file); the targets of the C
        libraries of pkgconfig-depends, by name; the targets of the libraries
        of extra-libraries, by name (see package_targets); and the targets of the
        directories made by other rules, by their path in the package (see
        `generated` in package_targets); and its cabal_package target, when
        it is another cell's (None otherwise: it gets one here)
    Returns:
      a list of struct(comment, targets): the aliases of the plan's targets,
      then a section for each package with its sources and its units, then
      the units that are already built; each target is struct(rule, attrs),
      with the attributes in order
    """
    units = plan["units"]
    names = unit_names(where, plan)

    aliases = {}
    for i in sorted(plan["targets"], key = lambda i: names[i]):
        # A local package with nothing to build has no target (see
        # _local_targets).
        if "component" not in units[i] and plan["packages"][units[i]["package"]]["src"]["type"] == "local":
            continue
        alias_name = _alias_name(plan, units[i])
        if alias_name in aliases:
            fail("{}: the targets {} and {} would both be called `{}`".format(where, names[aliases[alias_name]], names[i], alias_name))
        aliases[alias_name] = i

    sections = [struct(
        comment = "What the plan was made for",
        targets = [
            struct(rule = "alias", attrs = [("name", alias_name), ("actual", ":" + names[i]), ("visibility", ["PUBLIC"])])
            for alias_name, i in sorted(aliases.items())
        ],
    )]

    for pkg_id, package in sorted(plan["packages"].items()):
        if package["src"]["type"] == "local":
            if pkg_id not in local:
                fail("{}: {} is a local package of the plan (at {}) with no description".format(where, pkg_id, package["src"]["path"]))
            sections.append(struct(comment = pkg_id + ", in " + package["src"]["path"], targets = _local_targets(where, pkg_id, local[pkg_id], plan, names)))
            continue
        targets = [struct(rule = "repo_package", attrs = [("name", _src(pkg_id)), ("package", package)])]
        for key in sorted(units.keys(), key = lambda k: names[k]):
            if units[key]["type"] == "configured" and units[key]["package"] == pkg_id:
                targets.extend(_unit_targets(where, key, plan, names))
        sections.append(struct(comment = pkg_id, targets = targets))

    sections.append(struct(
        comment = "What is already built: units of the compiler or of another package db",
        targets = [_pre_existing(key, units[key], names) for key in sorted(units.keys(), key = lambda k: names[k]) if units[key]["type"] == "pre-existing"],
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

def buck_file(plan: dict[str, typing.Any], command: str, where: str = "the plan", local: dict[str, struct] = {}) -> str:
    """The text of a BUCK file with the targets of a plan.

    Args:
      plan: the plan, as decode_plan returns it
      command: how to make the file again, for its header
      where: what the plan is, for messages
      local: see plan_targets
    Returns:
      the text, as buildifier formats it
    """
    sections = plan_targets(where, plan, local)
    rules = {t.rule: None for s in sections for t in s.targets if t.rule in _LOADS}
    loads = {}
    for rule in sorted(rules.keys()):
        loads.setdefault(_LOADS[rule], []).append(rule)

    lines = [
        "# Generated by timbuktu//rules/haskell/cabal_install/plan.bxl from a plan that",
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
