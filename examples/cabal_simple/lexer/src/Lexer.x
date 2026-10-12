{
module Lexer (Token (..), alexScanTokens) where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]

tokens :-

  $white+ ;
  $digit+ { \s -> TInt (read s) }
  $alpha+ { \s -> TWord s }

{
data Token = TInt Int | TWord String
  deriving (Eq, Show)
}
