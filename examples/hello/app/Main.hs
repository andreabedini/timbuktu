module Main (main) where

import Hello

main :: IO ()
main = do
  greeting >>= putStrLn
  putStrLn ("The answer is " ++ show answer)
  putStrLn spliced
  putStrLn ("Embedded: " ++ embedded)
