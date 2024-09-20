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
import Data.List (isPrefixOf, stripPrefix)
import Data.Maybe (fromMaybe)
import Data.Monoid (Endo (..))
import Data.Traversable (for)
import Distribution.InstalledPackageInfo qualified as IPI
import Distribution.Pretty (Pretty (..), prettyShow)
import Distribution.Types.PackageId (PackageIdentifier (..), pkgName)
import System.Console.GetOpt (ArgDescr (..), ArgOrder (..), OptDescr (..), getOpt)
import System.Directory (canonicalizePath, createDirectoryIfMissing, createDirectoryLink, findExecutable, listDirectory, removeDirectoryLink)
import System.Environment (getArgs)
import System.FilePath (isExtensionOf, makeRelative, (</>))
import System.IO (hPutStrLn, stderr)
import System.IO.Error (isDoesNotExistError)
import System.Process (proc, readCreateProcess)
import Text.PrettyPrint
import Prelude hiding ((<>))

data Opts = Opts
  { outPath :: FilePath,
    ghcPath :: FilePath
  }

options :: [OptDescr (Opts -> Opts)]
options =
  [ Option ['w'] ["ghc"] (ReqArg (\v opts -> opts {ghcPath = v}) "GHC") "use this GHC",
    Option ['o'] ["outdir"] (ReqArg (\v opts -> opts {outPath = v}) "FILE") "output FILE"
  ]

defaultOpts :: Opts
defaultOpts =
  Opts
    { outPath = "toolchains/haskell",
      ghcPath = "ghc"
    }

main :: IO ()
main = do
  (opts', _, errs) <- getOpt RequireOrder options <$> getArgs
  for_ errs $ \err -> do
    hPutStrLn stderr err
  let opts = appEndo (foldMap Endo opts') defaultOpts

  ghcPathFull <-
    findExecutable (ghcPath opts) >>= \case
      Nothing -> error "ghc not found"
      Just p -> canonicalizePath p

  info <- readSettings <$> readCreateProcess (proc ghcPathFull ["--info"]) ""
  let ghcVersion = fromMaybe (error "Missing \"Project version\"") $ lookup "Project version" info
      libDir = fromMaybe (error "Missing \"LibDir\"") $ lookup "LibDir" info

  outdir <- canonicalizePath $ outPath opts
  createDirectoryIfMissing True outdir
  putStrLn $ "Output directory: " ++ outdir

  let outLibDir = outdir </> "lib"
  mkDirLink libDir outLibDir
  putStrLn $ "Linking " ++ libDir ++ " to " ++ outLibDir

  let globalPackageDb = libDir </> "package.conf.d"
  entries <- map (\ipi -> ipi {IPI.pkgRoot = Just libDir}) <$> readPackageDbEntries globalPackageDb
  output <- traverse (renderPackageInfo ghcVersion) entries
  writeFile (outPath opts </> "BUCK") $ render $ vcat output
  putStrLn $ "Generated BUCK file: " ++ outPath opts </> "BUCK"

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

-- renderToolchain :: String -> Doc
-- renderToolchain compiler =
--   vcat
--     [ load "toolchain.bzl" ["haskell_toolchain"],
--       rule
--         "haskell_toolchain"
--         [ ("name", quoted "haskell"),
--           ("compiler", quoted compiler),
--           ("packager", quoted compiler <> ".replace(\"ghc\", \"ghc-pkg\")"),
--           ("linker", quoted compiler),
--           ("visibility", list [quoted "PUBLIC"])
--         ]
--     ]

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
    vcat
      [ rule
          "haskell_prebuilt_library"
          [ ("name", quotedPretty installedUnitId),
            ("version", quotedPretty (pkgVersion sourcePackageId)),
            ("id", quotedPretty installedUnitId),
            ("db", quoted db),
            ("deps", list $ map (quotedPretty . Label) depends),
            ("import_dirs", list (map quoted importDirs')),
            ( "shared_libs",
              dict
                [ (dynamicLibName hsLib, quoted $ dynamicLibDir </> dynamicLibName hsLib)
                | hsLib <- hsLibraries,
                  dynamicLibDir <- dynamicLibDirs
                ]
            ),
            ( "static_libs",
              list
                [ quoted $ staticLibDir </> staticLibName hsLib
                | hsLib <- hsLibraries,
                  staticLibDir <- staticLibDirs
                ]
            ),
            ("cxx_header_dirs", list (map quoted cxxHeaderDirs)),
            ("exported_linker_flags", list (map quoted ldOptions)),
            ("visibility", list [quoted "PUBLIC"])
          ],
        rule
          "alias"
          [ ("name", quotedPretty $ pkgName sourcePackageId),
            ("actual", quotedPretty $ Label installedUnitId),
            ("visibility", list [quoted "PUBLIC"])
          ]
      ]

--
-- Pretty print utilities
--

list :: [Doc] -> Doc
list m =
  sep
    [ lbrack,
      nest 2 $ sep $ punctuate comma $ m,
      rbrack
    ]

dict :: [(String, Doc)] -> Doc
dict kvs =
  sep
    [ lbrace,
      nest 2 $ sep $ punctuate comma $ [quoted k <> ":" <+> v | (k, v) <- kvs],
      rbrace
    ]

rule :: String -> [(String, Doc)] -> Doc
rule n args =
  vcat
    [ text n <> "(",
      nest 2 $ vcat $ punctuate comma [text k <+> "=" <+> v | (k, v) <- args],
      ")",
      ""
    ]

-- load :: String -> [String] -> Doc
-- load m f = "load(" <> quoted m <> "," <+> (hsep $ punctuate comma $ map quoted f) <> ")" <> "\n"

quoted :: String -> Doc
quoted = text . show

quotedPretty :: (Pretty a) => a -> Doc
quotedPretty = quoted . prettyShow

data Label a = Label a

instance (Pretty a) => Pretty (Label a) where
  pretty (Label a) = ":" <> pretty a
