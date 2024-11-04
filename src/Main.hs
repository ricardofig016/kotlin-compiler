module Main where

import           Lexer
import           Parser

main :: IO ()
main = do
  input <- readFile "inputs/input1.kt"
  let tokens = alexScanTokens input
  let ast = parse tokens
  -- write to output file
  let file = "output.txt"
  writeFile file "Tokens:\n"
  appendFile file (show tokens)
  appendFile file "\n\n"
  appendFile file "AST:\n"
  appendFile file (show ast)
  appendFile file "\n\n"
  -- let result = parse $ alexScanTokens input
  -- print result
