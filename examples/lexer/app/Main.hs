module Main (main) where

import Lexer

main :: IO ()
main = print (alexScanTokens "buck2 builds 42 things")
