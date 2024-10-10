"""
Build rules for the simple build-type.
"""

load("@prelude//haskell/toolchain.bzl", "HaskellToolchainInfo")
load("@root//rules/haskell/cabal/paths.bzl", "PathsModuleCtx", "mk_paths_module")
load("@root//rules/haskell/cabal_install/common.bzl", "haskell_toolchain_attrs")

def _dynamic_target_metadata_impl(
        actions: AnalysisActions,
        artifact_values: dict[Artifact, ArtifactValue],
        dynamic_values: dict[DynamicValue, ResolvedDynamicValue],
        outputs: dict[Artifact, Artifact],
        arg: typing.Any) -> list[Provider]:
    buildinfo = artifact_values[arg.buildinfo].read_json()
    component = buildinfo["components"][0]

    s = mk_paths_module(PathsModuleCtx(
        package_name = arg.pkg_name,
        package_version = arg.pkg_version,
        bindir = "bindir",
        libdir = "libdir",
        dynlibdir = "dynlibdir",
        datadir = "datadir",
        libexecdir = "libexecdir",
        sysconfdir = "sysconfdir",
    ))
    paths_module = actions.write("Paths_{}.hs".format(arg.pkg_name, arg.pkg_name), s)

    args = component["compiler-args"]

    cmd = cmd_args(arg.compiler)

    for a in component["compiler-args"]:
        if not a.startswith("-optP"):
            cmd.add(a)

    cmd.add(*component["modules"])
    cmd.add([f.removesuffix(".hs") for f in component["src-files"]])
    cmd.add("-v")

    # override the output directory
    cmd.add("-outputdir", outputs[arg.outdir].as_output())
    cmd.add("-o", outputs[arg.out].as_output())

    # add include for the paths_module
    cmd.add(cmd_args(paths_module, format = "-i{}", parent = 1))

    srcdir = cmd_args(arg.cabalfile, parent = 1)
    actions.run(
        cmd_args(
            cmd_args(
                "env",
                "-C",
                srcdir,
                "--",
                cmd_args(cmd, relative_to = (arg.cabalfile, 1)),
            ),
            hidden = [paths_module],
        ),
        category = "build",
    )

    return []

_dynamic_target_metadata = dynamic_actions(impl = _dynamic_target_metadata_impl)

def _build_impl(ctx: AnalysisContext) -> list[Provider]:
    setup = ctx.attrs.setup[RunInfo]

    cabalfile = ctx.attrs.cabalfile
    srcdir = cmd_args(cabalfile, parent = 1)

    buildinfo = ctx.actions.declare_output("buildinfo.json")

    ctx.actions.run(
        cmd_args(
            cmd_args("env", "-C", srcdir, "--"),
            cmd_args(
                setup,
                "configure",
                cmd_args(buildinfo.as_output(), format = "--builddir={}", parent = 1),
                relative_to = (cabalfile, 1),
            ),
            hidden = [buildinfo.as_output()],
        ),
        category = "cabal_configure",
    )

    out = ctx.actions.declare_output("out")
    outdir = ctx.actions.declare_output("outdir", dir = True)

    ctx.actions.dynamic_output_new(_dynamic_target_metadata(
        dynamic_values = [],
        artifact_values = [
            buildinfo,
        ],
        outputs = [
            out.as_output(),
            outdir.as_output(),
        ],
        arg = struct(
            buildinfo = buildinfo,
            out = out,
            outdir = outdir,
            cabalfile = cabalfile,
            compiler = ctx.attrs._haskell_toolchain[HaskellToolchainInfo].compiler,
            pkg_name = ctx.attrs.pkg_name,
            pkg_version = ctx.attrs.pkg_version,
        ),
    ))

    return [
        DefaultInfo(default_outputs = [out, outdir]),
    ]

build = rule(
    impl = _build_impl,
    attrs = {
        "pkg_name": attrs.string(),
        "pkg_version": attrs.string(),
        "cabalfile": attrs.source(),
        "setup": attrs.dep(
            default = "//rules/haskell/cabal_install/helpers:setup_simple",
            providers = [RunInfo],
        ),
    } | haskell_toolchain_attrs,
)
