module Main (main) where

import Hello (answer, embedded, spliced)

main :: IO ()
main = do
  putStrLn ("The answer is " ++ show answer)
  putStrLn spliced
  putStrLn ("Embedded: " ++ embedded)
