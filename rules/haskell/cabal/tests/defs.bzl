"""
What the tests of describe_package and of the generator run: the two halves
of generate.bxl as rules, so that their outputs can be compared with what is
expected.
"""

load("//rules/haskell/cabal:generate.bzl", "buck_file", "glob_srcs")

def _described_package_impl(ctx: AnalysisContext) -> list[Provider]:
    out = ctx.actions.declare_output(ctx.label.name + ".json")
    ctx.actions.run(
        cmd_args(
            "sh",
            "-c",
            'out=$1; shift; exec "$@" > "$out"',
            "--",
            out.as_output(),
            ctx.attrs._describe_package[RunInfo],
            ctx.attrs.cabal,
            "--ghc-version",
            ctx.attrs.ghc_version,
            "--platform",
            ctx.attrs.platform,
            "--flags",
            ctx.attrs.flags,
        ),
        category = "describe_package",
    )
    return [DefaultInfo(default_output = out)]

described_package = rule(
    doc = "What describe_package prints for a .cabal file, for a GHC version and a platform given rather than the toolchain's.",
    impl = _described_package_impl,
    attrs = {
        "cabal": attrs.source(),
        "flags": attrs.string(default = ""),
        "ghc_version": attrs.string(default = "9.12.2"),
        "platform": attrs.string(default = "x86_64-linux"),
        "_describe_package": attrs.default_only(attrs.exec_dep(default = "root//rules/haskell/helpers:describe_package", providers = [RunInfo])),
    },
)

def _generated_buck_file_impl(ctx: AnalysisContext) -> list[Provider]:
    out = ctx.actions.declare_output(ctx.label.name + ".generated")
    description = ctx.attrs.description
    options = dict(
        compiler_packages = ctx.attrs.compiler_packages,
        deps = ctx.attrs.deps,
        tools = ctx.attrs.tools,
        compiler_prefix = ctx.attrs.compiler_prefix,
        tests = ctx.attrs.test_suites,
    )

    def write(ctx, artifacts, outputs):
        ctx.actions.write(outputs[out], buck_file(artifacts[description].read_json(), srcs = glob_srcs(), **options))

    ctx.actions.dynamic_output(dynamic = [description], inputs = [], outputs = [out.as_output()], f = write)
    return [DefaultInfo(default_output = out)]

generated_buck_file = rule(
    doc = "The BUCK file generate.bxl would make out of a description, with the packages of the compiler given.",
    impl = _generated_buck_file_impl,
    attrs = {
        "compiler_packages": attrs.list(attrs.string(), default = []),
        "compiler_prefix": attrs.option(attrs.string(), default = None),
        "deps": attrs.dict(attrs.string(), attrs.string(), default = {}),
        "description": attrs.source(),
        "test_suites": attrs.bool(default = True),
        "tools": attrs.dict(attrs.string(), attrs.string(), default = {}),
    },
)
