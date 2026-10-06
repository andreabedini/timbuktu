module Main (main) where

import Report (report)

main :: IO ()
main = mapM_ putStrLn report
