{-# LANGUAGE ImportQualifiedPost #-}
{-# LANGUAGE OverloadedStrings #-}
{-# OPTIONS_GHC -Wall #-}

import Control.Monad (filterM)
import Control.Monad.IO.Class (MonadIO (..))
import Control.Monad.Trans.Maybe (hoistMaybe, runMaybeT)
import Data.Foldable (for_)
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
import System.Directory (canonicalizePath, doesDirectoryExist, doesFileExist)
import System.Environment (getArgs)
import System.FilePath (makeRelative, takeFileName, (</>))
import System.IO (hPutStrLn, stderr)
import Text.PrettyPrint
import Prelude hiding ((<>))

data Opts = Opts
  { outPath :: Maybe FilePath,
    ghcPath :: FilePath,
    prefix :: Maybe FilePath
  }

options :: [OptDescr (Opts -> Opts)]
options =
  [ Option ['w'] ["ghc"] (ReqArg (\v opts -> opts {ghcPath = v}) "GHC") "use this GHC",
    Option ['o'] ["outdir"] (ReqArg (\v opts -> opts {outPath = Just v}) "FILE") "output FILE",
    Option ['p'] ["prefix"] (ReqArg (\v opts -> opts {prefix = Just v}) "FILE") "output FILE"
  ]

defaultOpts :: Opts
defaultOpts =
  Opts
    { outPath = Nothing,
      ghcPath = "ghc",
      prefix = Nothing
    }

main :: IO ()
main = do
  (opts', _, errs) <- getOpt RequireOrder options <$> getArgs
  for_ errs (hPutStrLn stderr)

  let Opts {outPath, ghcPath, prefix} = appEndo (foldMap Endo opts') defaultOpts

  (compiler, platform, progdb) <- configCompilerEx (Just GHC) (Just ghcPath) Nothing defaultProgramDb Verbosity.normal

  iidx <- getPackageDBContents Verbosity.normal compiler GlobalPackageDB progdb

  entries <- for (Index.allPackages iidx) $ \ipi -> do
    let normalisePath :: FilePath -> IO FilePath
        normalisePath dir = fmap (fromMaybe dir) $ runMaybeT $ do
          pkgRoot' <- hoistMaybe (pkgRoot ipi)
          dir' <- liftIO $ makeRelative pkgRoot' <$> canonicalizePath (pkgRoot' </> dir)
          return $ maybe id (</>) prefix $ "lib" </> dir'

    let db = maybe id (</>) prefix "lib/package.conf.d"

    staticLibs <-
      filterM
        doesFileExist
        [ dir </> mkGenericStaticLibName lib
          | dir <- libraryDirsStatic ipi,
            lib <- hsLibraries ipi
        ]
        >>= traverse normalisePath

    profiledStaticLibs <-
      filterM
        doesFileExist
        [ dir </> mkGenericStaticLibName (lib ++ "_p")
          | dir <- libraryDirsStatic ipi,
            lib <- hsLibraries ipi
        ]
        >>= traverse normalisePath

    sharedLibs <-
      filterM
        doesFileExist
        [ dir </> mkGenericSharedBundledLibName platform (compilerId compiler) lib
          | dir <- libraryDynDirs ipi,
            lib <- hsLibraries ipi
        ]
        >>= traverse normalisePath

    includeDirs' <- filterM doesDirectoryExist (includeDirs ipi) >>= traverse normalisePath
    importDirs' <- filterM doesDirectoryExist (importDirs ipi) >>= traverse normalisePath

    return $
      vcat
        [ rule
            "haskell_prebuilt_library"
            [ ("name", Quoted $ prettyShow (pkgName (sourcePackageId ipi))),
              ("version", Quoted $ prettyShow (pkgVersion (sourcePackageId ipi))),
              ("id", Quoted $ prettyShow (installedUnitId ipi)),
              ("db", Quoted db),
              ("deps", List [Label $ prettyShow d | d <- depends ipi]),
              ("import_dirs", List [Quoted dir | dir <- importDirs']),
              ("shared_libs", Dict [(takeFileName lib, Quoted lib) | lib <- sharedLibs]),
              ("static_libs", List $ map Quoted staticLibs),
              ("profiled_static_libs", List $ map Quoted profiledStaticLibs),
              ("cxx_header_dirs", List $ map Quoted includeDirs'),
              ("exported_linker_flags", List $ map Quoted (ldOptions ipi)),
              ("visibility", List ["PUBLIC"])
            ],
          rule
            "alias"
            [ ("name", Quoted $ prettyShow (installedUnitId ipi)),
              ("actual", Label $ prettyShow (pkgName (sourcePackageId ipi)))
            ]
        ]

  let toolchain = renderToolchain (compilerId compiler) iidx

  case outPath of
    Just p -> do
      writeFile p $ render $ vcat toolchain $$ vcat entries
      putStrLn $ "Written output to " ++ p
    Nothing -> putStr $ render $ vcat toolchain $$ vcat entries

renderToolchain :: CompilerId -> Index.InstalledPackageIndex -> [Doc]
renderToolchain compilerId iidx =
  [ load "@root//rules/haskell:toolchain.bzl" ["haskell_toolchain"],
    rule
      "haskell_toolchain"
      [ ("name", "haskell"),
        ("compiler", Quoted $ prettyShow compilerId),
        ("linker", Quoted $ prettyShow compilerId),
        ("packager", Quoted $ "ghc-pkg" ++ drop 3 (prettyShow compilerId)),
        ("haddock", Quoted $ "haddock" ++ drop 3 (prettyShow compilerId)),
        ("packages", List [Label $ prettyShow $ pkgName $ sourcePackageId p | p <- Index.allPackages iidx]),
        ("visibility", List ["PUBLIC"])
      ]
  ]

--
-- Pretty print utilities
--

data Term = List [Term] | Dict [(String, Term)] | Quoted String | Label String

instance IsString Term where
  fromString = Quoted

instance Pretty Term where
  pretty = prettyWithPrefix empty

prettyWithPrefix :: Doc -> Term -> Doc
prettyWithPrefix prefix (List ts) =
  cat
    [ prefix <+> lbrack,
      nest 4 $ sep $ punctuate comma $ map pretty ts,
      rbrack
    ]
prettyWithPrefix prefix (Dict kvs) =
  cat
    [ prefix <+> lbrace,
      nest 4 $ sep $ punctuate comma [prettyWithPrefix (pretty (Quoted k) <> ":") v | (k, v) <- kvs],
      rbrace
    ]
prettyWithPrefix prefix (Quoted s) =
  prefix <+> text (show s)
prettyWithPrefix prefix (Label s) =
  prefix <+> text (show (':' : s))

rule :: String -> [(String, Term)] -> Doc
rule n args =
  cat
    [ text n <> lparen,
      nest 4 $ sep $ punctuate comma [prettyWithPrefix (text k <+> "=") v | (k, v) <- args],
      rparen
    ]
    <> "\n"

load :: String -> [String] -> Doc
load m names =
  text "load"
    <> parens (pretty (Quoted m) <> "," <+> hsep (punctuate comma $ map (pretty . Quoted) names))
    $+$ ""
