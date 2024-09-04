load("@prelude//:paths.bzl", "paths")

def _in_dir(script, *, work_dir):
  return cmd_args("env", "-C", work_dir, cmd_args(*script).relative_to(work_dir))

CabalInfo = provider(fields=[
  "source",
  "builddir"
])

# configure

def _configure_impl(ctx):
  setup_config = ctx.actions.declare_output(paths.join(ctx.attrs.builddir, "setup-config"))

  script = _in_dir(
    "runhaskell", "Setup.hs", "configure", cmd_args(ctx.attrs.builddir, format = "--builddir={}"),
    work_dir = ctx.attrs.source
  )
  ctx.actions.run(script, category = "configure")
  return [
    DefaultInfo(default_output = setup_config),
    CabalInfo(source = ctx.attrs.source, builddir = ctx.attrs.builddir)
  ]

configure = rule(
  impl = _configure_impl,
  attrs = {
    "source": attrs.source(allow_directory = True),
    "builddir": attrs.string(default = "dist")
  }
)

# build

def _build_impl(ctx):
  thing = ctx.attrs.thing

  srcdir = thing[CabalInfo].source
  builddir = thing[CabalInfo].builddir

  script = inWorkDir(
    cmd_args("runhaskell", "Setup.hs", "build", cmd_args(builddir, format = "--builddir={}"), ""),
    srcdir
  )
  ctx.actions.run(script, category = "build")
  return [DefaultInfo(default_output = 1)]

build = rule(
  impl = _build_impl,
  attrs = {
    "thing": attrs.dep(providers = [CabalInfo])
  }
)
