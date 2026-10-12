{-# LANGUAGE LambdaCase #-}
{-# OPTIONS_GHC -Wall #-}

-- | Print a package description as JSON, resolved for one configuration.
--
-- > describe_package PKG.cabal|DIR [--ghc-version 9.12.2] [--platform x86_64-linux] [--flags '+a -b']
--
-- The conditionals of the package description are resolved, as Cabal's
-- configure step does, for the given compiler, platform and flags (the
-- defaults of the package for the flags it is not given), and the common
-- stanzas are inlined. What comes out is the package's fields and one object
-- for each of its components, keyed by the names of the fields in a .cabal
-- file. Only fields that are not empty are printed.
--
-- Dependencies are not checked against anything: a flag is resolved as if
-- every dependency were available.
module Main (main) where

import Data.ByteString qualified as BS
import Data.ByteString.Lazy qualified as LBS
import Data.List (isSuffixOf)
import Data.List.NonEmpty qualified as NE
import Data.Maybe (catMaybes)
import Distribution.CabalSpecVersion (showCabalSpecVersion)
import Distribution.Compat.NonEmptySet qualified as NES
import Distribution.Compiler (AbiTag (..), CompilerFlavor (..), CompilerId (..), PerCompilerFlavor (..), unknownCompilerInfo)
import Distribution.ModuleName (ModuleName)
import Distribution.PackageDescription
import Distribution.PackageDescription.Configuration (finalizePD)
import Distribution.Fields (showPError)
import Distribution.PackageDescription.Parsec (parseGenericPackageDescription, runParseResult)
import Distribution.Parsec (eitherParsec, explicitEitherParsec)
import Distribution.Pretty (prettyShow)
import Distribution.System (Platform (..), buildPlatform)
import Distribution.Types.ComponentRequestedSpec (ComponentRequestedSpec (..))
import Distribution.Utils.Json (Json (..), renderJson, (.=))
import Distribution.Utils.Path (getSymbolicPath)
import Distribution.Utils.ShortText (fromShortText)
import Distribution.Version (Version)
import System.Directory (doesDirectoryExist, listDirectory)
import System.Environment (getArgs)
import System.Exit (die)
import System.FilePath ((</>))
import System.IO (hPutStrLn, stderr)

data Options = Options
    { optInput :: FilePath
    , optGhcVersion :: String
    , optPlatform :: Maybe String
    , optFlags :: String
    }

parseArgs :: [String] -> Either String Options
parseArgs = go (Options "" "9.12.2" Nothing "")
  where
    go o [] | null (optInput o) = Left "no .cabal file or directory given"
            | otherwise = Right o
    go o ("--ghc-version" : v : rest) = go o{optGhcVersion = v} rest
    go o ("--platform" : p : rest) = go o{optPlatform = Just p} rest
    go o ("--flags" : f : rest) = go o{optFlags = f} rest
    go o (a : rest) | null (optInput o) = go o{optInput = a} rest
    go _ (a : _) = Left ("unexpected argument: " ++ a)

main :: IO ()
main = do
    opts <- either (die . ("describe_package: " ++)) pure . parseArgs =<< getArgs
    file <- findCabalFile (optInput opts)
    contents <- BS.readFile file
    let (warnings, result) = runParseResult (parseGenericPackageDescription contents)
    mapM_ (hPutStrLn stderr . show) warnings
    gpd <- case result of
        Left (_, errors) -> die (unlines (map (showPError file) (NE.toList errors)))
        Right gpd -> pure gpd

    version <- either die pure (eitherParsec (optGhcVersion opts))
    platform <- maybe (pure buildPlatform) (either die pure . eitherParsec) (optPlatform opts)
    flags <- either die pure (explicitEitherParsec parsecFlagAssignment (optFlags opts))

    let compiler = unknownCompilerInfo (CompilerId GHC version) NoAbiTag
        requested = ComponentRequestedSpec{testsRequested = True, benchmarksRequested = True}
    (pd, resolved) <- case finalizePD flags requested (const True) platform compiler [] gpd of
        Left missing -> die ("describe_package: cannot resolve the conditionals, missing " ++ unwords (map prettyShow missing))
        Right r -> pure r

    LBS.putStr (renderJson (describe platform version resolved pd))
    putStrLn ""

findCabalFile :: FilePath -> IO FilePath
findCabalFile path = do
    isDir <- doesDirectoryExist path
    if not isDir
        then pure path
        else do
            files <- filter (".cabal" `isSuffixOf`) <$> listDirectory path
            case files of
                [f] -> pure (path </> f)
                [] -> die ("describe_package: no .cabal file in " ++ path)
                _ -> die ("describe_package: more than one .cabal file in " ++ path)

describe :: Platform -> Version -> FlagAssignment -> PackageDescription -> Json
describe platform version flags pd =
    JsonObject $
        [ "ghc-version" .= JsonString (prettyShow version)
        , "platform" .= JsonString (prettyShow platform)
        , "flags" .= JsonObject [(unFlagName n, JsonBool v) | (n, v) <- unFlagAssignment flags]
        ]
            ++ catMaybes
                [ str "cabal-version" (showCabalSpecVersion (specVersion pd))
                , str "name" (unPackageName (pkgName (package pd)))
                , str "version" (prettyShow (pkgVersion (package pd)))
                , str "build-type" (prettyShow (buildType pd))
                , -- As written: an SPDX expression, or a name of the old kind (BSD3)
                  str "license" (either prettyShow prettyShow (licenseRaw pd))
                , strs "license-files" (map getSymbolicPath (licenseFiles pd))
                , str "copyright" (fromShortText (copyright pd))
                , str "maintainer" (fromShortText (maintainer pd))
                , str "author" (fromShortText (author pd))
                , str "stability" (fromShortText (stability pd))
                , str "homepage" (fromShortText (homepage pd))
                , str "package-url" (fromShortText (pkgUrl pd))
                , str "bug-reports" (fromShortText (bugReports pd))
                , str "synopsis" (fromShortText (synopsis pd))
                , str "category" (fromShortText (category pd))
                , str "data-dir" (getSymbolicPath (dataDir pd))
                , strs "data-files" (map getSymbolicPath (dataFiles pd))
                , strs "extra-source-files" (map getSymbolicPath (extraSrcFiles pd))
                , strs "extra-doc-files" (map getSymbolicPath (extraDocFiles pd))
                ]
            ++ [ "components"
                    .= JsonArray
                        ( map libraryComponent (maybe [] pure (library pd) ++ subLibraries pd)
                            ++ map executable (executables pd)
                            ++ map testSuite (testSuites pd)
                            ++ map benchmark (benchmarks pd)
                            ++ map foreignLib (foreignLibs pd)
                        )
               ]
  where
    pkgname = pkgName (package pd)

    libraryComponent lib =
        component
            "lib"
            (case libName lib of LMainLibName -> Nothing; LSubLibName n -> Just (unUnqualComponentName n))
            (libBuildInfo lib)
            ( catMaybes
                [ modules "exposed-modules" (exposedModules lib)
                , strs "reexported-modules" (map reexport (reexportedModules lib))
                , modules "signatures" (signatures lib)
                , case libVisibility lib of
                    LibraryVisibilityPrivate | libName lib /= LMainLibName -> Nothing
                    LibraryVisibilityPublic | libName lib == LMainLibName -> Nothing
                    v -> str "visibility" (prettyShow v)
                ]
            )

    executable exe =
        component "exe" (Just (unUnqualComponentName (exeName exe))) (buildInfo exe)
            (catMaybes [str "main-is" (getSymbolicPath (modulePath exe))])

    testSuite t =
        component "test" (Just (unUnqualComponentName (testName t))) (testBuildInfo t) $
            case testInterface t of
                TestSuiteExeV10 v path -> catMaybes [str "type" ("exitcode-stdio-" ++ prettyShow v), str "main-is" (getSymbolicPath path)]
                TestSuiteLibV09 v m -> catMaybes [str "type" ("detailed-" ++ prettyShow v), str "test-module" (prettyShow m)]
                TestSuiteUnsupported tt -> catMaybes [str "type" (prettyShow tt)]

    benchmark b =
        component "bench" (Just (unUnqualComponentName (benchmarkName b))) (benchmarkBuildInfo b) $
            case benchmarkInterface b of
                BenchmarkExeV10 v path -> catMaybes [str "type" ("exitcode-stdio-" ++ prettyShow v), str "main-is" (getSymbolicPath path)]
                BenchmarkUnsupported bt -> catMaybes [str "type" (prettyShow bt)]

    foreignLib f =
        component "flib" (Just (unUnqualComponentName (foreignLibName f))) (foreignLibBuildInfo f) []

    reexport (ModuleReexport mpkg orig new) =
        maybe "" (\p -> prettyShow p ++ ":") mpkg
            ++ prettyShow orig
            ++ (if orig == new then "" else " as " ++ prettyShow new)

    component :: String -> Maybe String -> BuildInfo -> [(String, Json)] -> Json
    component kind name bi specific =
        JsonObject $
            [ "kind" .= JsonString kind
            , "name" .= maybe JsonNull JsonString name
            , "buildable" .= JsonBool (buildable bi)
            ]
                ++ specific
                ++ buildInfoFields bi

    buildInfoFields bi =
        let PerCompilerFlavor ghcOpts _ = options bi
            PerCompilerFlavor ghcProf _ = profOptions bi
            PerCompilerFlavor ghcShared _ = sharedOptions bi
         in catMaybes
                [ strs "hs-source-dirs" (map getSymbolicPath (hsSourceDirs bi))
                , modules "other-modules" (otherModules bi)
                , modules "autogen-modules" (autogenModules bi)
                , str "default-language" (maybe "" prettyShow (defaultLanguage bi))
                , strs "other-languages" (map prettyShow (otherLanguages bi))
                , strs "default-extensions" (map prettyShow (defaultExtensions bi))
                , strs "other-extensions" (map prettyShow (otherExtensions bi))
                , arr "build-depends" (map dependency (targetBuildDepends bi))
                , arr "build-tool-depends" (map exeDependency (buildToolDepends bi))
                , strs "build-tools" (map prettyShow (buildTools bi))
                , strs "ghc-options" ghcOpts
                , strs "ghc-prof-options" ghcProf
                , strs "ghc-shared-options" ghcShared
                , strs "cpp-options" (cppOptions bi)
                , strs "cc-options" (ccOptions bi)
                , strs "cxx-options" (cxxOptions bi)
                , strs "asm-options" (asmOptions bi)
                , strs "cmm-options" (cmmOptions bi)
                , strs "ld-options" (ldOptions bi)
                , strs "hsc2hs-options" (hsc2hsOptions bi)
                , strs "c-sources" (map getSymbolicPath (cSources bi))
                , strs "cxx-sources" (map getSymbolicPath (cxxSources bi))
                , strs "asm-sources" (map getSymbolicPath (asmSources bi))
                , strs "cmm-sources" (map getSymbolicPath (cmmSources bi))
                , strs "js-sources" (map getSymbolicPath (jsSources bi))
                , strs "include-dirs" (map getSymbolicPath (includeDirs bi))
                , strs "includes" (map getSymbolicPath (includes bi))
                , strs "install-includes" (map getSymbolicPath (installIncludes bi))
                , strs "autogen-includes" (map getSymbolicPath (autogenIncludes bi))
                , strs "extra-libraries" (extraLibs bi)
                , strs "extra-lib-dirs" (map getSymbolicPath (extraLibDirs bi))
                , strs "extra-ghci-libraries" (extraGHCiLibs bi)
                , strs "extra-bundled-libraries" (extraBundledLibs bi)
                , strs "frameworks" (map getSymbolicPath (frameworks bi))
                , strs "extra-framework-dirs" (map getSymbolicPath (extraFrameworkDirs bi))
                , strs "pkgconfig-depends" (map prettyShow (pkgconfigDepends bi))
                , strs "mixins" (map prettyShow (mixins bi))
                ]

    -- A dependency on the package itself is one on another of its libraries.
    dependency d =
        JsonObject
            [ "package" .= JsonString (unPackageName (depPkgName d))
            , "internal" .= JsonBool (depPkgName d == pkgname)
            , "libraries" .= JsonArray [JsonString (libraryName l) | l <- NES.toList (depLibraries d)]
            , "version" .= JsonString (prettyShow (depVerRange d))
            ]

    exeDependency (ExeDependency p e range) =
        JsonObject
            [ "package" .= JsonString (unPackageName p)
            , "internal" .= JsonBool (p == pkgname)
            , "executable" .= JsonString (unUnqualComponentName e)
            , "version" .= JsonString (prettyShow range)
            ]

    libraryName = \case
        LMainLibName -> "lib"
        LSubLibName n -> unUnqualComponentName n


str :: String -> String -> Maybe (String, Json)
str _ "" = Nothing
str k v = Just (k .= JsonString v)

strs :: String -> [String] -> Maybe (String, Json)
strs _ [] = Nothing
strs k vs = Just (k .= JsonArray (map JsonString vs))

arr :: String -> [Json] -> Maybe (String, Json)
arr _ [] = Nothing
arr k vs = Just (k .= JsonArray vs)

modules :: String -> [ModuleName] -> Maybe (String, Json)
modules k = strs k . map prettyShow

