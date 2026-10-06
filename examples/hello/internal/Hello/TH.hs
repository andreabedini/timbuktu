module Hello.TH (spliceLocation, embedGreeting) where

import Language.Haskell.TH

spliceLocation :: Q Exp
spliceLocation = do
  loc <- location
  stringE ("spliced into " ++ loc_module loc)

embedGreeting :: Q Exp
embedGreeting = runIO (readFile "data/greeting.txt") >>= stringE . takeWhile (/= '\n')
