module Main where

import           Lexer              (alexScanTokens)
import           Parser             (Type (..), parse)
import           SymbolTableManager (appendId, closeScope, initStack, openScope,
                                     printStack)
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
  -- printTokens tokens file
  -- parsing
  let ast = parse tokens
  -- printAST ast file
  -- symbol table example usage
  let stack = initStack -- initialize the empty stack with an empty symbol table
  let stack' = appendId "x" IntType stack -- this appends an identifier "x" to the stack as an Int
  let stack'' = appendId "x" BooleanType stack' -- this overwrites the type of "x" to Boolean (on scope 0)
  let stack''' = openScope stack'' -- open a new scope (for blocks) (the variables from this scope will be under "Scope 1:")
  let stack'''' = appendId "x" IntType stack''' -- this "x" does not overwrite the previous "x" because it is in a different scope
  let stack''''' = appendId "y" IntType stack'''' -- this appends an identifier "y" to the stack as an Int, in the same scope as the previous "x"
  -- let stack'''''' = closeScope stack''''' -- close the current scope (this will remove "x" and "y" from the stack) (its commented out so that we can see "x" and "y" in the output)
  printStack stack''''' file -- change this if you uncomment the line above
  -- before processing every statement, you should call "update" with the statement and the current stack.  this function will check if the statement is a VarDecl or a ValDecl and then update the stack with the new id and type
  -- alternatively, you can check yourself if the statement is a VarDecl or a ValDecl and then call "appendId" with the id and type
  -- both "update" and "appendId" will only add the id to the stack if it is not already in the table of the current scope, otherwise it will update the type of the id that is already in the table
  -- if you want to search for an id in the stack, you can call "searchId" with the id, this will return a Maybe Type, if the id is not in the stack, it will return Nothing, otherwise it will return Just t, where t is the type of the id
  -- the "searchId" function will search for the id from the top of the stack to the bottom, so it will return the type of the id that is in the scope closest to the top of the stack (the most recent scope)
  -- you should call "openScope" at the start of every block and "closeScope" at the end of every block (except for the global scope (main function))

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
