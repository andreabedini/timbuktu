{-# OPTIONS_GHC -Wall #-}

import Data.ByteString qualified as B
import Data.ByteString.Lazy qualified as BL
import Data.Foldable (for_)
import Distribution.Fields.Field (fieldLinesToString, sectionArgsToString)
import Distribution.Fields.Parser
import Distribution.Parsec.Position (Position)
import Distribution.Utils.Json
import Distribution.Utils.String (decodeStringUtf8)
import System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  for_ args $ \arg -> do
    contents <- B.readFile arg
    let fields = either (error . show) id $ readFields contents
    BL.putStr $ renderJson $ fieldsToJson fields

fieldsToJson :: [Field Position] -> Json
fieldsToJson = JsonArray . map fieldToJson

fieldToJson :: Field Position -> Json
fieldToJson (Field (Name _pos name) fieldlines) =
  JsonObject
    [ "field" .= JsonString (decodeStringUtf8 $ B.unpack name),
      "content" .= JsonString (fieldLinesToString fieldlines)
    ]
fieldToJson (Section (Name _pos name) args fields) =
  JsonObject
    [ "section" .= JsonString (decodeStringUtf8 $ B.unpack name),
      "args" .= JsonString (sectionArgsToString args),
      "content" .= fieldsToJson fields
    ]
