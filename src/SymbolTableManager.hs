module SymbolTableManager where

import           Data.Map (Map, toList)
import qualified Data.Map as Map
import           Parser   (Statement (..), Type)

type SymbolTable = Map String Type

data SymbolTableStack = SymbolTableStack
  { stack_ :: [SymbolTable]
  } deriving (Show)

-- initialize the symbol table stack with an empty symbol table
initStack :: SymbolTableStack
initStack = SymbolTableStack [Map.empty]

-- append an identifier and its type to the current symbol table (if the identifier is already in the table, update its type)
appendId :: String -> Type -> SymbolTableStack -> SymbolTableStack
appendId id_ t (SymbolTableStack (table:rest)) =
  SymbolTableStack (Map.insert id_ t table : rest)
appendId _ _ (SymbolTableStack []) =
  error "Cannot append identifier to an empty stack"

-- search for an identifier in the symbol table stack, from top to bottom and return its type
searchId :: String -> SymbolTableStack -> Maybe Type
searchId _ (SymbolTableStack []) = Nothing
searchId id_ (SymbolTableStack (table:rest)) =
  case Map.lookup id_ table of
    Just t  -> Just t
    Nothing -> searchId id_ (SymbolTableStack rest)

-- create a new scope (create a table at the top of the stack)
openScope :: SymbolTableStack -> SymbolTableStack
openScope (SymbolTableStack stack) = SymbolTableStack (Map.empty : stack)

-- close the current scope (remove the top table from the stack)
closeScope :: SymbolTableStack -> SymbolTableStack
closeScope (SymbolTableStack (_:rest)) = SymbolTableStack rest
closeScope (SymbolTableStack []) = error "Cannot close scope on an empty stack"

-- update the stack given a statement
update :: Statement -> SymbolTableStack -> SymbolTableStack
update (VarDecl id_ t _) stack = appendId id_ t stack
update (ValDecl id_ t _) stack = appendId id_ t stack
update _ stack                 = stack

-- print the symbol table stack to a file
printStack :: SymbolTableStack -> FilePath -> IO ()
printStack (SymbolTableStack stack) file = do
  appendFile file "Symbol Table Stack:\n"
  mapM_
    (\(i, table) -> do
       let i' = i :: Int
       appendFile file ("Scope " ++ show i' ++ ":\n")
       printTable table file)
    (zip [0 ..] stack)

-- print a symbol table to a file
printTable :: SymbolTable -> FilePath -> IO ()
printTable table file = do
  appendFile file (unlines $ map show (toList table))
