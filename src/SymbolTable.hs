module SymbolTable where

import           Data.Map (Map, toList)
import qualified Data.Map as Map
import           Parser   (Type (..))

type Temp = String
type Mutable = Bool

data SymbolTableInfo = DATATEMP Temp | DATATYPE Type Mutable
  deriving(Show)

-- Define an symbol table as a Map of type -> (key: String, value: Type) 
type SymbolTable = Map String SymbolTableInfo

-- Initialize an empty symbol table
initializeSymbolTable :: SymbolTable
initializeSymbolTable = Map.empty

-- Insert a new entry (identifier, type) into the symbol table
-- If the identifier already exists, the existing entry is replaced
insertNewEntry :: String -> SymbolTableInfo -> SymbolTable -> SymbolTable
insertNewEntry identifier info table = Map.insert identifier info table

-- Search for an identifier in the symbol table
search :: String -> SymbolTable -> Maybe SymbolTableInfo
search identifier table = Map.lookup identifier table

-- print a symbol table to a file
printTable :: SymbolTable -> FilePath -> IO ()
printTable table file = do
  appendFile file (unlines $ map show (toList table))