
DebugInfoLevel = enum("None", "Minimal", "Normal", "Maximal")
GhcDynLinkMode = enum("StaticOnly", "DynamicOnly", "StaticAndDynamic")
GhcMode = enum("compile", "link", "make")
GhcOptimisation = enum("NoOptimisation", "NormalOptimisation", "MaximumOptimisation")
GhcProfAuto = enum("All", "Toplevel", "Exported", "Late")

ModuleName = str
PackageDb = str
ComponentId = str
OpenModule = str
OpenUnitId = str
ModuleRenaming = None


GhcOptions = record(
  mode                   = field(GhcMode | None, default = None),
  extra                  = field(list[str], default = []),
  extraDefault           = field(list[str], default = []),
  inputFiles             = field(list[Artifact], default = []),
  inputScripts           = field(list[Artifact], default = []),
  inputModules           = field(list[ModuleName], default = []),
  outputFile             = field(typing.Any | None, default = None),
  outputDynFile          = field(typing.Any | None, default = None),
  sourcePathClear        = field(bool, default=False),
  sourcePath             = field(list[Artifact]),
  thisUnitId             = field(str | None, default = None),
  thisComponentId        = field(ComponentId | None, default = None),
  instantiatedWith       = field(list[(ModuleName, OpenModule)], default = []),
  noCode                 = field(bool, default=False),
  packageDBs             = field(list[PackageDb], default = []),
  packages               = field(list[(OpenUnitId, ModuleRenaming)], default = []),
  hideAllPackages        = field(bool, default=False),
  warnMissingHomeModules = field(bool, default=False),
  noAutoLinkPackages     = field(bool, default=False),
  linkLibs               = field(list[Artifact], default = []),
  linkLibPath            = field(list[Artifact], default = []),
  linkOptions            = field(list[str], default = []),
  linkFrameworks         = field(list[str], default = []),
  linkFrameworkDirs      = field(list[Artifact], default = []),
  linkRts                = field(bool, default=False),
  noLink                 = field(bool, default=False),
  linkNoHsMain           = field(bool, default=False),
  linkModDefFiles        = field(list[Artifact], default = []),
  ccOptions              = field(list[str], default = []),
  cxxOptions             = field(list[str], default = []),
  asmOptions             = field(list[str], default = []),
  cppOptions             = field(list[str], default = []),
  cppIncludePath         = field(list[Artifact], default = []),
  cppIncludes            = field(list[Artifact], default = []),
  ffiIncludes            = field(list[Artifact], default = []),
  ccProgram              = field(Artifact | None, default = None),
  language               = field(str | None, default = None),
  extensions             = field(list[str], default = []),
  # extensionMap           = field(dict[str, CompilerFlag | None]),
  optimisation           = field(GhcOptimisation | None, default = None),
  debugInfo              = field(DebugInfoLevel | None, default = None),
  profilingMode          = field(bool, default=False),
  profilingAuto          = field(GhcProfAuto | None, default = None),
  splitSections          = field(bool, default=False),
  splitObjs              = field(bool, default=False),
  hpcDir                 = field(str | None, default = None),
  ghciScripts            = field(list[Artifact], default = []),
  hiSuffix               = field(str | None, default = None),
  objSuffix              = field(str | None, default = None),
  dynHiSuffix            = field(str | None, default = None),
  dynObjSuffix           = field(str | None, default = None),

  hiDir                  = field(typing.Any | None, default = None),
  hieDir                 = field(typing.Any | None, default = None),
  objDir                 = field(typing.Any | None, default = None),
  outputDir              = field(typing.Any | None, default = None),
  stubDir                = field(typing.Any | None, default = None),

  dynLinkMode            = field(GhcDynLinkMode | None, default = None),
  staticLib              = field(bool, default=False),
  shared                 = field(bool, default=False),
  fpic                   = field(bool, default=False),
  dylibName              = field(str | None, default = None),
  rpaths                 = field(list[Artifact], default = []),
  # verbosity              = field(Verbosity | None, default = None),
  extraPath              = field(list[Artifact], default = []),
)

def render_ghc_options(options : GhcOptions) -> cmd_args:
  args = cmd_args()

  if options.mode == "compile":
    args.add("-c")
  elif options.mode == "make":
    args.add("--make")

  args.add(options.extraDefault)

  if options.noLink:
    args.add("-no-link")

  if options.optimisation == "NoOptimisation":
    args.add("-O0")
  elif options.optimisation == "NormalOptimisation":
    args.add("-O")
  elif options.optimisation == "MaximumOptimisation":
    args.add("-O2")

  if options.debugInfo == "Minimal":
    args.add("-g1")
  elif options.debugInfo == "Normal":
    args.add("-g2")
  elif options.debugInfo == "Maximal":
    args.add("-g3")

  if options.profilingMode:
    args.add("-prof")

  if options.splitSections:
    args.add("-split-sections")

  if options.splitObjs:
    args.add("-split-objs")

  if options.hpcDir != None:
    args.add(cmd_args(options.hpcDir, format = "-hpcdir {}"))

  if options.staticLib:
    args.add("-staticlib")

  if options.shared:
    args.add("-shared")

  if options.dynLinkMode == "StaticOnly":
    args.add("-static")
  elif options.dynLinkMode == "DynamicOnly":
    args.add("-dynamic")
  elif options.dynLinkMode == "StaticAndDynamic":
    args.add("-static", "-dynamic-too")

  if options.fpic:
    args.add("-fPIC")

  if options.dylibName != None:
    args.add("-dylib-install-name {}", options.dylibName)

  # Redirecting outputs

  if options.objSuffix != None:
    args.add("-osuf", options.objSuffix)

  if options.hiSuffix != None:
    args.add("-hisuf", options.hiSuffix)

  if options.dynObjSuffix != None:
    args.add("-dynosuf", options.dynObjSuffix)

  if options.dynHiSuffix != None:
    args.add("-dynhisuf", options.dynHiSuffix)

  if options.outputDir != None:
    args.add("-outputdir", options.outputDir)

  if options.objDir != None:
    args.add("-odir", options.objDir)

  if options.hiDir != None:
    args.add("-hidir", options.hiDir)

  if options.hieDir != None:
    args.add("-hiedir", options.hieDir)

  if options.stubDir != None:
    args.add("-stubdir", options.stubDir)

  # Source search path

  if options.sourcePathClear:
    args.add("-i")

  args.add(cmd_args(options.sourcePath, format = "-i{}"))

  # CPP, C, and C++ stuff
  
  args.add(cmd_args(options.cppIncludePath, format = "-I{}"))
  args.add(cmd_args(options.cppOptions, format = "-optP{}"))

  if options.cppIncludes:
    args.add("-optP-include", cmd_args(options.cppIncludes, format = "-optP{}"))

  args.add(cmd_args(options.ccOptions, format = "-optc{}"))
  args.add(cmd_args(options.cxxOptions, format = "-optcxx{}"))
  args.add(cmd_args(options.asmOptions, format = "-opta{}"))

  if options.ccProgram != None:
    args.add(cmd_args(options.ccProgram, format = "-pgmc {}"))

  # Linker stuff
  
  args.add(cmd_args(options.linkOptions, format = "-optl{}"))
  args.add(cmd_args(options.linkLibs, format = "-l{}"))
  args.add(cmd_args(options.linkLibPath, format = "-L{}"))

  if options.linkNoHsMain:
    args.add("-no-hs-main")

  if options.rpaths != []:
    args.add("-dynload", "deploy")
  args.add(cmd_args(options.rpaths, format = "-optl-Wl,-rpath,{}"))

  if options.linkRts:
    args.add("-rtsopts")

  args.add(options.linkModDefFiles)

  # Packages
  
  if options.thisUnitId != None:
    args.add(cmd_args(options.thisUnitId, format = "-this-unit {}"))

  if options.thisComponentId != None:
    args.add(cmd_args(options.thisComponentId, format = "-this-component-id {}"))

  for k, v in options.instantiatedWith:
    args.add("-instantiated-with", cmd_args(k, v, delimiter = "="))

  if options.noCode:
    args.add("-fno-code", "-fwrite-interface")

  if options.hideAllPackages:
    args.add("-hide-all-packages")

  if options.warnMissingHomeModules:
    args.add("-Wmissing-home-modules")

  if options.noAutoLinkPackages:
    args.add("-no-auto-link-packages")

  for ipkgid, rns in options.packages:
    args.add("-package-id", cmd_args(ipkgid, rns))

  # Language and extensions

  args.add(cmd_args(options.language, format = "-X{}"))
  args.add(cmd_args(options.extensions, format = "-X{}"))

  # GHCi
  # cmd_args(options.ghciScripts, format = "-ghci-script {}")

  # Inputs

  args.add(options.inputFiles)

  for initScript in options.inputScripts:
    args.add("-x", initScript)

  args.add(options.inputModules)

  if options.outputFile != None:
    args.add("-o", options.outputFile)

  if options.outputDynFile != None:
    args.add("-dyno", options.outputDynFile)

  args.add(options.extra)

  return args
