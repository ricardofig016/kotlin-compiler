module Main where

import           Lexer
import           Parser

main :: IO ()
main = do
  -- input <- getLine
  input <- readFile "./../tests/input2.kt"
  let tokens = alexScanTokens input
  let ast = parse tokens
  print ast
  -- let result = parse $ alexScanTokens input
  -- print result
