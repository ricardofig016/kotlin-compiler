module Main where

import           Lexer

-- import           Parser
main :: IO ()
main = do
  -- input <- getLine
  input <- readFile "./../tests/input1.kt"
  let result = alexScanTokens input
  -- let result = parse $ alexScanTokens input
  print result
