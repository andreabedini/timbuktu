{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
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
-- Every field the Cabal this program is built with knows is printed, or is
-- in 'folded' or 'otherCompilers': when a new version of Cabal has a field
-- that is none of these, the program stops before reading anything. Decide
-- what the cabal_simple rules make of it (timbuktu//rules/haskell/cabal/fields.bzl)
-- and add it here.
--
-- Dependencies are not checked against anything: a flag is resolved as if
-- every dependency were available.
module Main (main) where

import Control.Monad (unless)
import Data.ByteString qualified as BS
import Data.ByteString.Char8 qualified as BS8
import Data.ByteString.Lazy qualified as LBS
import Data.ByteString.Lazy.Char8 qualified as LBS8
import Data.List (intersperse, isSuffixOf, (\\))
import Data.List.NonEmpty qualified as NE
import Data.Maybe (isNothing)
import Distribution.CabalSpecVersion (showCabalSpecVersion)
import Distribution.Compat.NonEmptySet qualified as NES
import Distribution.Compiler (AbiTag (..), CompilerFlavor (..), CompilerId (..), PerCompilerFlavor (..), unknownCompilerInfo)
import Distribution.FieldGrammar (ParsecFieldGrammar, fieldGrammarKnownFieldList)
import Distribution.Fields (showPError)
import Distribution.ModuleName (ModuleName)
import Distribution.PackageDescription
import Distribution.PackageDescription.Configuration (finalizePD)
import Distribution.PackageDescription.FieldGrammar
    ( benchmarkFieldGrammar
    , executableFieldGrammar
    , foreignLibFieldGrammar
    , libraryFieldGrammar
    , packageDescriptionFieldGrammar
    , testSuiteFieldGrammar
    )
import Distribution.PackageDescription.Parsec (parseGenericPackageDescription, runParseResult)
import Distribution.Parsec (eitherParsec, explicitEitherParsec)
import Distribution.Pretty (Pretty, prettyShow)
import Distribution.Simple.BuildToolDepends (desugarBuildTool, getAllToolDependencies)
import Distribution.Simple.Utils (cabalVersion)
import Distribution.System (Platform (..), buildPlatform)
import Distribution.Types.ComponentRequestedSpec (ComponentRequestedSpec (..))
import Distribution.Utils.Json (Json (..), renderJson, (.=))
import Distribution.Utils.Path (SymbolicPathX, getSymbolicPath)
import Distribution.Utils.ShortText (ShortText, fromShortText)
import Distribution.Version (Version)
import System.Directory (doesDirectoryExist, listDirectory)
import System.Environment (getArgs)
import System.Exit (die)
import System.FilePath ((</>))
import System.IO (hPutStrLn, stderr)

-- | The version of what this program prints. Change it whenever a field
-- changes its meaning or its shape, not when one is added.
format :: Int
format = 1

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
    checkFields
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

    LBS.putStr (pretty "" (describe platform version resolved pd))
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

--
-- What is printed
--

-- | A field: its name in a .cabal file, and its value when it has one.
type Field a = (String, a -> Maybe Json)

-- | Fields whose value Cabal keeps in the same place as another's: they are
-- printed under the name of that one.
folded :: [String]
folded =
    [ "hs-source-dir" -- hs-source-dirs
    , "extensions" -- default-extensions, see usedExtensions
    , "license-file" -- license-files
    , "benchmark-module" -- type: a benchmark with a module is of no type Cabal supports
    ]

-- | The options for compilers other than GHC.
otherCompilers :: [String]
otherCompilers =
    [ "ghcjs-options"
    , "ghcjs-prof-options"
    , "ghcjs-prof-shared-options"
    , "ghcjs-shared-options"
    , "hugs-options"
    , "jhc-options"
    , "nhc98-options"
    ]

-- | Stop if Cabal knows a field of a stanza that is not printed.
checkFields :: IO ()
checkFields = do
    let missing =
            concat
                [ unprinted "package" packageDescriptionFieldGrammar (names packageFields)
                , unprinted "library" (libraryFieldGrammar LMainLibName) (names libraryFields ++ bi)
                , unprinted "executable" (executableFieldGrammar (mkUnqualComponentName "x")) (names executableFields ++ bi)
                , unprinted "test-suite" testSuiteFieldGrammar (names testSuiteFields ++ bi)
                , unprinted "benchmark" benchmarkFieldGrammar (names benchmarkFields ++ bi)
                , unprinted "foreign-library" (foreignLibFieldGrammar (mkUnqualComponentName "x")) (names foreignLibFields ++ bi)
                ]
        bi = names (buildInfoFields emptyPackageDescription)
    unless (null missing) $
        die . unlines $
            ("describe_package: Cabal " ++ prettyShow cabalVersion ++ " knows fields that this program does not print:")
                : map ("  " ++) missing
                ++ ["Decide what the cabal_simple rules make of them (rules/haskell/cabal/fields.bzl), then print them."]
  where
    names :: [Field a] -> [String]
    names = map fst

    unprinted :: String -> ParsecFieldGrammar s a -> [String] -> [String]
    unprinted stanza grammar printed =
        [ stanza ++ ": " ++ name
        | name <- map BS8.unpack (fieldGrammarKnownFieldList grammar) \\ (printed ++ folded ++ otherCompilers)
        ]

describe :: Platform -> Version -> FlagAssignment -> PackageDescription -> Json
describe platform version flags pd =
    JsonObject $
        [ "format" .= JsonNumber format
        , "cabal-library" .= JsonString (prettyShow cabalVersion)
        , "ghc-version" .= JsonString (prettyShow version)
        , "platform" .= JsonString (prettyShow platform)
        , "flags" .= JsonObject [(unFlagName n, JsonBool v) | (n, v) <- unFlagAssignment flags]
        ]
            ++ values packageFields pd
            ++ [ "components"
                    .= JsonArray
                        ( map (component "lib" libraryName libBuildInfo libraryFields) (maybe [] pure (library pd) ++ subLibraries pd)
                            ++ map (component "exe" (Just . exeName) buildInfo executableFields) (executables pd)
                            ++ map (component "test" (Just . testName) testBuildInfo testSuiteFields) (testSuites pd)
                            ++ map (component "bench" (Just . benchmarkName) benchmarkBuildInfo benchmarkFields) (benchmarks pd)
                            ++ map (component "flib" (Just . foreignLibName) foreignLibBuildInfo foreignLibFields) (foreignLibs pd)
                        )
               ]
  where
    component :: String -> (c -> Maybe UnqualComponentName) -> (c -> BuildInfo) -> [Field c] -> c -> Json
    component kind name bi specific c =
        JsonObject $
            [ "kind" .= JsonString kind
            , "name" .= maybe JsonNull (JsonString . unUnqualComponentName) (name c)
            ]
                ++ values specific c
                ++ values (buildInfoFields pd) (bi c)

    libraryName lib = case libName lib of
        LMainLibName -> Nothing
        LSubLibName n -> Just n

-- | One field or item to a line, so that a change shows in a diff.
pretty :: String -> Json -> LBS.ByteString
pretty indent = \case
    JsonObject [] -> "{}"
    JsonArray [] -> "[]"
    JsonObject kvs -> block '{' '}' [renderJson (JsonString k) <> ": " <> pretty inner v | (k, v) <- kvs]
    JsonArray vs -> block '[' ']' (map (pretty inner) vs)
    v -> renderJson v
  where
    inner = indent ++ "  "
    block open close items =
        LBS8.singleton open
            <> "\n"
            <> mconcat (intersperse ",\n" (map (LBS8.pack inner <>) items))
            <> "\n"
            <> LBS8.pack indent
            <> LBS8.singleton close

values :: [Field a] -> a -> [(String, Json)]
values fields x = [(name, v) | (name, get) <- fields, Just v <- [get x]]

packageFields :: [Field PackageDescription]
packageFields =
    [ ("cabal-version", str . showCabalSpecVersion . specVersion)
    , ("name", str . unPackageName . pkgName . package)
    , ("version", str . prettyShow . pkgVersion . package)
    , ("build-type", str . prettyShow . buildType)
    , -- As written: an SPDX expression, or a name of the old kind (BSD3)
      ("license", str . either prettyShow prettyShow . licenseRaw)
    , ("license-files", paths . licenseFiles)
    , ("copyright", text . copyright)
    , ("maintainer", text . maintainer)
    , ("author", text . author)
    , ("stability", text . stability)
    , ("tested-with", str . commas . map (\(c, v) -> prettyShow c ++ " " ++ prettyShow v) . testedWith)
    , ("homepage", text . homepage)
    , ("package-url", text . pkgUrl)
    , ("bug-reports", text . bugReports)
    , ("synopsis", text . synopsis)
    , ("description", text . description)
    , ("category", text . category)
    , ("data-dir", str . getSymbolicPath . dataDir)
    , ("data-files", paths . dataFiles)
    , ("extra-source-files", paths . extraSrcFiles)
    , ("extra-tmp-files", paths . extraTmpFiles)
    , ("extra-doc-files", paths . extraDocFiles)
    , ("extra-files", paths . extraFiles)
    ]
  where
    commas = foldr (\a b -> if null b then a else a ++ ", " ++ b) ""

libraryFields :: [Field Library]
libraryFields =
    [ ("exposed-modules", modules . exposedModules)
    , ("reexported-modules", strs . map reexport . reexportedModules)
    , ("signatures", modules . signatures)
    , -- Cabal makes a sublibrary unexposed whatever the field says.
      ("exposed", \lib -> if libExposed lib || libName lib /= LMainLibName then Nothing else Just (JsonBool False))
    , ( "visibility"
      , \lib -> case (libVisibility lib, libName lib) of
            (LibraryVisibilityPrivate, LSubLibName _) -> Nothing
            (LibraryVisibilityPublic, LMainLibName) -> Nothing
            (v, _) -> str (prettyShow v)
      )
    ]
  where
    reexport (ModuleReexport mpkg orig new) =
        maybe "" (\p -> prettyShow p ++ ":") mpkg
            ++ prettyShow orig
            ++ (if orig == new then "" else " as " ++ prettyShow new)

executableFields :: [Field Executable]
executableFields =
    [ ("main-is", str . getSymbolicPath . modulePath)
    , ("scope", \exe -> case exeScope exe of ExecutablePublic -> Nothing; ExecutablePrivate -> str "private")
    ]

testSuiteFields :: [Field TestSuite]
testSuiteFields =
    [ ("type", str . interfaceType)
    , ("main-is", \t -> case testInterface t of TestSuiteExeV10 _ path -> str (getSymbolicPath path); _ -> Nothing)
    , ("test-module", \t -> case testInterface t of TestSuiteLibV09 _ m -> str (prettyShow m); _ -> Nothing)
    , ("code-generators", strs . testCodeGenerators)
    ]
  where
    interfaceType t = case testInterface t of
        TestSuiteExeV10 v _ -> "exitcode-stdio-" ++ prettyShow v
        TestSuiteLibV09 v _ -> "detailed-" ++ prettyShow v
        TestSuiteUnsupported tt -> prettyShow tt

benchmarkFields :: [Field Benchmark]
benchmarkFields =
    [ ("type", str . interfaceType)
    , ("main-is", \b -> case benchmarkInterface b of BenchmarkExeV10 _ path -> str (getSymbolicPath path); _ -> Nothing)
    ]
  where
    interfaceType b = case benchmarkInterface b of
        BenchmarkExeV10 v _ -> "exitcode-stdio-" ++ prettyShow v
        BenchmarkUnsupported bt -> prettyShow bt

foreignLibFields :: [Field ForeignLib]
foreignLibFields =
    [ ("type", str . prettyShow . foreignLibType)
    , ("options", pretties . foreignLibOptions)
    , ("lib-version-info", fmap (JsonString . prettyShow) . foreignLibVersionInfo)
    , ("lib-version-linux", fmap (JsonString . prettyShow) . foreignLibVersionLinux)
    , ("mod-def-file", paths . foreignLibModDefFile)
    ]

-- | The fields every component has. The package is there for the
-- `build-tools` Cabal turns into `build-tool-depends`.
buildInfoFields :: PackageDescription -> [Field BuildInfo]
buildInfoFields pd =
    [ ("buildable", Just . JsonBool . buildable)
    , ("hs-source-dirs", paths . hsSourceDirs)
    , ("other-modules", modules . otherModules)
    , ("virtual-modules", modules . virtualModules)
    , ("autogen-modules", modules . autogenModules)
    , ("default-language", fmap (JsonString . prettyShow) . defaultLanguage)
    , ("other-languages", pretties . otherLanguages)
    , -- What GHC is given, see usedExtensions
      ("default-extensions", pretties . usedExtensions)
    , ("other-extensions", pretties . otherExtensions)
    , ("build-depends", arr . map dependency . targetBuildDepends)
    , -- With the `build-tools` Cabal knows the package of, see
      -- getAllToolDependencies
      ("build-tool-depends", arr . map exeDependency . getAllToolDependencies pd)
    , -- The `build-tools` Cabal does not know: programs, to find in PATH
      ("build-tools", \bi -> pretties [t | t <- buildTools bi, isNothing (desugarBuildTool pd t)])
    , ("ghc-options", strs . ghc . options)
    , ("ghc-prof-options", strs . ghc . profOptions)
    , ("ghc-shared-options", strs . ghc . sharedOptions)
    , ("ghc-prof-shared-options", strs . ghc . profSharedOptions)
    , ("cpp-options", strs . cppOptions)
    , ("cc-options", strs . ccOptions)
    , ("cxx-options", strs . cxxOptions)
    , ("asm-options", strs . asmOptions)
    , ("cmm-options", strs . cmmOptions)
    , ("ld-options", strs . ldOptions)
    , ("hsc2hs-options", strs . hsc2hsOptions)
    , ("c-sources", paths . cSources)
    , ("cxx-sources", paths . cxxSources)
    , ("asm-sources", paths . asmSources)
    , ("cmm-sources", paths . cmmSources)
    , ("js-sources", paths . jsSources)
    , ("include-dirs", paths . includeDirs)
    , ("includes", paths . includes)
    , ("install-includes", paths . installIncludes)
    , ("autogen-includes", paths . autogenIncludes)
    , ("extra-libraries", strs . extraLibs)
    , ("extra-libraries-static", strs . extraLibsStatic)
    , ("extra-lib-dirs", paths . extraLibDirs)
    , ("extra-lib-dirs-static", paths . extraLibDirsStatic)
    , ("extra-ghci-libraries", strs . extraGHCiLibs)
    , ("extra-bundled-libraries", strs . extraBundledLibs)
    , ("extra-library-flavours", strs . extraLibFlavours)
    , ("extra-dynamic-library-flavours", strs . extraDynLibFlavours)
    , ("frameworks", paths . frameworks)
    , ("extra-framework-dirs", paths . extraFrameworkDirs)
    , ("pkgconfig-depends", pretties . pkgconfigDepends)
    , ("mixins", pretties . mixins)
    ]
  where
    ghc (PerCompilerFlavor o _) = o
    pkgname = pkgName (package pd)

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

str :: String -> Maybe Json
str "" = Nothing
str v = Just (JsonString v)

text :: ShortText -> Maybe Json
text = str . fromShortText

strs :: [String] -> Maybe Json
strs [] = Nothing
strs vs = Just (JsonArray (map JsonString vs))

arr :: [Json] -> Maybe Json
arr [] = Nothing
arr vs = Just (JsonArray vs)

pretties :: (Pretty p) => [p] -> Maybe Json
pretties = strs . map prettyShow

paths :: [SymbolicPathX allowAbs from to] -> Maybe Json
paths = strs . map getSymbolicPath

modules :: [ModuleName] -> Maybe Json
modules = pretties
