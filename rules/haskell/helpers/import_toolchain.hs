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
import Data.List (isPrefixOf, stripPrefix)
import Data.List.NonEmpty (NonEmpty (..))
import Data.List.NonEmpty qualified as NE
import Data.Maybe (fromMaybe)
import Data.Monoid (Endo (..))
import Data.String
import Data.Traversable (for)
import Distribution.InstalledPackageInfo qualified as IPI
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

    info <- readSettings <$> readCreateProcess (proc ghcPath ["--info"]) ""
    let ghcVersion = fromMaybe (error "Missing \"Project version\"") $ lookup "Project version" info
        libDir = fromMaybe (error "Missing \"LibDir\"") $ lookup "LibDir" info
        compilerId = "ghc-" ++ ghcVersion

    outdir <- canonicalizePath $ fromMaybe ("toolchains/haskell/" ++ compilerId) outPath
    createDirectoryIfMissing True outdir
    putStrLn $ "Output directory: " ++ outdir

    let outLibDir = outdir </> "lib"
    mkDirLink libDir outLibDir
    putStrLn $ "Linking " ++ libDir ++ " to " ++ outLibDir

    let globalPackageDb = libDir </> "package.conf.d"
    entries <- map (\ipi -> ipi{IPI.pkgRoot = Just libDir}) <$> readPackageDbEntries globalPackageDb
    output <- traverse (renderPackageInfo ghcVersion) entries

    writeFile (outdir </> "BUCK") $
        -- renderStyle (style{mode = ZigZagMode}) $
        render $
            vcat (map pretty (renderToolchain compilerId ghcPath)) $$ vcat output
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

renderToolchain :: String -> FilePath -> [Doc]
renderToolchain compilerId path =
    [ load "@root//rules/haskell:toolchain.bzl" ["haskell_toolchain"]
    , rule
        "haskell_toolchain"
        [ ("name", [quoted compilerId])
        , ("compiler", [quoted path])
        , ("linker", [quoted path])
        , ("packager", ["FIXME"])
        , ("haddock", ["FIXME"])
        , ("visibility", ["PUBLIC"])
        ]
    ]

renderPackageInfo :: String -> IPI.InstalledPackageInfo -> IO Doc
renderPackageInfo ghcVersion IPI.InstalledPackageInfo{..} = do
    let normaliseDir :: FilePath -> IO FilePath
        normaliseDir dir = fmap (fromMaybe dir) $ runMaybeT $ do
            pkgRoot' <- hoistMaybe pkgRoot
            dir' <- hoistMaybe $ stripPrefix "${pkgroot}/" dir
            dir'' <- liftIO $ makeRelative pkgRoot' <$> canonicalizePath (pkgRoot' </> dir')
            return $ "lib" </> dir''

    let
        -- FIXME: the file extensions should be platform dependent
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

    let r1 =
            rule
                "haskell_prebuilt_library"
                [ ("name", [quotedPretty installedUnitId])
                , ("version", [quotedPretty (pkgVersion sourcePackageId)])
                , ("id", [quotedPretty installedUnitId])
                , ("db", [quoted db])
                , ("deps", [list empty [quotedPretty (Label d) | d <- depends]])
                , ("import_dirs", [quoted dir | dir <- importDirs'])
                ,
                    ( "shared_libs"
                    , [ dict empty [(dynamicLibName hsLib, [quoted $ dynamicLibDir </> dynamicLibName hsLib])]
                      | hsLib <- hsLibraries
                      , dynamicLibDir <- dynamicLibDirs
                      ]
                    )
                ,
                    ( "static_libs"
                    ,
                        [ list
                            empty
                            [ quoted $ staticLibDir </> staticLibName hsLib
                            | hsLib <- hsLibraries
                            , staticLibDir <- staticLibDirs
                            ]
                        ]
                    )
                , ("cxx_header_dirs", [quoted hdr | hdr <- cxxHeaderDirs])
                , ("exported_linker_flags", [quoted opt | opt <- ldOptions])
                , ("visibility", ["PUBLIC"])
                ]

    return $ pretty r1

--
-- Pretty print utilities
--

dict :: Doc -> [(String, [Doc])] -> Doc
dict prefix kvs =
    stuff
        (prefix <+> lbrace)
        [stuff (quoted k <> ":") v | (k, v) <- kvs]
        <> rbrace

-- (prefix <> lbrace)
--     $+$ (nest 2 $ sep $ punctuate comma $ --     $+$ rbrace

list :: Doc -> [Doc] -> Doc
list prefix ts = stuff (prefix <> lbrack) ts $+$ rbrack

rule :: String -> [(String, [Doc])] -> Doc
rule n args =
    (text n <> lparen)
        $+$ (nest 2 $ sep $ punctuate comma [stuff (text k <+> "=") v | (k, v) <- args])
        $+$ rparen

stuff :: Doc -> [Doc] -> Doc
stuff prefix ts = case NE.nonEmpty ts of
    Nothing -> empty
    Just (h :| t) -> (prefix <> h) $+$ (nest 2 $ sep $ punctuate comma $ t)

load :: String -> [String] -> Doc
load m names =
    text "load(" <> quoted m <> "," <+> (hsep $ punctuate comma $ map quoted names) <> ")" <> "\n"

quoted :: String -> Doc
quoted = text . show

quotedPretty :: (Pretty a) => a -> Doc
quotedPretty = quoted . prettyShow

data Label a = Label a

instance (Pretty a) => Pretty (Label a) where
    pretty (Label a) = ":" <> pretty a
