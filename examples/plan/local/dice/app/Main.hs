module Main (main) where

import Dice (rolls)

main :: IO ()
main = putStrLn (unwords (map show (rolls 42 5)))
