module Report (report) where

import Hello (answer, embedded, spliced)

-- | What the library of //examples/cabal_simple/hello has to say.
report :: [String]
report =
  [ "The answer is " ++ show answer
  , spliced
  , "Embedded: " ++ embedded
  ]
