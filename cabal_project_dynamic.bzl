load("@prelude//utils:graph_utils.bzl", "post_order_traversal")

DynamicUnitInfo = provider(fields = {
    "depends": provider_field(list[str]),
    # "source": provider_field(Artifact),
})

DynamicPlanInfo = provider(fields = {
    "units": provider_field(dict[str, DynamicUnitInfo]),
})

PlanInfo = provider(fields = {
    "dynamic": provider_field(DynamicValue),
})

def _dynamic_actions_impl(actions: AnalysisActions, artifacts, dynamic_values, outputs, arg):
    plandata = artifacts[arg.planjson].read_json()

    units = {unit["id"]: normalise_legacy_unit(unit) for unit in plandata["install-plan"]}

    graph = {uid: unit["depends"] for uid, unit in units.items()}
    for unit_id in post_order_traversal(graph):
        unit = units[unit_id]
        pkg_id = "{}-{}".format(unit["pkg-name"], unit["pkg-version"])
        if unit["type"] != "configured":
            continue

        out = actions.declare_output("build-" + unit_id)
        actions.write(out.as_output(), "done")

    # srcdirs = {}
    # for unit in units.values():
    #   pkg_id = "{}-{}".format(unit["pkg-name"], unit["pkg-version"])
    #   if unit["type"] != "configured": continue
    #
    #   # if pkg_id not in srcdirs:
    #   #   srcdirs[pkg_id] = fetch(ctx, pkg_id = pid, pkg_src_sha256 = unit["pkg-src-sha256"], pkg_src = unit["pkg-src"])

    return [
        DynamicPlanInfo(
            units = {
                unit_id: DynamicUnitInfo(
                    depends = unit["depends"],
                    # source = srcdirs["{}-{}".format(unit["pkg-name"], unit["pkg-version"])]
                )
                for unit_id, unit in units.items()
            },
        ),
    ]

_dynamic_actions = dynamic_actions(impl = _dynamic_actions_impl)

def _dynamic_plan_impl(ctx: AnalysisContext) -> list[Provider]:
    builddir = ctx.actions.declare_output("dist-newstyle", dir = True)
    ctx.actions.run(
        [
            "cabal",
            "build",
            "--dry-run",
            "--project-file",
            ctx.attrs.project_file,
            "--builddir",
            builddir.as_output(),
            "comonad",
        ],
        category = "planning",
    )
    planjson = builddir.project("cache/plan.json")

    dynamic_value = ctx.actions.dynamic_output_new(_dynamic_actions(
        dynamic = [planjson],
        dynamic_values = [],
        outputs = [],
        arg = struct(planjson = planjson),
    ))

    return [
        DefaultInfo(default_output = planjson),
        PlanInfo(dynamic = dynamic_value),
    ]

dynamic_plan = rule(
    impl = _dynamic_plan_impl,
    attrs = {
        "project_file": attrs.string(default = "cabal.project"),
    },
)

def _stuff(ctx: AnalysisContext) -> list[Provider]:
    print("stuff", ctx.attrs.plan[PlanInfo].dynamic)
    out = ctx.actions.declare_output("stuff")
    ctx.actions.write(out.as_output(), "done")
    return [DefaultInfo(default_output = out)]

stuff = rule(
    impl = _stuff,
    attrs = {
        "plan": attrs.dep(providers = [PlanInfo]),
    },
)

Unit = provider(
    fields = ["id", "src"],
)

CabalProjectInfo = provider(
    fields = [
        "planjson",
        "package_db",
        "units",
    ],
)

def compile_setup(ctx: AnalysisContext) -> Artifact:
    todo = ctx.actions.declare_output("todo")
    return ctx.actions.write(todo.as_output(), "todo")

def _cabal_project_plan_impl(ctx: AnalysisContext) -> list[Provider]:
    builddir = ctx.actions.declare_output("dist-newstyle", dir = True)
    ctx.actions.run(
        [
            "cabal",
            "build",
            "--dry-run",
            "--project-file",
            ctx.attrs.project_file,
            "--builddir",
            builddir.as_output(),
            "comonad",
        ],
        category = "planning",
    )
    planjson = builddir.project("cache/plan.json")
    planbzl = ctx.actions.declare_output("plan.bzl")

    def f(ctx, artifacts, outputs):
        plandata = artifacts[planjson].read_json()

        units = {unit["id"]: normalise_legacy_unit(unit) for unit in plandata["install-plan"]}

        srcdirs = {}
        for uid in units:
            unit = units[uid]
            pid = unit["pkg-name"] + "-" + unit["pkg-version"]
            if unit["type"] != "configured":
                continue

            if pid not in srcdirs:
                srcdirs[pid] = fetch(ctx, pkg_id = pid, pkg_src_sha256 = unit["pkg-src-sha256"], pkg_src = unit["pkg-src"])

        setup_exe = default_setup(ctx)

        setups = {}
        for uid in units:
            unit = units[uid]
            pid = unit["pkg-name"] + "-" + unit["pkg-version"]
            if unit["type"] != "configured":
                continue

            if pid not in setups:
                if "setup-depends" in unit:
                    setups[pid] = compile_setup(ctx, unit["setup-depends"])
                else:
                    setups[pid] = setup_exe

        ctx.actions.write(
            outputs[planbzl].with_associated_artifacts(srcdirs.values() + setups.values()).as_output(),
            "plan = " + repr(srcdirs),
        )
        debug(planbzl)
        debug(outputs[planbzl])
        pprint(outputs[planbzl])

    ctx.actions.dynamic_output(
        dynamic = [
            planjson,
        ],
        inputs = [],
        outputs = [
            planbzl.as_output(),
        ],
        f = f,
    )

    return [
        DefaultInfo(
            default_output = planbzl,
        ),
    ]

# # def _cabal_project_something_impl(ctx: AnalysisContext) -> list[Provider]:
# #   # cabal_project_toolchain = ctx.attrs.cabal_project_toolchain.get(CabalProjectInfo)
# #   return ctx.attrs.cabal_project_toolchain.get(DefaultInfo)
# #     # DefaultInfo(default_output = cabal_project_toolchain.package_db)
# #
# # cabal_project_something = rule(
# #   impl = _cabal_project_something_impl,
# #   attrs = {
# #     "cabal_project_toolchain": attrs.toolchain_dep(default = "toolchains//:cabal_project_deps", providers = [CabalProjectInfo]),
# #   },
# # )
# def in_dir(script, dir):
#   return cmd_args("env", "-C", dir, script.relative_to(dir))

def fetch(ctx: AnalysisContext, pkg_id: str, pkg_src_sha256: str, pkg_src: dict) -> Artifact:
    # Download
    filename = "{}.tar.gz".format(pkg_id)
    url = "{}/package/{}".format(pkg_src["repo"]["uri"], filename)

    sdist = ctx.actions.declare_output(filename)
    ctx.actions.download_file(sdist.as_output(), url, sha256 = pkg_src_sha256)

    # Unpack archive to output directory.
    srcdir = ctx.actions.declare_output(pkg_id, dir = True)
    ctx.actions.run(
        cmd_args("tar", "xzf", sdist, "-C", cmd_args(srcdir.as_output(), parent = 1)),
        category = "http_archive",
        identifier = pkg_id,
    )

    return srcdir

# def setup(ctx: AnalysisContext, pkg_id: str, srcdir: Artifact) -> Artifact:
#   setup_exe = ctx.actions.declare_output("setup-" + pkg_id)
#
#   setup_hs = srcdir.project("Setup.hs")
#   pprint(setup_hs)
#
#   # def f(ctx, artifacts, outputs):
#   #   # need a script?
#   #   pprint(ctx)
#   #   # pprint(artifacts[setup_hs].read_string)
#   #
#   #   pass
#   #
#   # ctx.actions.dynamic_output(
#   #   dynamic = [setup_hs],
#   #   inputs = [],
#   #   outputs = [setup_exe.as_output()],
#   #   f = f)
#
#   return setup_exe
#
#
# def build_unit(ctx: AnalysisContext, unit: dict, srcdir: Artifact, setup: Artifact) -> Artifact:
#   uid = unit["id"]
#   builddir = ctx.actions.declare_output("build-" + uid, dir = True)
#
#   # Configure
#   ctx.actions.run(
#     in_dir(
#       cmd_args("runhaskell", "Setup.hs", "configure", "--builddir", builddir.as_output(), hidden = [setup]).relative_to(srcdir)
#     , srcdir),
#     category = "setup",
#     identifier = unit["id"]
#   )
#
#   # Build
#   output = ctx.actions.declare_output("output" + unit["id"])
#   ctx.actions.write(output.as_output(), "done")
#
#   return builddir
#
# # def build_dependencies(ctx: AnalysisContext) -> list[Provider]:
# #   planjson = make_planjson(ctx)
# #   something = ctx.actions.declare_output("something")
# #
# #   def f(ctx, artifacts, outputs):
# #     plan = artifacts[planjson].read_json()
# #
# #     units = {unit["id"]: normalise_legacy_unit(unit) for unit in plan["install-plan"]}
# #
# #     srcdirs = {}
# #     for uid in units:
# #       unit = units[uid]
# #       pid = unit["pkg-name"] + "-" + unit["pkg-version"]
# #       if unit["type"] != "configured": continue
# #
# #       if pid not in srcdirs:
# #         srcdirs[pid] = fetch(ctx, pkg_id = pid, pkg_src_sha256 = unit["pkg-src-sha256"], pkg_src = unit["pkg-src"])
# #
# #     setups = {}
# #     for uid in units:
# #       unit = units[uid]
# #       pid = unit["pkg-name"] + "-" + unit["pkg-version"]
# #       if unit["type"] != "configured": continue
# #
# #       if pid not in setups:
# #         setups[pid] = setup(ctx, pkg_id = pid, srcdir = srcdirs[pid])
# #
# #     graph = { uid: unit["depends"] for uid, unit in units.items() }
# #
# #     built_units = {}
# #     for uid in post_order_traversal(graph):
# #       unit = units[uid]
# #       pid = unit["pkg-name"] + "-" + unit["pkg-version"]
# #       if unit["type"] != "configured": continue
# #
# #       built_units[uid] = build_unit(ctx, unit = unit, srcdir = srcdirs[pid], setup = setups[pid])
# #
# #     # TODO
# #     ctx.actions.run(cmd_args("touch", outputs[something].as_output(), hidden = built_units.values()), category = "checking_the_date")
# #
# #   ctx.actions.dynamic_output(
# #     dynamic = [planjson],
# #     inputs = [],
# #     outputs = [something.as_output()],
# #     f = f)
# #
# #   return [DefaultInfo(default_output = something)]
#
#
# def _another(ctx: AnalysisContext) -> list[Provider]:
#     return [DefaultInfo()]
#
# another = rule(
#   impl = _another,
#   attrs = {},
#   is_toolchain_rule = True,
# )
#
# def _cabal_project_deps_impl(ctx: AnalysisContext) -> list[Provider]:
#   planjson = ctx.attrs.plan.get(DefaultInfo).default_outputs[0]
#
#   package_db = ctx.actions.declare_output("package_db")
#
#   def f(ctx, artifacts, outputs):
#     plandata = artifacts[planjson].read_json()
#
#     units = {unit["id"]: normalise_legacy_unit(unit) for unit in plandata["install-plan"]}
#
#     srcdirs = {}
#     for uid in units:
#       unit = units[uid]
#       pid = unit["pkg-name"] + "-" + unit["pkg-version"]
#       if unit["type"] != "configured": continue
#
#       if pid not in srcdirs:
#         srcdirs[pid] = fetch(ctx, pkg_id = pid, pkg_src_sha256 = unit["pkg-src-sha256"], pkg_src = unit["pkg-src"])
#
#     ctx.actions.run(
#       cmd_args("ghc-pkg", "init", outputs[package_db].as_output(), hidden = srcdirs.values()),
#       category = "package_db"
#     )
#
#   ctx.actions.dynamic_output(
#     dynamic = [planjson],
#     inputs = [],
#     outputs = [package_db.as_output()],
#     f = f)
#
#   return [
#     DefaultInfo(
#       default_output = package_db,
#     ),
#     CabalProjectInfo()
#   ]
#
#     # setups = {}
#     # for uid in units:
#     #   unit = units[uid]
#     #   pid = unit["pkg-name"] + "-" + unit["pkg-version"]
#     #   if unit["type"] != "configured": continue
#     #
#     #   if pid not in setups:
#     #     setups[pid] = setup(ctx, pkg_id = pid, srcdir = srcdirs[pid])
#
#     # graph = { uid: unit["depends"] for uid, unit in units.items() }
#     #
#     # for uid in post_order_traversal(graph):
#     #   unit = units[uid]
#     #   pid = unit["pkg-name"] + "-" + unit["pkg-version"]
#     #   if unit["type"] != "configured": continue
#     #
#     #   built_units[uid] = build_unit(ctx, unit = unit, srcdir = srcdirs[pid], setup = setups[pid])
#
#   # ctx.actions.dynamic_output(
#   #   dynamic = [planjson],
#   #   inputs = [],
#   #   outputs = [package_db.as_output()],
#   #   f = f)
#
#   # return [
#   #   DefaultInfo(
#   #     default_output = package_db,
#   #   ),
#   #   CabalProjectInfo()
#   # ]
#
#
# cabal_project_deps = rule(
#   impl = _cabal_project_deps_impl,
#   attrs = {
#     "plan": attrs.dep(),
#   },
#   is_toolchain_rule = True,
# )
#
# # def _cabal_project(ctx: AnalysisContext) -> list[Provider]:
# #   # planjson = make_planjson(ctx)
# #   #
# #
# # cabal_project = rule(
# #   impl = _cabal_project,
# #   attrs = {},
# #   is_toolchain_rule = True,
# # )
