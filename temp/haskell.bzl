load("@prelude//decls/toolchains_common.bzl", "toolchains_common")
load("@prelude//haskell:toolchain.bzl", "HaskellToolchainInfo")


def hackage_package(name : str, version : str, sha256 : str, sub_targets : list[str] = []):
  pkgid = name + "-" + version
  return native.http_archive(
    name = "src-{}".format(pkgid),
    urls = ["https://hackage.haskell.org/package/{}/{}.tar.gz".format(pkgid, pkgid)],
    sha256 = sha256,
    out = pkgid,
    strip_prefix = pkgid,
    sub_targets = sub_targets,
  )


def _haskell_executable_impl(ctx : AnalysisContext) -> list[Provider]:
  haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

  compile_cmd = cmd_args(haskell_toolchain.compiler)
  compile_cmd.add(haskell_toolchain.compiler_flags)

  output = ctx.actions.declare_output(ctx.attrs.name)
  objects = ctx.actions.declare_output("objects", dir = True)
  hi = ctx.actions.declare_output("hi", dir = True)
  stubs = ctx.actions.declare_output("stubs", dir = True)

  debug(ctx.attrs)

  compile_cmd.add(
    "-o",
    output.as_output(),
    "-odir",
    objects.as_output(),
    "-hidir",
    hi.as_output(),
    "-hiedir",
    hi.as_output(),
    "-stubdir",
    stubs.as_output(),
  )

  # includes
  # TODO Is this needed?
  compile_cmd.add("-i")

  for inc in ctx.attrs.includes:
    compile_cmd.add(cmd_args(inc, format = "-i{}"))
 
  # TODO customise this
  compile_cmd.add(
    "-hide-all-packages",
    "-clear-package-db",
    "-global-package-db",
  )
  compile_cmd.add([cmd_args("-packagedb", packagedb) for packagedb in ctx.attrs.packagedbs])
  compile_cmd.add([cmd_args("-package", package) for package in ctx.attrs.packages])

  # extensions
  if ctx.attrs.language != None:
    compile_cmd.add(cmd_args(ctx.attrs.language, format="-X{}"))

  compile_cmd.add(cmd_args(ctx.attrs.extensions, format="-X{}"))
  
  # anything else
  compile_cmd.add(ctx.attrs.compiler_flags)

  # sources
  compile_cmd.add(ctx.attrs.srcs)
  
  # modules
  compile_cmd.add(ctx.attrs.modules)

  ctx.actions.run(
      compile_cmd,
      category = "haskell_compile",
  )

  return [
    DefaultInfo(
      default_output = output,
      other_outputs = [objects, hi, stubs],
    ),
    RunInfo(args = "alex"),
  ]


haskell_executable = rule(
  impl = _haskell_executable_impl,
  attrs = {
    "_haskell_toolchain": toolchains_common.haskell(),
    "compiler_flags": attrs.list(attrs.arg(), default = []),
    "includes": attrs.list(attrs.source(allow_directory = True), default = []),

    "packagedbs": attrs.list(attrs.string(), default = []),
    "packages": attrs.list(attrs.string(), default = []),
    "srcs": attrs.list(attrs.source(), default = []),

    "modules": attrs.list(attrs.string(), default = []),
    "language": attrs.option(attrs.string(), default = None),
    "extensions": attrs.list(attrs.string(), default = []),
  }
)

