module Main (main) where

import Control.Monad (unless)
import Hello
import System.Exit (exitFailure)

main :: IO ()
main = do
  text <- greeting
  unless (answer == (42, 42) && text == embedded ++ "! (hello-0.1.0.0)") $ do
    putStrLn ("unexpected: " ++ show (answer, text, embedded))
    exitFailure
  putStrLn "ok"
