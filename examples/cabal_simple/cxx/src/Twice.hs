module Twice (twice) where

import Foreign.C.Types (CInt (..))

foreign import ccall unsafe "hs_twice" c_twice :: CInt -> CInt

twice :: Int -> Int
twice = fromIntegral . c_twice . fromIntegral
