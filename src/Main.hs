module Main where

import           Lexer
import           Parser

main :: IO ()
main = do
  input <- readFile "./../tests/input2.kt"
  -- lexer
  let tokens = alexScanTokens input
  writeFile "output.txt" "Tokens:\n"
  appendFile "output.txt" (show tokens)
  appendFile "output.txt" "\n\n"
  -- parser
  let ast = parse tokens
  appendFile "output.txt" "AST:\n"
  appendFile "output.txt" (show ast)
  appendFile "output.txt" "\n\n"
  -- let result = parse $ alexScanTokens input
  -- print result
