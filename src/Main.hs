module Main where

import           Lexer              (alexScanTokens)
import           Parser             (Type (..), parse)
import           SymbolTable (checkAST)
import           System.Environment (getArgs)

main :: IO ()
main = do
  -- input
  args <- getArgs
  let x = read (head args) :: Int
  let inputFile = "inputs/input" ++ show x ++ ".kt"
  input <- readFile inputFile
  -- output
  let file = "output.txt"
  writeFile file "" -- clear file content
  -- lexing
  let tokens = alexScanTokens input
  printTokens tokens file
  -- parsing
  let ast = parse tokens
  printAST ast file
  print (checkAST ast)

printTokens :: Show a => a -> FilePath -> IO ()
printTokens tokens file = do
  let prettyTokens = prettifyTokens (show tokens)
  appendFile file "Tokens:\n"
  appendFile file prettyTokens
  appendFile file "\n\n"

prettifyTokens :: String -> String
prettifyTokens input = go input ""
  where
    go :: String -> String -> String
    go [] acc = acc
    go ('S':'E':'M':'I':'C':'O':'L':'O':'N':',':cs) acc =
      go cs (acc ++ "SEMICOLON,\n")
    go ('L':'B':'R':'A':'C':'E':',':cs) acc = go cs (acc ++ "LBRACE,\n")
    go (c:cs) acc = go cs (acc ++ [c])

printAST :: Show a => a -> FilePath -> IO ()
printAST ast file = do
  let str = prettifyAST (show ast)
  appendFile file "AST:\n"
  appendFile file str
  appendFile file "\n\n"

prettifyAST :: String -> String
prettifyAST input = go input 0 ""
  where
    go :: String -> Int -> String -> String
    go [] _ acc = acc
    go ('[':']':cs) openBrackets acc = go cs openBrackets (acc ++ "[]")
    go (c:cs) openBrackets acc
      | c == '[' =
        go
          cs
          (openBrackets + 1)
          (acc ++ "[\n" ++ replicate (openBrackets + 1) '\t')
      | c == ']' =
        go
          cs
          (openBrackets - 1)
          (acc ++ "\n" ++ replicate (openBrackets - 1) '\t' ++ "]")
      | c == ',' =
        go cs openBrackets (acc ++ ",\n" ++ replicate openBrackets '\t')
      | otherwise = go cs openBrackets (acc ++ [c])
