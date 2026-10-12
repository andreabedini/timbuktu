"""
Turn the description of a package into cabal_simple targets.

The description is what root//rules/haskell/helpers:describe_package prints:
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
"""

# The fields of a component that are attributes of the cabal_simple rules,
# with underscores in place of dashes.
_COMPONENT_FIELDS = [
    "exposed-modules",
    "reexported-modules",
    "signatures",
    "main-is",
    "hs-source-dirs",
    "other-modules",
    "autogen-modules",
    "default-language",
    "other-languages",
    "default-extensions",
    "other-extensions",
    "ghc-options",
    "ghc-prof-options",
    "ghc-shared-options",
    "cpp-options",
    "cc-options",
    "cxx-options",
    "asm-options",
    "cmm-options",
    "ld-options",
    "hsc2hs-options",
    "c-sources",
    "cxx-sources",
    "asm-sources",
    "cmm-sources",
    "js-sources",
    "include-dirs",
    "includes",
    "install-includes",
    "autogen-includes",
    "extra-libraries",
    "extra-lib-dirs",
    "extra-ghci-libraries",
    "extra-bundled-libraries",
    "frameworks",
    "extra-framework-dirs",
    "pkgconfig-depends",
    "mixins",
]

# The fields of the package that are attributes of cabal_package.
_PACKAGE_FIELDS = [
    "cabal-version",
    "license",
    "license-files",
    "copyright",
    "maintainer",
    "author",
    "stability",
    "homepage",
    "package-url",
    "bug-reports",
    "synopsis",
    "category",
    "build-type",
    "data-dir",
    "data-files",
    "extra-source-files",
    "extra-doc-files",
]

_RULES = {
    "exe": "cabal_simple_executable",
    "lib": "cabal_simple_library",
    "test": "cabal_simple_test",
}

def _attr(field: str) -> str:
    return field.replace("-", "_")

def _value(value: typing.Any, indent: str) -> str:
    if type(value) == "list":
        if len(value) == 0:
            return "[]"
        if len(value) == 1:
            return "[{}]".format(_value(value[0], indent))
        inner = indent + "    "
        return "[\n" + "".join(["{}{},\n".format(inner, _value(v, inner)) for v in value]) + indent + "]"
    if type(value) == "struct":
        # An expression, as it is
        return value.expr
    return repr(value)

def _call(rule: str, attrs: list[(str, typing.Any)]) -> str:
    return "{}(\n".format(rule) + "".join([
        "    {} = {},\n".format(name, _value(value, "    "))
        for name, value in attrs
        if value != None
    ]) + ")\n"

def _expr(text: str) -> struct:
    return struct(expr = text)

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
        preamble: list[str] = []) -> str:
    """The text of a BUCK file with cabal_simple targets for a package.

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
      source: where the description comes from, for the header
      loads: more load statements, for the preamble
      preamble: lines to put after the loads (e.g. a hackage_package)
    Returns:
      the text, to be formatted with buildifier
    """
    name = desc["name"]
    components = [
        c
        for c in desc["components"]
        if c["kind"] in _RULES and c["buildable"] and (tests or c["kind"] != "test")
    ]
    skipped = [c for c in desc["components"] if c not in components]
    names = _target_names(components)

    taken = {name: "the package"}
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
        attrs = [("name", names[(c["kind"], c["name"])]), ("package", ":" + name)]
        if c["kind"] == "lib" and c["name"]:
            attrs.append(("library_name", c["name"]))
        if c["kind"] == "exe" and names[("exe", c["name"])] != c["name"]:
            attrs.append(("executable_name", c["name"]))
        if c["kind"] == "test":
            attrs.append(("type", c.get("type")))
        if c["kind"] == "lib" and c.get("visibility"):
            attrs.append(("library_visibility", c["visibility"]))
        for field in _COMPONENT_FIELDS:
            # NOTE: "." is where Cabal and the rules look anyway.
            if field in c and not (field == "hs-source-dirs" and c[field] == ["."]):
                attrs.append((_attr(field), c[field]))
        build_depends = []
        for dep in c.get("build-depends", []):
            for lib in dep["libraries"]:
                target = library_target(dep, lib)
                if target and target not in build_depends:
                    build_depends.append(target)
        attrs.append(("build_depends", build_depends or None))
        build_tool_depends = [t for t in [tool_target(d) for d in c.get("build-tool-depends", [])] if t]
        attrs.append(("build_tool_depends", build_tool_depends or None))

        # What other packages can use: the libraries Cabal would let them, and
        # the executables.
        if c["kind"] == "exe" or (c["kind"] == "lib" and (c.get("visibility") or ("private" if c["name"] else "public")) == "public"):
            attrs.append(("visibility", ["PUBLIC"]))
        targets.append(_call(_RULES[c["kind"]], attrs))

    if missing:
        fail("{}: some dependencies are not packages of the compiler, say which targets they are:\n  {}".format(
            name,
            "\n  ".join({m: None for m in missing}.keys()),
        ))

    package = [("name", name), ("version", desc["version"]), ("srcs", srcs)]
    for field in _PACKAGE_FIELDS:
        if field in desc:
            value = desc[field]
            if (field == "data-dir" and value in (".", "")) or (field == "license" and value == "NONE"):
                continue
            package.append((_attr(field), value))

    rules = sorted({_RULES[c["kind"]]: None for c in components}.keys())
    lines = [
        "# Generated by root//rules/haskell/cabal/generate.bxl from",
        "# {}, with the conditionals resolved for".format(source or name + ".cabal"),
        "# GHC {} on {} and the flags: {}.".format(
            desc["ghc-version"],
            desc["platform"],
            " ".join([("+" if v else "-") + f for f, v in desc["flags"].items()]) or "none",
        ),
        "",
    ]
    if units:
        lines.append('load("@root//rules/haskell:defs.bzl", "haskell_unit")')
    lines.extend(loads)
    lines.append('load("@root//rules/haskell/cabal:defs.bzl", {})'.format(", ".join([repr(r) for r in ["cabal_package"] + rules])))
    lines.append("")
    lines.extend(preamble)
    out = "\n".join(lines) + "\n" + _call("cabal_package", package)
    for t in targets:
        out += "\n" + t
    for c in skipped:
        if c["kind"] == "test" and not tests:
            continue
        out += "\n# The {} {} is left out: {}.\n".format(
            c["kind"],
            c["name"] or "",
            "it is not buildable" if not c["buildable"] else "the cabal_simple rules have no rule for it",
        )
    if units:
        out += "\n# What comes with the compiler\n"
        for unit in sorted(units.keys()):
            out += "\nhaskell_unit(name = {})\n".format(repr(unit))
    return out

def glob_srcs() -> struct:
    """The `srcs` of a package whose BUCK file is next to its .cabal file."""
    return _expr('glob(\n        ["**"],\n        exclude = ["BUCK", "dist-newstyle/**"],\n    )')

def label_srcs(label: str) -> struct:
    return _expr(repr(label))
