load("@prelude//haskell:toolchain.bzl", "HaskellPlatformInfo", "HaskellToolchainInfo")
load("cabal_install/configured_unit.bzl", "configured_legacy_unit", "configured_unit")
load("cabal_install/pkg_src.bzl", "unit_src")
load("cabal_install/pre_existing_unit.bzl", "pre_existing_unit")
load("cabal_install/setup.bzl", "setup_custom", "setup_simple")
load("cabal_install/utils.bzl", "normalise_legacy_unit")

_as_source = lambda dep: ":{}".format(dep)

def interpret_plan(planjson: str):
    plan = json.decode(planjson)
    units = map(normalise_legacy_unit, plan["install-plan"])

    # TODO: this feels hacky
    haskell_toolchain = "toolchains//{}:haskell".format(plan["compiler-id"])
    setup_default_deps = [
        "toolchains//{}:base".format(plan["compiler-id"]),
        "toolchains//{}:Cabal".format(plan["compiler-id"]),
    ]

    setup_simple(
        name = "setup_simple",
        deps = setup_default_deps + [
            # NOTE: these are for my postConf hack
            "toolchains//{}:bytestring".format(plan["compiler-id"]),
            "toolchains//{}:directory".format(plan["compiler-id"]),
        ],
        # NOTE: We sepecify the same toolchain, so we can use the same compiler
        # and the dependencies in setup_default_deps.
        _haskell_toolchain = haskell_toolchain,
    )

    srcs = {}

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
                setup_custom(
                    name = "{}-setup".format(pkg_id),
                    src = _as_source(pkg_id),
                    # We do no have enough information in plan.json to figure
                    # out the dependencies correctly, since cannot distinguish
                    # between configure and custom build-types. We assume that
                    # setup-depends are either complete or empty, in which case
                    # we use the dependencies of Cabal.
                    deps = map(_as_source, unit["setup-depends"]) or setup_default_deps,
                    # NOTE: We sepecify the same toolchain, so we can use the same compiler
                    # and the dependencies in setup_default_deps.
                    _haskell_toolchain = haskell_toolchain,
                )
                configured_legacy_unit(
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
                configured_unit(
                    name = unit["id"],
                    unit_id = unit["id"],
                    pkg_name = unit["pkg-name"],
                    pkg_version = unit["pkg-version"],
                    component_name = unit.get("component-name"),
                    src = _as_source(pkg_id),
                    flags = unit["flags"],
                    deps = map(_as_source, unit.get("depends", [])),
                    exec_deps = map(_as_source, unit.get("exe-depends", [])),
                    setup = ":setup_simple",
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
