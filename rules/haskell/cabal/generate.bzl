"""
Turn the description of a package into cabal_simple targets.

The description is what timbuktu//rules/haskell/helpers:describe_package prints:
the fields of a package and of its components, keyed as in a .cabal file,
with the conditionals resolved for one compiler, platform and set of flags.
`buck_file` makes the text of a BUCK file out of it; generate.bxl is how it is
run.

The targets are named the way the transcriptions in examples/cabal_simple
are: the package after itself, the main library `lib`, a sublibrary after
itself, the executable `exe` (after itself when there is more than one), a
test suite after itself. Dependencies become targets as follows:

- on a library or an executable of the package itself: its target;
- on a package that comes with the compiler: a haskell_unit in the same
  BUCK file, or, with `compiler_prefix`, the label `<prefix><package>`;
- on anything else: what `deps` (keyed `<package>` or `<package>:<library>`)
  or `tools` (keyed `<package>:<executable>`) say. Without it, generating
  fails and says which.

The C libraries of pkgconfig-depends become the targets `pkgconfig` says,
by pkg-config name, in `cxx_deps`; the field itself is copied as it is.

Every field describe_package prints is copied to the attribute fields.bzl
says it is, refused fields included: the rules refuse them, not the
generator. A field that is not in fields.bzl fails generating.
"""

load("//rules/haskell:buck_text.bzl", "call", "expr")
load(
    ":fields.bzl",
    "BUILD_INFO_FIELDS",
    "EXECUTABLE_FIELDS",
    "LIBRARY_FIELDS",
    "PACKAGE_FIELDS",
    "TEST_SUITE_FIELDS",
    "attr_name",
)

# The format of what describe_package prints that this file reads.
_DESCRIPTION_FORMAT = 1

# What describe_package prints besides the fields of the package.
_DESCRIPTION_KEYS = ["format", "cabal-library", "ghc-version", "platform", "flags", "name", "version", "components"]

# The kinds of component, with the rule of each and the fields it has besides
# those of every component. Benchmarks and foreign libraries have no rule.
#
# @unsorted-dict-items
_KINDS = {
    "lib": struct(rule = "cabal_simple_library", fields = LIBRARY_FIELDS),
    "exe": struct(rule = "cabal_simple_executable", fields = EXECUTABLE_FIELDS),
    "test": struct(rule = "cabal_simple_test", fields = TEST_SUITE_FIELDS),
    "bench": None,
    "flib": None,
}

# The fields of each rule.
RULE_FIELDS = {
    "cabal_package": PACKAGE_FIELDS,
} | {
    kind.rule: kind.fields | BUILD_INFO_FIELDS
    for kind in _KINDS.values()
    if kind
}

# Fields of a component that become something other than an attribute of the
# same name.
_SPECIAL = ["buildable", "build-depends", "build-tool-depends"]

def _check_keys(what: str, keys: list[str], known: list[str]):
    unknown = [k for k in keys if k not in known]
    if unknown:
        fail("{}: describe_package printed {}, which generate.bzl does not know. Say what the rules make of it in rules/haskell/cabal/fields.bzl.".format(
            what,
            ", ".join(["`{}`".format(k) for k in unknown]),
        ))

def _target_names(components: list[dict[str, typing.Any]]) -> dict[(str, str | None), str]:
    exes = [c for c in components if c["kind"] == "exe"]
    names = {}
    for c in components:
        kind, name = c["kind"], c["name"]
        if kind == "lib":
            names[(kind, name)] = name or "lib"
        elif kind == "exe":
            names[(kind, name)] = "exe" if len(exes) == 1 else name
        else:
            names[(kind, name)] = name
    return names

def package_targets(
        desc: dict[str, typing.Any],
        compiler_packages: list[str],
        srcs: typing.Any,
        deps: dict[str, str] = {},
        tools: dict[str, str] = {},
        compiler_prefix: str | None = None,
        tests: bool = True,
        names: dict[(str, str | None), str] | None = None,
        pkgconfig: dict[str, str] = {},
        package_target: str | None = None,
        root: str | None = None,
        generated: dict[str, str] = {}) -> struct:
    """The cabal_simple targets for a package, as data.

    Args:
      desc: what describe_package printed, decoded
      compiler_packages: the names of the packages of the compiler's global
        package db
      srcs: the `srcs` of cabal_package, as a value or an expression
        (struct(expr = ...))
      deps: the target of each dependency on another package, by
        `<package>` or `<package>:<library>`
      tools: the target of each build tool of another package, by
        `<package>:<executable>`
      compiler_prefix: the label of the packages of the compiler but for
        their name; None to declare haskell_unit targets in the BUCK file
      tests: whether to make targets for the test suites
      names: the target of each component, by (kind, name), the name None
        for the main library; only these components get targets. None for
        the names of the transcriptions (see the top of this file). The
        plan generator gives the names of the units of its plan.
      package_target: the name of the cabal_package target, when it is not
        the name of the package
      root: the directory of the package, relative to the BUCK file, when
        `srcs` lists files from above it (see cabal_package)
      pkgconfig: the target of each C library of pkgconfig-depends, by its
        pkg-config name
      generated: the target of each directory of the package made by
        another rule, by its path in the package: every component gets them
        (see `generated` in simple.bzl)
    Returns:
      struct(targets, units, skipped): the targets, as struct(rule, attrs)
      with the attributes in order, the cabal_package first; the packages of
      the compiler to declare haskell_unit targets for; the components left
      out
    """
    if desc.get("format") != _DESCRIPTION_FORMAT:
        fail("describe_package printed format {}, generate.bzl reads format {}".format(desc.get("format"), _DESCRIPTION_FORMAT))
    name = desc["name"]
    _check_keys(name, desc.keys(), _DESCRIPTION_KEYS + PACKAGE_FIELDS.keys())
    for c in desc["components"]:
        if c["kind"] not in _KINDS:
            fail("{}: describe_package printed a component of kind `{}`, which generate.bzl does not know".format(name, c["kind"]))
        if _KINDS[c["kind"]]:
            _check_keys(
                "{}: {} {}".format(name, c["kind"], c["name"] or ""),
                c.keys(),
                ["kind", "name"] + _KINDS[c["kind"]].fields.keys() + BUILD_INFO_FIELDS.keys(),
            )
    components = [
        c
        for c in desc["components"]
        if _KINDS[c["kind"]] and c["buildable"] and (tests or c["kind"] != "test") and (names == None or (c["kind"], c["name"]) in names)
    ]
    skipped = [c for c in desc["components"] if c not in components]
    names = _target_names(components) if names == None else names
    package_target = package_target or name

    taken = {package_target: "the package"}
    for (kind, cname), target in names.items():
        if target in taken:
            fail("{}: the {} {} and {} would both be the target `{}`".format(name, kind, cname, taken[target], target))
        taken[target] = "{} {}".format(kind, cname)

    missing = []
    units = {}

    def library_target(dep, lib):
        if dep["internal"]:
            return ":" + names[("lib", None if lib == "lib" else lib)]
        key = dep["package"] if lib == "lib" else "{}:{}".format(dep["package"], lib)
        if key in deps:
            return deps[key]
        if lib == "lib" and dep["package"] in compiler_packages:
            if compiler_prefix:
                return compiler_prefix + dep["package"]
            units[dep["package"]] = None
            return ":" + dep["package"]
        missing.append("--dep {}=<target>".format(key))
        return None

    def tool_target(dep):
        if dep["internal"]:
            return ":" + names[("exe", dep["executable"])]
        key = "{}:{}".format(dep["package"], dep["executable"])
        if key in tools:
            return tools[key]
        missing.append("--tool {}=<target>".format(key))
        return None

    targets = []
    for c in components:
        attrs = [("name", names[(c["kind"], c["name"])]), ("package", ":" + package_target)]
        if c["kind"] == "lib" and c["name"]:
            attrs.append(("library_name", c["name"]))
        if c["kind"] == "exe" and names[("exe", c["name"])] != c["name"]:
            attrs.append(("executable_name", c["name"]))
        for field, spec in (_KINDS[c["kind"]].fields | BUILD_INFO_FIELDS).items():
            # NOTE: "." is where Cabal and the rules look anyway.
            if field in c and field not in _SPECIAL and not (field == "hs-source-dirs" and c[field] == ["."]):
                attrs.append((attr_name(field, spec), c[field]))
        build_depends = []
        for dep in c.get("build-depends", []):
            for lib in dep["libraries"]:
                target = library_target(dep, lib)
                if target and target not in build_depends:
                    build_depends.append(target)
        attrs.append(("build_depends", build_depends or None))
        build_tool_depends = [t for t in [tool_target(d) for d in c.get("build-tool-depends", [])] if t]
        attrs.append(("build_tool_depends", build_tool_depends or None))
        cxx_deps = []
        for entry in c.get("pkgconfig-depends", []):
            # `<name> <version range>`
            pc_name = entry.split(" ")[0]
            if pc_name not in pkgconfig:
                missing.append("--pkgconfig {}=<target>".format(pc_name))
            elif pkgconfig[pc_name] not in cxx_deps:
                cxx_deps.append(pkgconfig[pc_name])
        attrs.append(("cxx_deps", cxx_deps or None))
        attrs.append(("generated", generated or None))

        # What other packages can use: the libraries Cabal would let them, and
        # the executables.
        if c["kind"] == "exe" or (c["kind"] == "lib" and (c.get("visibility") or ("private" if c["name"] else "public")) == "public"):
            attrs.append(("visibility", ["PUBLIC"]))
        targets.append(struct(rule = _KINDS[c["kind"]].rule, attrs = attrs))

    if missing:
        fail("{}: some dependencies are not packages of the compiler or C libraries without a target, say which targets they are:\n  {}".format(
            name,
            "\n  ".join({m: None for m in missing}.keys()),
        ))

    package = [("name", package_target)]
    if package_target != name:
        package.append(("package_name", name))
    package.extend([("version", desc["version"]), ("srcs", srcs), ("root", root)])
    for field, spec in PACKAGE_FIELDS.items():
        if field in desc:
            value = desc[field]
            if (field == "data-dir" and value in (".", "")) or (field == "license" and value == "NONE"):
                continue
            package.append((attr_name(field, spec), value))

    # The rules making the directories of `generated` may use the package,
    # from another BUCK file.
    if generated:
        package.append(("visibility", ["PUBLIC"]))

    return struct(
        targets = [struct(rule = "cabal_package", attrs = package)] + targets,
        units = sorted(units.keys()),
        skipped = [c for c in skipped if tests or c["kind"] != "test"],
    )

def buck_file(
        desc: dict[str, typing.Any],
        compiler_packages: list[str],
        srcs: typing.Any,
        deps: dict[str, str] = {},
        tools: dict[str, str] = {},
        compiler_prefix: str | None = None,
        tests: bool = True,
        source: str = "",
        loads: list[str] = [],
        preamble: list[str] = [],
        pkgconfig: dict[str, str] = {}) -> str:
    """The text of a BUCK file with cabal_simple targets for a package.

    Args:
      desc: what describe_package printed, decoded
      compiler_packages: see package_targets
      srcs: see package_targets
      deps: see package_targets
      tools: see package_targets
      compiler_prefix: see package_targets
      tests: see package_targets
      source: where the description comes from, for the header
      loads: more load statements, for the preamble
      preamble: lines to put after the loads (e.g. a hackage_package)
      pkgconfig: see package_targets
    Returns:
      the text, to be formatted with buildifier
    """
    package = package_targets(desc, compiler_packages, srcs, deps, tools, compiler_prefix, tests, pkgconfig = pkgconfig)
    rules = sorted({t.rule: None for t in package.targets[1:]}.keys())
    lines = [
        "# Generated by timbuktu//rules/haskell/cabal/generate.bxl from",
        "# {}, with the conditionals resolved for".format(source or desc["name"] + ".cabal"),
        "# GHC {} on {} and the flags: {}.".format(
            desc["ghc-version"],
            desc["platform"],
            " ".join([("+" if v else "-") + f for f, v in desc["flags"].items()]) or "none",
        ),
        "",
    ]
    if package.units:
        lines.append('load("@timbuktu//rules/haskell:defs.bzl", "haskell_unit")')
    lines.extend(loads)
    lines.append('load("@timbuktu//rules/haskell/cabal:defs.bzl", {})'.format(", ".join([repr(r) for r in ["cabal_package"] + rules])))
    lines.append("")
    lines.extend(preamble)
    out = "\n".join(lines) + "\n" + "\n".join([call(t.rule, t.attrs) for t in package.targets])
    for c in package.skipped:
        out += "\n# The {} {} is left out: {}.\n".format(
            c["kind"],
            c["name"] or "",
            "it is not buildable" if not c["buildable"] else "the cabal_simple rules have no rule for it",
        )
    if package.units:
        out += "\n# What comes with the compiler\n"
        for unit in package.units:
            out += "\nhaskell_unit(name = {})\n".format(repr(unit))
    return out

def glob_srcs() -> struct:
    """The `srcs` of a package whose BUCK file is next to its .cabal file."""
    return expr('glob(\n        ["**"],\n        exclude = ["BUCK", "dist-newstyle/**"],\n    )')

def label_srcs(label: str) -> struct:
    return expr(repr(label))
