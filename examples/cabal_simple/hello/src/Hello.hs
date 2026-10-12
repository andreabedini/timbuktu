{-# LANGUAGE CPP #-}
{-# LANGUAGE TemplateHaskell #-}

module Hello (greeting, answer, spliced, embedded) where

import Data.Version (showVersion)
import Hello.Internal (c_answer)
import Hello.Sizes (answerFromHeader)
import Hello.TH (embedGreeting, spliceLocation)
import Paths_hello (getDataFileName, version)

#if !MIN_VERSION_base(4,8,0)
#error "cabal_macros.h is not doing its job"
#endif

-- | Read from a data file at run time.
greeting :: IO String
greeting = do
  file <- getDataFileName "greeting.txt"
  text <- readFile file
  return (takeWhile (/= '\n') text ++ GREETING_SUFFIX ++ " (hello-" ++ showVersion version ++ ")")

-- | Once from the C sources and once from hsc2hs.
answer :: (Int, Int)
answer = (fromIntegral c_answer, answerFromHeader)

-- | Runs code from the internal library at compile time.
spliced :: String
spliced = $(spliceLocation)

-- | Read from a data file at compile time, with a path relative to the
-- root of the package.
embedded :: String
embedded = $(embedGreeting)
