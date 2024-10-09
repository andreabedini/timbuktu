{-# LANGUAGE ImportQualifiedPost #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -Wall #-}

import Control.Exception (catchJust)
import Control.Monad (filterM)
import Control.Monad.IO.Class (MonadIO (..))
import Control.Monad.Trans.Maybe (hoistMaybe, runMaybeT)
import Data.Foldable (for_)
import Data.Map qualified as Map
import Data.Maybe (fromMaybe)
import Data.Monoid (Endo (..))
import Data.String (IsString (..))
import Data.Traversable (for)
import Distribution.InstalledPackageInfo (InstalledPackageInfo (..))
import Distribution.Pretty (Pretty (..), prettyShow)
import Distribution.Simple (Compiler (..), CompilerFlavor (..), CompilerId, PackageDB (..), PackageIdentifier (..))
import Distribution.Simple.BuildPaths (mkGenericSharedBundledLibName, mkGenericStaticLibName)
import Distribution.Simple.Configure (configCompilerEx, getPackageDBContents)
import Distribution.Simple.PackageIndex qualified as Index
import Distribution.Simple.Program (defaultProgramDb)
import Distribution.Verbosity qualified as Verbosity
import System.Console.GetOpt (ArgDescr (..), ArgOrder (..), OptDescr (..), getOpt)
import System.Directory (canonicalizePath, createDirectoryIfMissing, createDirectoryLink, doesFileExist, removeDirectoryLink)
import System.Environment (getArgs)
import System.FilePath (makeRelative, takeFileName, (</>))
import System.IO (hPutStrLn, stderr)
import System.IO.Error (isDoesNotExistError)
import Text.PrettyPrint
import Prelude hiding ((<>))

data Opts = Opts
    { outPath :: Maybe FilePath
    , ghcPath :: FilePath
    }

options :: [OptDescr (Opts -> Opts)]
options =
    [ Option ['w'] ["ghc"] (ReqArg (\v opts -> opts{ghcPath = v}) "GHC") "use this GHC"
    , Option ['o'] ["outdir"] (ReqArg (\v opts -> opts{outPath = Just v}) "FILE") "output FILE"
    ]

defaultOpts :: Opts
defaultOpts =
    Opts
        { outPath = Nothing
        , ghcPath = "ghc"
        }

main :: IO ()
main = do
    (opts', _, errs) <- getOpt RequireOrder options <$> getArgs
    for_ errs $ \err -> do
        hPutStrLn stderr err
    let Opts{..} = appEndo (foldMap Endo opts') defaultOpts

    (compiler, platform, progdb) <- configCompilerEx (Just GHC) (Just ghcPath) Nothing defaultProgramDb Verbosity.normal
    let libDir = fromMaybe (error "Missing \"LibDir\"") $ Map.lookup "LibDir" $ (compilerProperties compiler)

    let outdir = fromMaybe ("toolchains/" ++ prettyShow (compilerId compiler)) outPath
    createDirectoryIfMissing True outdir
    putStrLn $ "Created " ++ outdir

    let outLibDir = outdir </> "lib"
    mkDirLink libDir outLibDir
    putStrLn $ "Created symbolic link " ++ outLibDir ++ " to " ++ libDir

    iidx <- getPackageDBContents Verbosity.normal compiler GlobalPackageDB progdb

    entries <- for (Index.allPackages iidx) $ \InstalledPackageInfo{..} -> do
        let normalisePath :: FilePath -> IO FilePath
            normalisePath dir = fmap (fromMaybe dir) $ runMaybeT $ do
                pkgRoot' <- hoistMaybe pkgRoot
                dir' <- liftIO $ makeRelative pkgRoot' <$> canonicalizePath (pkgRoot' </> dir)
                return $ "lib" </> dir'

        let db = "lib/package.conf.d"

        staticLibs <-
            filterM
                doesFileExist
                [ dir </> mkGenericStaticLibName lib
                | dir <- libraryDirsStatic
                , lib <- hsLibraries
                ]
                >>= traverse normalisePath

        profiledStaticLibs <-
            filterM
                doesFileExist
                [ dir </> mkGenericStaticLibName (lib ++ "_p")
                | dir <- libraryDirsStatic
                , lib <- hsLibraries
                ]
                >>= traverse normalisePath

        sharedLibs <-
            filterM
                doesFileExist
                [ dir </> mkGenericSharedBundledLibName platform (compilerId compiler) lib
                | dir <- libraryDynDirs
                , lib <- hsLibraries
                ]
                >>= traverse normalisePath

        includeDirs' <- traverse normalisePath includeDirs
        importDirs' <- traverse normalisePath importDirs

        return $
            vcat
                [ rule
                    "haskell_prebuilt_library"
                    [ ("name", Quoted $ prettyShow (pkgName sourcePackageId))
                    , ("version", Quoted $ prettyShow (pkgVersion sourcePackageId))
                    , ("id", Quoted $ prettyShow installedUnitId)
                    , ("db", Quoted db)
                    , ("deps", List [Label $ prettyShow d | d <- depends])
                    , ("import_dirs", List [Quoted dir | dir <- importDirs'])
                    , ("shared_libs", Dict [(takeFileName lib, Quoted lib) | lib <- sharedLibs])
                    , ("static_libs", List $ map Quoted staticLibs)
                    , ("profiled_static_libs", List $ map Quoted profiledStaticLibs)
                    , ("cxx_header_dirs", List $ map Quoted includeDirs')
                    , ("exported_linker_flags", List $ map Quoted ldOptions)
                    , ("visibility", List ["PUBLIC"])
                    ]
                , rule
                    "alias"
                    [ ("name", Quoted $ prettyShow installedUnitId)
                    , ("actual", Label $ prettyShow (pkgName sourcePackageId))
                    ]
                ]

    let toolchain = renderToolchain (compilerId compiler) iidx

    writeFile (outdir </> "BUCK") $ render $ vcat toolchain $$ vcat entries
    putStrLn $ "Written " ++ outdir </> "BUCK"

mkDirLink :: FilePath -> FilePath -> IO ()
mkDirLink src dst = do
    catchJust
        (\case (ex :: IOError) | isDoesNotExistError ex -> Just (); _ -> Nothing)
        (removeDirectoryLink dst)
        return
    createDirectoryLink src dst

renderToolchain :: CompilerId -> Index.InstalledPackageIndex -> [Doc]
renderToolchain compilerId iidx =
    [ load "@root//rules/haskell:toolchain.bzl" ["haskell_toolchain"]
    , rule
        "haskell_toolchain"
        [ ("name", "haskell")
        , ("compiler", Quoted $ prettyShow compilerId)
        , ("linker", Quoted $ prettyShow compilerId)
        , ("packager", Quoted $ "ghc-pkg" ++ drop 3 (prettyShow compilerId))
        , ("haddock", Quoted $ "haddock" ++ drop 3 (prettyShow compilerId))
        , ("packages", List [Label $ prettyShow $ pkgName $ sourcePackageId p | p <- Index.allPackages iidx])
        , ("visibility", List ["PUBLIC"])
        ]
    ]

--
-- Pretty print utilities
--

data Term = List [Term] | Dict [(String, Term)] | Quoted String | Label String

instance IsString Term where
    fromString = Quoted

instance Pretty Term where
    pretty = pretty_with_prefix empty

pretty_with_prefix :: Doc -> Term -> Doc
pretty_with_prefix prefix (List ts) =
    cat
        [ prefix <+> lbrack
        , nest 4 $ sep $ punctuate comma $ map pretty ts
        , rbrack
        ]
pretty_with_prefix prefix (Dict kvs) =
    cat
        [ prefix <+> lbrace
        , nest 4 $ sep $ punctuate comma [pretty_with_prefix (pretty (Quoted k) <> ":") v | (k, v) <- kvs]
        , rbrace
        ]
pretty_with_prefix prefix (Quoted s) =
    prefix <+> text (show s)
pretty_with_prefix prefix (Label s) =
    prefix <+> text (show (':' : s))

rule :: String -> [(String, Term)] -> Doc
rule n args =
    cat
        [ text n <> lparen
        , nest 4 $ sep $ punctuate comma [pretty_with_prefix (text k <+> "=") v | (k, v) <- args]
        , rparen
        ]
        <> "\n"

load :: String -> [String] -> Doc
load m names =
    text "load"
        <> parens (pretty (Quoted m) <> "," <+> (hsep $ punctuate comma $ map (pretty . Quoted) names))
        $+$ ""
