"""
Macros to import a plan generated by cabal-install into buck2.
"""

load("@prelude//rules.bzl", "haskell_binary")
load("cabal_install/build.bzl", "build")
load("cabal_install/build_legacy.bzl", "build_legacy")
load("cabal_install/pkg_src.bzl", "pkg_src")
load("cabal_install/pre_existing_unit.bzl", "pre_existing_unit")
load("toolchain.bzl", "haskell_toolchain_library")

_as_source = lambda dep: ":{}".format(dep)

def interpret_plan(name: str, planjson: str):
    """Interprets a cabal-install generated plan.json file into build rules.

    Args:
        name: The name of the rule.
        planjson: The JSON-encoded cabal install plan.
    """

    plan = json.decode(planjson)
    units = map(_normalise_legacy_unit, plan["install-plan"])

    # TODO: picking the toolchain by string interpolation feels a bit hacky
    haskell_toolchain = "toolchains//{}:haskell".format(plan["compiler-id"])

    haskell_toolchain_library(name = "base", _haskell_toolchain = haskell_toolchain)
    haskell_toolchain_library(name = "Cabal", _haskell_toolchain = haskell_toolchain)

    srcs = {}

    for unit in units:
        if unit["type"] == "configured" and unit["style"] == "global":
            pkg_id = "{pkg-name}-{pkg-version}".format(**unit)

            if pkg_id not in srcs:
                srcs[pkg_id] = pkg_id
                pkg_src(
                    name = pkg_id,
                    pkg_name = unit["pkg-name"],
                    pkg_version = unit["pkg-version"],
                    pkg_src = unit["pkg-src"],
                    pkg_src_sha256 = unit["pkg-src-sha256"],
                    pkg_cabal_sha256 = unit.get("pkg-cabal-sha256"),
                )

            is_legacy_build = "components" in unit

            if is_legacy_build:
                haskell_binary(
                    name = "{}-setup".format(pkg_id),
                    deps = map(_as_source, unit["setup-depends"]) or [":base", ":Cabal"],
                    srcs = {"Main.hs": ":{}[Setup.hs]".format(pkg_id)},
                    visibility = ["PUBLIC"],
                    _haskell_toolchain = haskell_toolchain,
                )

                build_legacy(
                    name = unit["id"],
                    unit_id = unit["id"],
                    pkg_name = unit["pkg-name"],
                    pkg_version = unit["pkg-version"],
                    flags = unit["flags"],
                    deps = map(_as_source, unit.get("depends", [])),
                    exec_deps = map(_as_source, unit.get("exe-depends", [])),
                    setup = _as_source("{}-setup".format(pkg_id)),
                    src = _as_source(pkg_id),
                    _haskell_toolchain = haskell_toolchain,
                )
            else:
                build(
                    name = unit["id"],
                    unit_id = unit["id"],
                    pkg_name = unit["pkg-name"],
                    pkg_version = unit["pkg-version"],
                    component_name = unit.get("component-name"),
                    src = _as_source(pkg_id),
                    flags = unit["flags"],
                    deps = map(_as_source, unit.get("depends", [])),
                    exec_deps = map(_as_source, unit.get("exe-depends", [])),
                    _haskell_toolchain = haskell_toolchain,
                )

        elif unit["type"] == "pre-existing":
            pre_existing_unit(
                name = unit["id"],
                unit_id = unit["id"],
                pkg_name = unit["pkg-name"],
                pkg_version = unit["pkg-version"],
                deps = map(_as_source, unit["depends"]),
                _haskell_toolchain = haskell_toolchain,
            )

def _normalise_legacy_unit(unit):
    if "components" in unit:
        components = unit["components"]

        depends = []
        exe_depends = []
        for n, c in components.items():
            if n != "setup":
                depends += c["depends"]
                exe_depends += c["exe-depends"]

        setup_depends = components["setup"]["depends"] if "setup" in components else []

        unit.update({
            "depends": depends,
            "exe-depends": exe_depends,
            "setup-depends": setup_depends,
        })

    return unit
