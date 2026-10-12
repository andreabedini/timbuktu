module Main (main) where

import Language.C (parseC, pretty)
import Language.C.Data.InputStream (inputStreamFromString)
import Language.C.Data.Position (nopos)

-- Parse a bit of C and print it back.
main :: IO ()
main =
  case parseC (inputStreamFromString "int answer(void){return 6*7;}") nopos of
    Left err -> error (show err)
    Right ast -> print (pretty ast)
