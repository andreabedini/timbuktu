s = """
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

import Data.Version (Version, mkVersion)
import Control.Exception (catch)
import System.Environment (getEnv)

version :: Version
version = read "{version}"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath

getBinDir     = catch (getEnv "{name}_bindir")     (const $ return "{bindir}")
getLibDir     = catch (getEnv "{name}_libdir")     (const $ return "{libdir}")
getDynLibDir  = catch (getEnv "{name}_dynlibdir")  (const $ return "{dynlibdir}")
getDataDir    = catch (getEnv "{name}_datadir")    (const $ return "{datadir}")
getLibexecDir = catch (getEnv "{name}_libexecdir") (const $ return "{libexecdir}")
getSysconfDir = catch (getEnv "{name}_sysconfdir") (const $ return "{sysconfdir}")

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return $ dir ++ "/" ++ name
"""

def _cabal_paths_module_impl(ctx: AnalysisContext) -> list[Provider]:
    name = ctx.attrs.package_name.replace("-", "-")
    out = ctx.actions.write("Paths_{}.hs".format(name), s.format(
        name = name,
        version = ctx.attrs.package_version,
        bindir = ctx.attrs.bindir,
        libdir = ctx.attrs.libdir,
        dynlibdir = ctx.attrs.dynlibdir,
        datadir = ctx.attrs.datadir,
        libexecdir = ctx.attrs.libexecdir,
        sysconfdir = ctx.attrs.sysconfdir,
    ).lstrip())
    return [
        DefaultInfo(default_output = out),
    ]

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
