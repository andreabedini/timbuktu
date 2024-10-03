{-# OPTIONS_GHC -Wall #-}

import Data.ByteString.Lazy qualified as LBS
import Data.Foldable (for_)
import Data.Maybe (fromMaybe)
import Distribution.Compiler
import Distribution.PackageDescription
import Distribution.Pretty
import Distribution.Simple (defaultMainWithHooks, simpleUserHooks)
import Distribution.Simple.Compiler (Compiler, compilerFlavor, showCompilerId)
import Distribution.Simple.GHC qualified as GHC
import Distribution.Simple.Program
import Distribution.Simple.Program.Builtin (haskellSuiteProgram)
import Distribution.Simple.Program.GHC qualified as GHC
import Distribution.Simple.Setup (BuildFlags, ConfigFlags (..))
import Distribution.Simple.UserHooks (Args, UserHooks (..))
import Distribution.Simple.Utils (cabalVersion)
import Distribution.Text
import Distribution.Types.Component
import Distribution.Types.ComponentLocalBuildInfo
import Distribution.Types.LocalBuildInfo
import Distribution.Types.TargetInfo
import Distribution.Utils.Json
import Distribution.Verbosity
import Distribution.Verbosity qualified as Verbosity
import System.Directory (getCurrentDirectory)
import System.FilePath (addTrailingPathSeparator)

main :: IO ()
main = defaultMainWithHooks simpleUserHooks {postConf = postConf'}

-- TODO: try to load the setup-config instead. In this way we can make many smaller utilities.
-- See Distribution.Simple.Configure.getConfigStateFile

postConf' :: Args -> ConfigFlags -> PackageDescription -> LocalBuildInfo -> IO ()
postConf' _args _flags pkg_descr lbi = do
  -- pkg_descr or localPkgDescr? In simple setups it does not matter.
  let activeTargets = allTargetsInBuildOrder' pkg_descr lbi

  (compilerProg, _) <-
    let program = flavorToProgram (compilerFlavor (compiler lbi))
     in requireProgram Verbosity.silent program (withPrograms lbi)

  wdir <- getCurrentDirectory

  let buildInfoFields =
        [ "cabal-lib-version" .= JsonString (display cabalVersion),
          "compiler" .= mkCompilerInfo compilerProg (compiler lbi),
          "components" .= JsonArray componentInfos
        ]

      componentInfos = map (mkComponentInfo wdir pkg_descr lbi . targetCLBI) activeTargets

  let json = JsonObject buildInfoFields

  LBS.writeFile "buildinfo.json" $ renderJson json

-- Given the flavor of the compiler, try to find out which program we need.
flavorToProgram :: CompilerFlavor -> Program
flavorToProgram GHC = ghcProgram
flavorToProgram GHCJS = ghcjsProgram
flavorToProgram UHC = uhcProgram
flavorToProgram JHC = jhcProgram
flavorToProgram HaskellSuite {} = haskellSuiteProgram
flavorToProgram cf = error $ "flavorToProgram: unsupported compiler flavor: " ++ show cf

mkCompilerInfo :: ConfiguredProgram -> Compiler -> Json
mkCompilerInfo compilerProgram compilerInfo =
  JsonObject
    [ "flavour" .= JsonString (prettyShow $ compilerFlavor compilerInfo),
      "compiler-id" .= JsonString (showCompilerId compilerInfo),
      "path" .= JsonString (programPath compilerProgram)
    ]

mkComponentInfo :: FilePath -> PackageDescription -> LocalBuildInfo -> ComponentLocalBuildInfo -> Json
mkComponentInfo wdir pkg_descr lbi clbi =
  JsonObject $
    [ "type" .= JsonString compType,
      "name" .= JsonString (prettyShow name),
      "unit-id" .= JsonString (prettyShow $ componentUnitId clbi),
      "compiler-args" .= JsonArray (map JsonString compilerArgs),
      "modules" .= JsonArray (map (JsonString . display) modules),
      "src-files" .= JsonArray (map JsonString sourceFiles),
      "hs-src-dirs" .= JsonArray (map (JsonString . prettyShow) $ hsSourceDirs bi),
      "src-dir" .= JsonString (addTrailingPathSeparator wdir)
    ]
      <> cabalFile
  where
    compilerArgs = GHC.renderGhcOptions (compiler lbi) (hostPlatform lbi) baseOpts
    baseOpts = GHC.componentGhcOptions normal lbi bi clbi (buildDir lbi)
    name = componentLocalName clbi
    bi = componentBuildInfo comp
    -- If this error happens, a cabal invariant has been violated
    comp = fromMaybe (error $ "mkBuildInfo: no component " ++ prettyShow name) $ lookupComponent pkg_descr name
    compType = case comp of
      CLib _ -> "lib"
      CExe _ -> "exe"
      CTest _ -> "test"
      CBench _ -> "bench"
      CFLib _ -> "flib"
    modules = case comp of
      CLib lib -> explicitLibModules lib
      CExe exe -> exeModules exe
      CTest test ->
        case testInterface test of
          TestSuiteExeV10 _ _ -> []
          TestSuiteLibV09 _ modName -> [modName]
          TestSuiteUnsupported _ -> []
      CBench bench -> benchmarkModules bench
      CFLib flib -> foreignLibModules flib
    sourceFiles = case comp of
      CLib _ -> []
      CExe exe -> [modulePath exe]
      CTest test ->
        case testInterface test of
          TestSuiteExeV10 _ fp -> [fp]
          TestSuiteLibV09 _ _ -> []
          TestSuiteUnsupported _ -> []
      CBench bench -> case benchmarkInterface bench of
        BenchmarkExeV10 _ fp -> [fp]
        BenchmarkUnsupported _ -> []
      CFLib _ -> []
    cabalFile
      | Just fp <- pkgDescrFile lbi = [("cabal-file", JsonString fp)]
      | otherwise = []
