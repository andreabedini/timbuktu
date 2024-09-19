load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("cabal_install/configured_unit.bzl", "configured_legacy_unit", "configured_unit")
load("cabal_install/pkg_src.bzl", "unit_src")
load("cabal_install/pre_existing_unit.bzl", "pre_existing_unit")
load("cabal_install/setup.bzl", "custom_setup", "setup")
load("cabal_install/utils.bzl", "normalise_legacy_unit")

_as_source = lambda dep: ":{}".format(dep)

def interpret_plan(planjson: str):
    plan = json.decode(planjson)
    units = map(normalise_legacy_unit, plan["install-plan"])

    srcs = {}
    setups = {}

    haskell_toolchain = "toolchains//haskell:" + plan["compiler-id"]

    for unit in units:
        if unit["type"] == "configured" and unit["style"] == "global":
            pkg_name = unit["pkg-name"]
            pkg_version = unit["pkg-version"]
            pkg_id = "{}-{}".format(pkg_name, pkg_version)

            normalise_legacy_unit(unit)

            if pkg_id not in srcs:
                srcs[pkg_id] = pkg_id
                unit_src(
                    name = pkg_id,
                    pkg_name = unit["pkg-name"],
                    pkg_version = unit["pkg-version"],
                    pkg_src = unit["pkg-src"],
                    pkg_src_sha256 = unit["pkg-src-sha256"],
                    pkg_cabal_sha256 = unit.get("pkg-cabal-sha256"),
                )

            is_legacy_build = "components" in unit

            if is_legacy_build:
                custom_setup(
                    name = pkg_id + "-setup",
                    src = _as_source(pkg_id),
                    depends = map(_as_source, unit.get("setup-depends", [])),
                    _haskell_toolchain = haskell_toolchain,
                )

                configured_legacy_unit(
                    name = unit["id"],
                    unit_id = unit["id"],
                    pkg_name = unit["pkg-name"],
                    pkg_version = unit["pkg-version"],
                    flags = unit["flags"],
                    depends = map(_as_source, unit.get("depends", [])),
                    exe_depends = map(_as_source, unit.get("exe-depends", [])),
                    setup = _as_source(pkg_id + "-setup"),
                    src = _as_source(pkg_id),
                    _haskell_toolchain = haskell_toolchain,
                )
            else:
                if pkg_id not in setups:
                    setups[pkg_id] = pkg_id
                    setup(
                        name = pkg_id + "-setup",
                        src = _as_source(pkg_id),
                        _haskell_toolchain = haskell_toolchain,
                    )

                configured_unit(
                    name = unit["id"],
                    unit_id = unit["id"],
                    pkg_name = unit["pkg-name"],
                    pkg_version = unit["pkg-version"],
                    flags = unit["flags"],
                    depends = map(_as_source, unit.get("depends", [])),
                    exe_depends = map(_as_source, unit.get("exe-depends", [])),
                    setup = _as_source(pkg_id + "-setup"),
                    src = _as_source(pkg_id),
                    component_name = unit.get("component-name"),
                    _haskell_toolchain = haskell_toolchain,
                )

        elif unit["type"] == "pre-existing":
            pre_existing_unit(
                name = unit["id"],
                unit_id = unit["id"],
                pkg_name = unit["pkg-name"],
                pkg_version = unit["pkg-version"],
                depends = map(_as_source, unit["depends"]),
                _haskell_toolchain = haskell_toolchain,
            )

def _cabal_project_impl(ctx: AnalysisContext) -> list[Provider]:
    builddir = ctx.actions.declare_output("dist-newstyle", dir = True)
    haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

    ctx.actions.run(
        [
            "cabal",
            "build",
            "--dry-run",
            cmd_args(haskell_toolchain.compiler, format = "--with-compiler={}"),
            "--project-file",
            ctx.attrs.project_file,
            "--builddir",
            builddir.as_output(),
            ctx.attrs.targets,
        ],
        category = "cabal_install",
    )
    return [
        DefaultInfo(default_output = builddir.project("cache/plan.json")),
    ]

cabal_project = rule(
    impl = _cabal_project_impl,
    attrs = {
        "project_file": attrs.source(),
        "targets": attrs.list(attrs.string(), default = ["all"]),
        "_haskell_toolchain": attrs.toolchain_dep(providers = [HaskellToolchainInfo, HaskellPlatformInfo], default = "toolchains//:haskell"),
    },
)