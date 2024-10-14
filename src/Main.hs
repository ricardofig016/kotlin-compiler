module Main where

import           Lexer
import           Parser

main :: IO ()
main = do
  input <- getLine
  let result = parse $ alexScanTokens input
  print result
