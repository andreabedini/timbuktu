{-# LANGUAGE ForeignFunctionInterface #-}

module Hello.Internal (c_answer) where

import Foreign.C.Types (CInt (..))

foreign import ccall unsafe "hello.h hello_answer" c_answer :: CInt
