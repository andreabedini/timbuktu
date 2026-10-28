{-# LANGUAGE TemplateHaskell #-}

module Main (main) where

import Control.Monad (unless)
import Factor (factor)
import Language.Haskell.TH.Syntax (lift)
import System.Exit (exitFailure)
import Twice (twice)

main :: IO ()
main = do
  -- At compile time too: the splice runs the C++ code in GHC.
  let spliced = $(lift (twice 21))
  unless (twice 21 == 21 * factor && spliced == (42 :: Int)) $ do
    putStrLn ("unexpected: " ++ show (twice 21, spliced))
    exitFailure
  putStrLn "ok"
