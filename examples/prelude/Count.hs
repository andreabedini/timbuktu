module Main (main) where

import qualified Data.Map as Map

main :: IO ()
main = print (Map.toList (Map.fromListWith (+) [(w, 1 :: Int) | w <- words "a b a c b a"]))
