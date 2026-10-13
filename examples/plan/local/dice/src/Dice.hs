module Dice (rolls) where

import System.Random (mkStdGen, randomRs)

-- | @n@ rolls of a six-sided die, from the seed @seed@.
rolls :: Int -> Int -> [Int]
rolls seed n = take n (randomRs (1, 6) (mkStdGen seed))
