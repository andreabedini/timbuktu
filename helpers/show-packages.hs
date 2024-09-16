{-# LANGUAGE DerivingVia #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# OPTIONS_GHC -Wall #-}

import Data.ByteString qualified as BS
import Data.Char (isSpace)
import Data.Either (partitionEithers)
import Data.Foldable (Foldable (..), for_)
import Data.List (dropWhileEnd, isPrefixOf, stripPrefix)
import Data.Maybe (fromMaybe)
import Data.Monoid (Last (..))
import Data.Traversable (for)
import Distribution.InstalledPackageInfo qualified as IPI
import Distribution.Pretty (Pretty (..), prettyShow)
import Distribution.Types.PackageId (PackageIdentifier (..), pkgName)
import GHC.Generics (Generic, Generically (..))
import System.Console.GetOpt (ArgDescr (..), ArgOrder (..), OptDescr (..), getOpt)
import System.Directory (canonicalizePath, listDirectory)
import System.Environment (getArgs)
import System.FilePath (isExtensionOf, makeRelative, takeDirectory, (</>))
import System.IO (hPutStrLn, stderr)
import System.Process (proc, readCreateProcess)
import Text.PrettyPrint
import Prelude hiding ((<>))

data Opts = Opts
  { outPath :: Last FilePath,
    ghcPath :: Last FilePath
  }
  deriving (Generic, Show)
  deriving (Semigroup, Monoid) via Generically Opts

options :: [OptDescr Opts]
options =
  [ Option ['o'] ["output"] (ReqArg (\v -> mempty {outPath = pure v}) "FILE") "output FILE",
    Option ['w'] ["with-ghc"] (ReqArg (\v -> mempty {ghcPath = pure v}) "GHC") "use this GHC"
  ]

main :: IO ()
main = do
  (opts', _, errs) <- getOpt RequireOrder options <$> getArgs
  for_ errs $ \err -> do
    hPutStrLn stderr err

  let opts = mconcat opts'
      ghc = fromMaybe "ghc" $ getLast (ghcPath opts)

  compilerId <- ("ghc" ++) . trim <$> readCreateProcess (proc ghc ["--print-project-version"]) ""
  packagedb <- trim <$> readCreateProcess (proc ghc ["--print-global-package-db"]) ""

  entries <- readPackageDbEntries packagedb
  output <- for entries $ renderPackageInfo packagedb compilerId
  case getLast (outPath opts) of
    Nothing -> putStrLn $ unlines output
    Just outfn -> writeFile outfn $ unlines output

readPackageDbEntries :: FilePath -> IO [IPI.InstalledPackageInfo]
readPackageDbEntries packagedb = do
  (errs, ipis) <-
    partitionEithers
      <$> do
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

renderPackageInfo :: FilePath -> String -> IPI.InstalledPackageInfo -> IO String
renderPackageInfo packagedb compilerId IPI.InstalledPackageInfo {..} = do
  let pkgroot0 = takeDirectory packagedb
      -- NOTE: this assumes ${pkgroot} is always at the beginning of the path
      expandPkgRoot dir = fromMaybe dir $ fmap (pkgroot0 </>) $ stripPrefix "${pkgroot}/" dir

  let -- FIXME: the file extensions should be platform dependent
      dynamicLibName name
        | "C" `isPrefixOf` name = "lib" ++ drop 1 name ++ ".so"
        | otherwise = "lib" ++ name ++ "-" ++ compilerId ++ ".so"
      staticLibName name
        | "C" `isPrefixOf` name = "lib" ++ drop 1 name ++ ".a"
        | otherwise = "lib" ++ name ++ ".a"

  let normaliseDir dir =
        ("lib" </>) . makeRelative pkgroot0 <$> canonicalizePath (expandPkgRoot dir)

  db <- normaliseDir packagedb
  cxxHeaderDirs <- traverse normaliseDir includeDirs
  staticLibDirs <- traverse normaliseDir libraryDirsStatic
  dynamicLibDirs <- traverse normaliseDir libraryDynDirs
  importDirs' <- traverse normaliseDir importDirs

  return $
    render $
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

quoted :: String -> Doc
quoted = text . show

quotedPretty :: (Pretty a) => a -> Doc
quotedPretty = quoted . prettyShow

data Label a = Label a

instance (Pretty a) => Pretty (Label a) where
  pretty (Label a) = ":" <> pretty a

--
-- Other
--

trim :: String -> String
trim = dropWhile isSpace . dropWhileEnd isSpace
