module Hello.Sizes (answerFromHeader) where

#include "hello.h"

answerFromHeader :: Int
answerFromHeader = #{const HELLO_ANSWER}
