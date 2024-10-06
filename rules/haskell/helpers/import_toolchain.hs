{-# LANGUAGE ImportQualifiedPost #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -Wall #-}

import Control.Exception (catchJust)
import Control.Monad.IO.Class (MonadIO (..))
import Control.Monad.Trans.Maybe (hoistMaybe, runMaybeT)
import Data.ByteString qualified as BS
import Data.Either (partitionEithers)
import Data.Foldable (Foldable (..), for_)
import Data.List (isPrefixOf, sortOn, stripPrefix)
import Data.Maybe (fromMaybe)
import Data.Monoid (Endo (..))
import Data.String
import Data.Traversable (for)
import Distribution.InstalledPackageInfo qualified as IPI
import Distribution.Package (packageName)
import Distribution.Pretty (Pretty (..), prettyShow)
import Distribution.Types.PackageId (PackageIdentifier (..))
import System.Console.GetOpt (ArgDescr (..), ArgOrder (..), OptDescr (..), getOpt)
import System.Directory (canonicalizePath, createDirectoryIfMissing, createDirectoryLink, listDirectory, removeDirectoryLink)
import System.Environment (getArgs)
import System.FilePath (isExtensionOf, makeRelative, (</>))
import System.IO (hPutStrLn, stderr)
import System.IO.Error (isDoesNotExistError)
import System.Process (proc, readCreateProcess)
import Text.PrettyPrint
import Prelude hiding ((<>))

data Opts = Opts
  { outPath :: Maybe FilePath,
    ghcPath :: FilePath
  }

options :: [OptDescr (Opts -> Opts)]
options =
  [ Option ['w'] ["ghc"] (ReqArg (\v opts -> opts {ghcPath = v}) "GHC") "use this GHC",
    Option ['o'] ["outdir"] (ReqArg (\v opts -> opts {outPath = Just v}) "FILE") "output FILE"
  ]

defaultOpts :: Opts
defaultOpts =
  Opts
    { outPath = Nothing,
      ghcPath = "ghc"
    }

main :: IO ()
main = do
  (opts', _, errs) <- getOpt RequireOrder options <$> getArgs
  for_ errs $ \err -> do
    hPutStrLn stderr err
  let Opts {..} = appEndo (foldMap Endo opts') defaultOpts

  info <- readSettings <$> readCreateProcess (proc ghcPath ["--info"]) ""
  let ghcVersion = fromMaybe (error "Missing \"Project version\"") $ lookup "Project version" info
      libDir = fromMaybe (error "Missing \"LibDir\"") $ lookup "LibDir" info
      compilerId = "ghc-" ++ ghcVersion

  outdir <- canonicalizePath $ fromMaybe ("toolchains/" ++ compilerId) outPath
  createDirectoryIfMissing True outdir
  putStrLn $ "Output directory: " ++ outdir

  let outLibDir = outdir </> "lib"
  mkDirLink libDir outLibDir
  putStrLn $ "Linking " ++ libDir ++ " to " ++ outLibDir

  let globalPackageDb = libDir </> "package.conf.d"
  entries <- sortOn IPI.installedUnitId . map (\ipi -> ipi {IPI.pkgRoot = Just libDir}) <$> readPackageDbEntries globalPackageDb

  let toolchain = renderToolchain compilerId entries
  output <- traverse (renderPackageInfo ghcVersion) entries

  writeFile (outdir </> "BUCK") $
    render $
      vcat toolchain $$ vcat output
  putStrLn $ "Generated BUCK file: " ++ outdir </> "BUCK"

readSettings :: String -> [(String, String)]
readSettings = read

mkDirLink :: FilePath -> FilePath -> IO ()
mkDirLink src dst = do
  catchJust
    (\case (ex :: IOError) | isDoesNotExistError ex -> Just (); _ -> Nothing)
    (removeDirectoryLink dst)
    return
  createDirectoryLink src dst

readPackageDbEntries :: FilePath -> IO [IPI.InstalledPackageInfo]
readPackageDbEntries packagedb = do
  (errs, ipis) <-
    partitionEithers <$> do
      entries <- filter (".conf" `isExtensionOf`) <$> listDirectory packagedb
      for entries $ \entry -> do
        let fn = packagedb </> entry
        bs <- BS.readFile fn
        case IPI.parseInstalledPackageInfo bs of
          Left e -> pure $ Left (fn, e)
          Right (_warns, ipi) -> pure $ Right ipi

  for_ errs $ \(fn, e) -> do
    hPutStrLn stderr $ fn ++ ":"
    hPutStrLn stderr $ unlines $ toList e

  return ipis

renderToolchain :: String -> [IPI.InstalledPackageInfo] -> [Doc]
renderToolchain compilerId entries =
  [ load "@toolchains//:haskell.bzl" ["haskell_toolchain"],
    rule
      "haskell_toolchain"
      [ ("name", "haskell"),
        ("compiler", Quoted compilerId),
        ("linker", Quoted compilerId),
        ("packager", Quoted $ "ghc-pkg" ++ drop 3 compilerId),
        ("haddock", Quoted $ "haddock" ++ drop 3 compilerId),
        ( "packages",
          Dict
            [ (prettyShow $ packageName sourcePackageId, Label . prettyShow $ installedUnitId)
            | IPI.InstalledPackageInfo {sourcePackageId, installedUnitId} <- entries
            ]
        ),
        ("visibility", List ["PUBLIC"])
      ]
  ]

renderPackageInfo :: String -> IPI.InstalledPackageInfo -> IO Doc
renderPackageInfo ghcVersion IPI.InstalledPackageInfo {..} = do
  let normaliseDir :: FilePath -> IO FilePath
      normaliseDir dir = fmap (fromMaybe dir) $ runMaybeT $ do
        pkgRoot' <- hoistMaybe pkgRoot
        dir' <- hoistMaybe $ stripPrefix "${pkgroot}/" dir
        dir'' <- liftIO $ makeRelative pkgRoot' <$> canonicalizePath (pkgRoot' </> dir')
        return $ "lib" </> dir''

  let -- FIXME: the file extensions should be platform dependent
      -- NOTE: Maybe it is better to do this in a build file?
      cLibName name = "lib" ++ drop 1 name
      dynamicLibName name
        | "C" `isPrefixOf` name = cLibName name ++ ".so"
        | otherwise = "lib" ++ name ++ "-ghc" ++ ghcVersion ++ ".so"
      staticLibName name = "lib" ++ name ++ ".a"

  let db = "lib/package.conf.d"
  cxxHeaderDirs <- traverse normaliseDir includeDirs
  staticLibDirs <- traverse normaliseDir libraryDirsStatic
  dynamicLibDirs <- traverse normaliseDir libraryDynDirs
  importDirs' <- traverse normaliseDir importDirs

  return $
    rule
      "haskell_prebuilt_library"
      [ ("name", Quoted (prettyShow installedUnitId)),
        ("version", Quoted (prettyShow (pkgVersion sourcePackageId))),
        ("id", Quoted (prettyShow installedUnitId)),
        ("db", Quoted db),
        ("deps", List [Label (prettyShow d) | d <- depends]),
        ("import_dirs", List [Quoted dir | dir <- importDirs']),
        ( "shared_libs",
          Dict
            [ (dynamicLibName hsLib, Quoted $ dynamicLibDir </> dynamicLibName hsLib)
            | hsLib <- hsLibraries,
              dynamicLibDir <- dynamicLibDirs
            ]
        ),
        ( "static_libs",
          List
            [ Quoted $ staticLibDir </> staticLibName hsLib
            | hsLib <- hsLibraries,
              staticLibDir <- staticLibDirs
            ]
        ),
        ("cxx_header_dirs", List [Quoted hdr | hdr <- cxxHeaderDirs]),
        ("exported_linker_flags", List [Quoted opt | opt <- ldOptions]),
        ("visibility", List ["PUBLIC"])
      ]

--
-- Pretty print utilities
--

data Term = List [Term] | Dict [(String, Term)] | Quoted String | Label String

instance IsString Term where
  fromString = Quoted

instance Pretty Term where
  pretty = pretty2 empty

pretty2 :: Doc -> Term -> Doc
pretty2 prefix (List ts) =
  sep
    [ prefix <+> lbrack,
      nest 2 $ sep $ punctuate comma $ map pretty ts,
      rbrack
    ]
pretty2 prefix (Dict kvs) =
  sep
    [ prefix <+> lbrace,
      nest 2 $ sep $ punctuate comma [pretty2 (pretty (Quoted k) <> ":") v | (k, v) <- kvs],
      rbrace
    ]
pretty2 prefix (Quoted s) =
  prefix <+> text (show s)
pretty2 prefix (Label s) =
  prefix <+> text (show (':' : s))

rule :: String -> [(String, Term)] -> Doc
rule n args =
  (text n <> lparen)
    $+$ (nest 2 $ sep $ punctuate comma [pretty2 (text k <+> "=") v | (k, v) <- args])
    $+$ rparen
    $+$ " "

load :: String -> [String] -> Doc
load m names =
  text "load"
    <> parens (pretty (Quoted m) <> "," <+> (hsep $ punctuate comma $ map (pretty . Quoted) names))
    $+$ ""
