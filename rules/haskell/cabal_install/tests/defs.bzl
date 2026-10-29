"""
What the test of the plan generator runs: the half of plan.bxl that writes
the BUCK file, as a rule, on a plan given as a file, with the descriptions
of its local packages given as files too (described_package, in
rules/haskell/cabal/tests/defs.bzl, makes them).
"""

load("//rules/haskell/cabal_install:plan_format.bzl", "decode_plan")
load("//rules/haskell/cabal_install:plan_targets.bzl", "buck_file")

def _generated_plan_buck_file_impl(ctx: AnalysisContext) -> list[Provider]:
    out = ctx.actions.declare_output(ctx.label.name + ".generated")
    plan = ctx.attrs.plan
    command = ctx.attrs.command
    where = str(ctx.label.raw_target())
    descriptions = ctx.attrs.local
    roots = ctx.attrs.roots
    generated = ctx.attrs.generated
    package_targets = ctx.attrs.package_targets
    as_simple = ctx.attrs.as_simple

    def write(ctx, artifacts, outputs):
        local = {
            pkg_id: struct(description = artifacts[d].read_json(), root = roots.get(pkg_id), pkgconfig = {}, generated = generated.get(pkg_id, {}), extra_libraries = {}, package_target = package_targets.get(pkg_id), as_simple = pkg_id in as_simple)
            for pkg_id, d in descriptions.items()
        }
        ctx.actions.write(outputs[out], buck_file(decode_plan(where, artifacts[plan].read_string()), command, where, local))

    ctx.actions.dynamic_output(dynamic = [plan] + descriptions.values(), inputs = [], outputs = [out.as_output()], f = write)
    return [DefaultInfo(default_output = out)]

generated_plan_buck_file = rule(
    doc = "The BUCK file plan.bxl would make out of a plan.",
    impl = _generated_plan_buck_file_impl,
    attrs = {
        # The local packages taken as Simple, by id (see plan.bxl's
        # --as-simple).
        "as_simple": attrs.list(attrs.string(), default = []),
        "command": attrs.string(default = "buck2 bxl //rules/haskell/cabal_install/plan.bxl:generate -- ..."),
        # The directories of each local package made by other targets, by
        # its id (see `generated` in package_targets).
        "generated": attrs.dict(attrs.string(), attrs.dict(attrs.string(), attrs.string()), default = {}),
        # What describe_package prints for each local package, by its id.
        "local": attrs.dict(attrs.string(), attrs.source(), default = {}),
        # The cabal_package target of a local package of another cell, by
        # its id.
        "package_targets": attrs.dict(attrs.string(), attrs.string(), default = {}),
        "plan": attrs.source(),
        # The directory of each local package, relative to the BUCK file.
        "roots": attrs.dict(attrs.string(), attrs.string(), default = {}),
    },
)
