{-# OPTIONS_GHC -Wall #-}

-- | Register a library in a package db of its own: Cabal's `register` step.
--
-- > register DB UNIT_ID CONF ABI_HASH GHC_PKG [ARG]...
--
-- CONF is the InstalledPackageInfo of the unit. It refers to the outputs of
-- other actions (interface files, libraries, ...) by their path from the root
-- of the project, written as ${projectroot}/path. GHC knows nothing about
-- that, but it knows ${pkgroot}, the directory the package db is in: we
-- express one in terms of the other, so that the registration is valid from
-- any working directory and wherever the project is. ABI_HASH is a file with
-- the ABI hash of the library, empty when it has no modules. The package db
-- is then made usable with `GHC_PKG [ARG]... recache`.
module Main (main) where

import Data.List (dropWhileEnd, isPrefixOf)
import System.Directory (createDirectoryIfMissing, removePathForcibly)
import System.Environment (getArgs)
import System.Exit (die)
import System.FilePath (joinPath, splitDirectories, takeDirectory, (<.>), (</>))
import System.Process (callProcess)

main :: IO ()
main = do
    args <- getArgs
    (db, unitId, conf, abiHashFile, ghcPkg, ghcPkgArgs) <- case args of
        db : unitId : conf : abiHash : ghcPkg : rest -> pure (db, unitId, conf, abiHash, ghcPkg, rest)
        _ -> die "usage: register DB UNIT_ID CONF ABI_HASH GHC_PKG [ARG]..."

    -- DB is relative to the root of the project, which is where we are.
    let up = joinPath [".." | _ <- splitDirectories (takeDirectory db)]
    registration <- replace "${projectroot}" ("${pkgroot}" </> up) <$> readFile conf
    abiHash <- dropWhileEnd (== '\n') <$> readFile abiHashFile
    createDirectoryIfMissing True db
    writeFile (db </> unitId <.> "conf") $
        registration
            ++ "\n"
            ++ (if null abiHash then "" else "abi: " ++ abiHash ++ "\n")
    callProcess ghcPkg (ghcPkgArgs ++ ["recache", "--package-db=" ++ db])

    -- Not part of the package db, and it would make the output look
    -- different every time.
    removePathForcibly (db </> "package.cache.lock")

replace :: String -> String -> String -> String
replace from to = go
  where
    go [] = []
    go s@(c : rest)
        | from `isPrefixOf` s = to ++ go (drop (length from) s)
        | otherwise = c : go rest
