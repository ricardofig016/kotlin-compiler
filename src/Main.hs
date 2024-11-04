module Main where

import           Lexer              (alexScanTokens)
import           Parser             (parse)
import           System.Environment (getArgs)

main :: IO ()
main = do
  args <- getArgs
  let x = read (head args) :: Int
  let inputFile = "inputs/input" ++ show x ++ ".kt"
  input <- readFile inputFile
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
