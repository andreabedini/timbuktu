"""
A build plan made and built in one target, at build time.

    dynamic_plan(
        name = "shake",
        targets = ["shake"],
        index_state = "2026-06-01T00:00:00Z",
        executables = ["shake"],
    )

Where `plan` and `interpret_plan` make a plan once and turn it into a target
per unit, this rule runs cabal-solver-plan as one of its actions, reads the
plan in a dynamic action and builds every unit there, with the functions of
setup.bzl. Nothing is pasted into a BUCK file, and a new index-state or
target is a change of attribute. The price is that the units are not targets:
what the rule offers is the executables named in `executables`, as
subtargets that `buck2 run` can run, and `units.txt`, which lists every unit
with where it was installed and depends on all of them.

The attributes are those of `plan`.
"""

load("//rules/haskell:providers.bzl", "CabalLibraryInfo", "CabalUnitTSet")
load("//rules/haskell:toolchain.bzl", "GhcToolchainInfo")
load("//rules/haskell:unit.bzl", "resolve_unit")
load(":pkg_src.bzl", "fetch_package")
load(":plan.bzl", "plan_attrs", "solve")
load(":plan_format.bzl", "component", "decode_plan")
load(":setup.bzl", "SetupEnv", "SetupUnit", "build_component", "build_package", "compile_setup")
load(":solver_toolchain.bzl", "CabalSolverPlanInfo")

def _build_plan_impl(
        actions: AnalysisActions,
        plan: ArtifactValue,
        executables: dict[str, OutputArtifact],
        manifest: OutputArtifact,
        arg: typing.Any) -> list[Provider]:
    plan = decode_plan(str(arg.label), plan.read_string())

    packages = {package["id"]: package for package in plan["packages"]}
    srcdirs = {}
    libraries = {}
    exes = {}
    installed = []

    def srcdir(package_id):
        if package_id not in srcdirs:
            srcdirs[package_id] = fetch_package(actions, "src/" + package_id, packages[package_id]).srcdir
        return srcdirs[package_id]

    # Dependencies come before what needs them.
    for unit in plan["units"]:
        unit_id = unit["id"]
        if unit["type"] == "pre-existing":
            if unit.get("db", "global") != "global":
                fail("{}: {} is in the package db {}; only the compiler's is supported".format(arg.label, unit_id, unit["db"]))
            lib_name = component(unit["component"])[1]
            libraries[unit_id] = CabalLibraryInfo(
                name = unit["name"],
                lib_name = lib_name,
                id = unit_id,
                unit = resolve_unit(actions, arg.ghc, arg.label, None, unit_id, None if lib_name else unit["name"], unit["version"], scope = "unit/" + unit_id).unit,
                units = actions.tset(CabalUnitTSet, children = [libraries[d].units for d in unit["depends"]]),
            )
            continue

        for exe in unit["exe-depends"]:
            if exe not in exes:
                fail("{}: {} needs an executable of {}, which is built as a whole package; only its library is available".format(arg.label, unit_id, exe))

        env = SetupEnv(actions = actions, ghc = arg.ghc, label = arg.label, scope = "unit/" + unit_id)
        setup_unit = SetupUnit(
            id = unit_id,
            name = unit["name"],
            version = unit["version"],
            flags = unit["flags"],
            component = unit.get("component") if unit["build-style"] == "per-component" else None,
        )
        deps = [libraries[d] for d in unit["depends"]]
        exe_deps = [exes[d] for d in unit["exe-depends"]]
        src = srcdir(unit["package"])

        if unit["build-style"] == "per-component":
            built = build_component(env, setup_unit, src, arg.setup, deps, exe_deps)
        elif unit["build-style"] == "whole-package":
            setup = compile_setup(env, src, [libraries[d] for d in unit["setup-depends"]])
            built = build_package(env, setup_unit, src, setup, deps, exe_deps)
        else:
            fail("{}: {} has build style {}, which decode_plan should have refused".format(arg.label, unit_id, unit["build-style"]))

        if built.library:
            libraries[unit_id] = built.library
        if built.executable:
            exes[unit_id] = built.executable
        installed.append(cmd_args(unit_id, built.installdirs.prefix, built.package_conf or [], delimiter = " "))

    # The executables asked for, among the units the plan was made for.
    by_name = {}
    for unit_id in plan["targets"]:
        if unit_id in exes:
            by_name[exes[unit_id].name] = exes[unit_id]
    for name, out in executables.items():
        if name not in by_name:
            fail("{}: no target of the plan is an executable called `{}`; there are: {}".format(arg.label, name, ", ".join(by_name.keys()) or "none"))
        actions.copy_file(out, by_name[name].exe)

    # One line for each unit built: its id, its installation prefix and its
    # registration. Writing it takes all of them.
    actions.run(
        cmd_args("sh", "-c", 'out=$1; shift; printf "%s\\n" "$@" > "$out"', "--", manifest, installed),
        category = "dynamic_plan_manifest",
    )
    return []

_build_plan = dynamic_actions(
    impl = _build_plan_impl,
    attrs = {
        "arg": dynattrs.value(typing.Any),
        "executables": dynattrs.dict(str, dynattrs.output()),
        "manifest": dynattrs.output(),
        "plan": dynattrs.artifact_value(),
    },
)

def _dynamic_plan_impl(ctx: AnalysisContext) -> list[Provider]:
    ghc = ctx.attrs._ghc[GhcToolchainInfo]
    plan = solve(ctx.actions, ctx.attrs._solver[CabalSolverPlanInfo], ghc, ctx.attrs)
    executables = {name: ctx.actions.declare_output("bin", name) for name in ctx.attrs.executables}
    manifest = ctx.actions.declare_output("units.txt")
    ctx.actions.dynamic_output_new(_build_plan(
        plan = plan,
        executables = {name: out.as_output() for name, out in executables.items()},
        manifest = manifest.as_output(),
        arg = struct(
            ghc = ghc,
            label = ctx.label,
            setup = ctx.attrs._setup_simple[RunInfo],
        ),
    ))

    sub_targets = {"plan.json": [DefaultInfo(default_output = plan)]}
    for name, exe in executables.items():
        sub_targets[name] = [DefaultInfo(default_output = exe), RunInfo(args = exe)]
    return [DefaultInfo(default_output = manifest, sub_targets = sub_targets)]

dynamic_plan = rule(
    doc = "Make a build plan and build it, all at build time. See dynamic_plan.bzl.",
    impl = _dynamic_plan_impl,
    attrs = plan_attrs | {
        "executables": attrs.list(attrs.string(), default = [], doc = "The executables of the plan's targets to offer as subtargets."),
        "_setup_simple": attrs.dep(default = "//rules/haskell/cabal_install/helpers:setup_simple", providers = [RunInfo]),
    },
)
