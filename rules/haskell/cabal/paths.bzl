load("//rules/haskell/cabal_install/common.bzl", "manglePkgName")

template = """
{{-# OPTIONS_GHC -w #-}}
module Paths_{name}
 ( version
 , getBinDir
 , getLibDir
 , getDynLibDir
 , getDataDir
 , getLibexecDir
 , getSysconfDir
 , getDataFileName
 ) where

import Data.Version (Version)
import Control.Exception (IOException, catch)
import System.Environment (getEnv)

version :: Version
version = read "{version}"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath

catchIO :: IO a -> (IOException -> IO a) -> IO a
catchIO = catch

getBinDir     = catchIO (getEnv "{name}_bindir")     (const $ return "{bindir}")
getLibDir     = catchIO (getEnv "{name}_libdir")     (const $ return "{libdir}")
getDynLibDir  = catchIO (getEnv "{name}_dynlibdir")  (const $ return "{dynlibdir}")
getDataDir    = catchIO (getEnv "{name}_datadir")    (const $ return "{datadir}")
getLibexecDir = catchIO (getEnv "{name}_libexecdir") (const $ return "{libexecdir}")
getSysconfDir = catchIO (getEnv "{name}_sysconfdir") (const $ return "{sysconfdir}")

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return $ dir ++ "/" ++ name
"""

PathsModuleCtx = record(
    package_name = str,
    package_version = str,
    bindir = str,
    libdir = str,
    dynlibdir = str,
    datadir = str,
    libexecdir = str,
    sysconfdir = str,
)

def mk_paths_module(module_ctx: PathsModuleCtx) -> str:
    return template.format(
        name = manglePkgName(module_ctx.package_name),
        version = module_ctx.package_version,
        bindir = module_ctx.bindir,
        libdir = module_ctx.libdir,
        dynlibdir = module_ctx.dynlibdir,
        datadir = module_ctx.datadir,
        libexecdir = module_ctx.libexecdir,
        sysconfdir = module_ctx.sysconfdir,
    ).lstrip()

def _cabal_paths_module_impl(ctx: AnalysisContext) -> list[Provider]:
    s = mk_paths_module(PathsModuleCtx(
        package_name = ctx.attrs.package_name,
        package_version = ctx.attrs.package_version,
        bindir = ctx.attrs.bindir,
        libdir = ctx.attrs.libdir,
        dynlibdir = ctx.attrs.dynlibdir,
        datadir = ctx.attrs.datadir,
        libexecdir = ctx.attrs.libexecdir,
        sysconfdir = ctx.attrs.sysconfdir,
    ))
    out = ctx.actions.write("Paths_{}.hs".format(manglePkgName(ctx.attrs.package_name)), s)
    return [DefaultInfo(default_output = out)]

cabal_paths_module = rule(
    impl = _cabal_paths_module_impl,
    attrs = {
        "package_name": attrs.string(),
        "package_version": attrs.string(),
        "bindir": attrs.string(),
        "libdir": attrs.string(),
        "dynlibdir": attrs.string(),
        "datadir": attrs.string(),
        "libexecdir": attrs.string(),
        "sysconfdir": attrs.string(),
    },
)
