{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE ImportQualifiedPost #-}
{-# OPTIONS_GHC -Wall #-}

import Data.ByteString.Lazy qualified as LBS
import Data.Map qualified as Map
import Distribution.Backpack
import Distribution.Compat.Prelude (maybeToList, unless)
import Distribution.PackageDescription
import Distribution.Pretty
import Distribution.Simple (defaultMainWithHooks, simpleUserHooks)
import Distribution.Simple.Build.Inputs
import Distribution.Simple.Compiler (Compiler (..), CompilerFlavor (..), compilerFlavor)
import Distribution.Simple.Configure (findDistPrefOrDefault)
import Distribution.Simple.GHC qualified as GHC
import Distribution.Simple.Program.GHC qualified as GHC
import Distribution.Simple.Setup (ConfigFlags (..))
import Distribution.Simple.UserHooks (Args, UserHooks (..))
import Distribution.Simple.Utils (cabalVersion)
import Distribution.Text
import Distribution.Types.Component
import Distribution.Types.ComponentLocalBuildInfo
import Distribution.Types.LocalBuildConfig qualified as LBC
import Distribution.Types.LocalBuildInfo qualified as LBI
import Distribution.Utils.Json
import Distribution.Verbosity
import System.FilePath

main :: IO ()
main = defaultMainWithHooks simpleUserHooks{postConf = postConf'}

-- TODO: try to load the setup-config instead. In this way we can make many smaller utilities.
-- See Distribution.Simple.Configure.getConfigStateFile

postConf' :: Args -> ConfigFlags -> PackageDescription -> LocalBuildInfo -> IO ()
postConf' _args flags pkg_descr lbi = do
    let flavor = compilerFlavor $ LBC.compiler $ LBC.packageBuildDescr $ localBuildDescr lbi
    unless (flavor == GHC) $
        error $
            "compiler flavor " ++ display flavor ++ " not supported"

    distPref <- findDistPrefOrDefault (configDistPref flags)
    -- pkg_descr or localPkgDescr? In simple setups it does not matter.
    let activeTargets = LBI.allTargetsInBuildOrder' pkg_descr lbi

    -- let graph = LBC.componentGraph $ LBC.componentBuildDescr $ localBuildDescr lbi

    let buildInfoFields =
            [ "cabal-lib-version" .= displayJ cabalVersion
            , "compiler-id" .= displayJ (compilerId (compiler lbi))
            , "components" .= JsonArray (map (mkComponentInfo lbi) activeTargets)
            ]

    LBS.writeFile (distPref </> "local-build-info.json") $ renderJson (JsonObject buildInfoFields)

-- NOTE: From here on is all serivalisation code that could live in a separate module.

mkComponentInfo :: LocalBuildInfo -> TargetInfo -> Json
mkComponentInfo lbi TargetInfo{targetCLBI = clbi, targetComponent = comp} =
    JsonObject $
        [ "name" .= displayJ name
        , "type" .= JsonString (componentType clbi)
        , "component-id" .= JsonString (display $ componentComponentId clbi)
        , "unit-id" .= JsonString (display (componentUnitId clbi))
        , -- NOTE: componentIncludes is the set of packages that are brought into scope during compilation, including a
          -- ModuleRenaming which may used to hide or rename modules. This is what gets translated into -package-id
          -- arguments. This is a modernized version of componentPackageDeps, which is kept around for backward
          -- compatibility.
          "includes" .= JsonArray (map (uncurry mkDepend) (componentIncludes clbi))
        , "compiler-args" .= JsonArray (map JsonString (compilerArgs lbi (componentBuildInfo comp) clbi))
        , "modules" .= JsonArray (map displayJ modules)
        , "src-files" .= JsonArray (map JsonString sourceFiles)
        , "hs-src-dirs" .= JsonArray (map displayJ $ hsSourceDirs (componentBuildInfo comp))
        ]
            <> cabalFile
  where
    name = componentLocalName clbi
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
    cabalFile = maybeToList $ (\fp -> ("cabal-file", JsonString fp)) <$> LBC.pkgDescrFile (LBC.packageBuildDescr $ localBuildDescr lbi)

mkDepend :: OpenUnitId -> ModuleRenaming -> Json
mkDepend (DefiniteUnitId uid) modr = JsonObject $ ["unit-id" .= displayJ uid] <> mkRenaming modr
mkDepend (IndefFullUnitId cid subst) modr = JsonObject $ ["component-id" .= displayJ cid] <> mkOpenModuleSubst subst <> mkRenaming modr

mkOpenModuleSubst :: OpenModuleSubst -> [(String, Json)]
mkOpenModuleSubst subst =
    ["substitions" .= JsonArray [JsonObject ["from" .= displayJ a, "to" .= displayJ b] | (a, b) <- Map.toList subst]]

mkRenaming :: ModuleRenaming -> [(String, Json)]
mkRenaming DefaultRenaming = []
mkRenaming (ModuleRenaming renamings) =
    ["renaming" .= JsonArray [JsonObject ["from" .= displayJ a, "to" .= displayJ b] | (a, b) <- renamings]]
mkRenaming (HidingRenaming hidden) =
    ["hiding" .= JsonArray (map displayJ hidden)]

componentType :: ComponentLocalBuildInfo -> String
componentType (LibComponentLocalBuildInfo{}) = "lib"
componentType (FLibComponentLocalBuildInfo{}) = "flib"
componentType (ExeComponentLocalBuildInfo{}) = "exe"
componentType (TestComponentLocalBuildInfo{}) = "test"
componentType (BenchComponentLocalBuildInfo{}) = "bench"

compilerArgs :: LocalBuildInfo -> BuildInfo -> ComponentLocalBuildInfo -> [String]
compilerArgs lbi bi clbi
    | compilerFlavor (LBC.compiler $ LBC.packageBuildDescr $ localBuildDescr lbi) == GHC =
        GHC.renderGhcOptions (compiler lbi) (hostPlatform lbi) baseOpts
    | otherwise =
        []
  where
    baseOpts = GHC.componentGhcOptions normal lbi bi clbi (LBI.buildDir lbi)

displayJ :: (Pretty a) => a -> Json
displayJ = JsonString . display
