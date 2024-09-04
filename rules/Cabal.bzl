load("@prelude//decls/toolchains_common.bzl", "toolchains_common")
load("@prelude//haskell:toolchain.bzl", "HaskellToolchainInfo")
load("@rules//:GHC.bzl", "GhcOptions", "render_ghc_options")


def _executable_impl(ctx : AnalysisContext) -> list[Provider]:
  haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

  compile_cmd = cmd_args(haskell_toolchain.compiler)
  compile_cmd.add(haskell_toolchain.compiler_flags)

  out = ctx.actions.declare_output(ctx.attrs.name)

  objDir = ctx.actions.declare_output("obj", dir = True)
  hiDir = ctx.actions.declare_output("hi", dir = True)
  stubDir = ctx.actions.declare_output("stub", dir = True)

  ghcOptions = GhcOptions(
    inputFiles = ctx.attrs.inputFiles,
    inputModules = ctx.attrs.inputModules,

    outputFile = out.as_output(),
    sourcePath = ctx.attrs.sourcePath,
    
    language = ctx.attrs.language,
    extensions = ctx.attrs.extensions,

    hiDir = hiDir.as_output(),
    hieDir = hiDir.as_output(),
    objDir = objDir.as_output(),
    stubDir = stubDir.as_output(),

    cppIncludes = ctx.attrs.cppIncludes,
  )

  compile_cmd.add(render_ghc_options(ghcOptions))

  ctx.actions.run(
      compile_cmd,
      category = "haskell_compile",
      identifier = ctx.attrs.name,
  )

  return [
    DefaultInfo(
      default_output = out,
      other_outputs = [objDir, hiDir, stubDir],
    ),
    RunInfo(args = ctx.attrs.name),
  ]

executable = rule(
  impl = _executable_impl,
  attrs = {
    "_haskell_toolchain": toolchains_common.haskell(),
    "sourcePath": attrs.list(attrs.source(allow_directory = True)),
    "language": attrs.option(attrs.string()),
    "extensions": attrs.list(attrs.string(), default = []),
    "inputFiles": attrs.list(attrs.source(), default = []),
    "inputModules": attrs.list(attrs.string(), default = []),
    "cppIncludes": attrs.list(attrs.source(), default = [])
  },
)


def _library_impl(ctx : AnalysisContext) -> list[Provider]:
  haskell_toolchain = ctx.attrs._haskell_toolchain[HaskellToolchainInfo]

  compile_cmd = cmd_args(haskell_toolchain.compiler)
  compile_cmd.add(haskell_toolchain.compiler_flags)

  objDir = ctx.actions.declare_output("obj", dir = True)
  hiDir = ctx.actions.declare_output("hi", dir = True)
  stubDir = ctx.actions.declare_output("stub", dir = True)

  ghcOptions = GhcOptions(
    inputFiles = ctx.attrs.inputFiles,
    inputModules = ctx.attrs.inputModules,

    sourcePath = ctx.attrs.sourcePath,
    
    language = ctx.attrs.language,
    extensions = ctx.attrs.extensions,

    hiDir = hiDir.as_output(),
    hieDir = hiDir.as_output(),
    objDir = objDir.as_output(),
    stubDir = stubDir.as_output(),

    cppIncludes = ctx.attrs.cppIncludes,
  )

  compile_cmd.add(render_ghc_options(ghcOptions))

  ctx.actions.run(
      compile_cmd,
      category = "haskell_compile",
      identifier = ctx.attrs.name,
  )

  return [
    DefaultInfo(
      default_output = objDir,
      other_outputs = [hiDir, stubDir],
    ),
  ]

library = rule(
  impl = _library_impl,
  attrs = {
    "_haskell_toolchain": toolchains_common.haskell(),
    "sourcePath": attrs.list(attrs.source(allow_directory = True)),
    "language": attrs.option(attrs.string()),
    "extensions": attrs.list(attrs.string(), default = []),
    "inputFiles": attrs.list(attrs.source(), default = []),
    "inputModules": attrs.list(attrs.string(), default = []),
    "cppIncludes": attrs.list(attrs.source(), default = [])
  },
)
