module SymbolTable where

import           Data.Map (Map, toList)
import qualified Data.Map as Map
import           Parser   (Statement (..), Exp (..), Type (..), Block (..))

-- Define an symbol table as a Map of type -> (key: String, value: Type) 
type SymbolTable = Map String Type

-- Initialize an empty symbol table
initializeSymbolTable :: SymbolTable
initializeSymbolTable = Map.empty

generateSymbolTable :: SymbolTable -> Block -> SymbolTable
generateSymbolTable table (Statements []) = table
generateSymbolTable table (Statements ((VarDecl id typ _):rest)) = generateSymbolTable (insertNewEntry id typ table) (Statements rest)
generateSymbolTable table (Statements ((ValDecl id typ _):rest)) = generateSymbolTable (insertNewEntry id typ table) (Statements rest)
generateSymbolTable table (Statements (_:rest)) = generateSymbolTable table (Statements rest)

checkBlock :: SymbolTable -> Block -> Bool
checkBlock _ (Statements []) = True
checkBlock env (Statements (stm:rest)) = 
  (checkStm env stm) && (checkBlock env (Statements rest))

-- Insert a new entry (identifier, type) into the symbol table
-- If the identifier already exists, the existing entry is replaced
insertNewEntry :: String -> Type -> SymbolTable -> SymbolTable
insertNewEntry identifier typ table = Map.insert identifier typ table

-- Search for an identifier in the symbol table
search :: String -> SymbolTable -> Maybe Type
search identifier table = Map.lookup identifier table

-- print a symbol table to a file
printTable :: SymbolTable -> FilePath -> IO ()
printTable table file = do
  appendFile file (unlines $ map show (toList table))

checkAST :: Block -> Bool
checkAST (Statements []) = True
checkAST block = checkBlock (generateSymbolTable initializeSymbolTable block) block

numericTypes :: [Type]
numericTypes = [IntType, LongType, FloatType, DoubleType]

-- Define the function for checking valid arithmetic operations
resolveArithmeticTypes :: Type -> Type -> Maybe Type
resolveArithmeticTypes t1 t2
  | t1 == IntType && t2 == IntType = Just IntType
  | t1 == LongType && t2 == LongType = Just LongType
  | (t1 == IntType && t2 == FloatType) || (t1 == FloatType && t2 == IntType) = Just FloatType
  | (t1 == IntType && t2 == DoubleType) || (t1 == DoubleType && t2 == IntType) = Just DoubleType
  | (t1 == FloatType && t2 == FloatType) = Just FloatType
  | (t1 == FloatType && t2 == DoubleType) || (t1 == DoubleType && t2 == FloatType) = Just DoubleType
  | (t1 == DoubleType && t2 == DoubleType) = Just DoubleType
  | (t1 == LongType && t2 == FloatType) || (t1 == FloatType && t2 == LongType) = Just FloatType
  | (t1 == LongType && t2 == DoubleType) || (t1 == DoubleType && t2 == LongType) = Just DoubleType
  | otherwise = Nothing  -- Invalid operation for non-numeric types or incompatible types

checkExpr :: SymbolTable -> Exp -> Type
checkExpr _ (Num _) = IntType
checkExpr _ (Real _) = DoubleType
checkExpr env (Id id) = case (search id env) of
  Nothing -> error "undeclared var"
  Just t -> t
checkExpr _ (TruthValue _) = BooleanType
checkExpr _ (Letter _) = CharType
checkExpr _ (Sentence _) = StringType  
checkExpr env (Add e1 e2)
  = let t1 = checkExpr env e1
        t2 = checkExpr env e2
    in case resolveArithmeticTypes t1 t2 of
      Just typ -> typ
      Nothing -> error "type error in +"
checkExpr env (Sub e1 e2)
  = let t1 = checkExpr env e1
        t2 = checkExpr env e2
    in case resolveArithmeticTypes t1 t2 of
      Just typ -> typ
      Nothing -> error "type error in -"
checkExpr env (Mult e1 e2)
  = let t1 = checkExpr env e1
        t2 = checkExpr env e2
    in case resolveArithmeticTypes t1 t2 of
      Just typ -> typ
      Nothing -> error "type error in *"
checkExpr env (Div e1 e2)
  = let t1 = checkExpr env e1
        t2 = checkExpr env e2
    in case resolveArithmeticTypes t1 t2 of
      Just typ -> typ
      Nothing -> error "type error in /"
checkExpr env (Mod e1 e2)
  = let t1 = checkExpr env e1
        t2 = checkExpr env e2
    in case resolveArithmeticTypes t1 t2 of
      Just typ -> typ
      Nothing -> error "type error in %"
checkExpr env (Less e1 e2) = 
  let t1 = checkExpr env e1
      t2 = checkExpr env e2
  in if (t1 `elem` numericTypes && t2 `elem` numericTypes) || (t1 == CharType && t2 == CharType) || (t1 == StringType && t2 == StringType)
       then BooleanType
       else error "Type error in <"
checkExpr env (LessEqual e1 e2) = 
  let t1 = checkExpr env e1
      t2 = checkExpr env e2
  in if (t1 `elem` numericTypes && t2 `elem` numericTypes) || (t1 == CharType && t2 == CharType) || (t1 == StringType && t2 == StringType)
       then BooleanType
       else error "Type error in <"
checkExpr env (EqualTo e1 e2) = 
  let t1 = checkExpr env e1
      t2 = checkExpr env e2
  in if t1 == t2
       then BooleanType
       else error "Type error in =="
checkExpr env (NotEqual e1 e2) = 
  let t1 = checkExpr env e1
      t2 = checkExpr env e2
  in if t1 == t2
       then BooleanType
       else error "Type error in !="
checkExpr env (And e1 e2) = 
  let t1 = checkExpr env e1
      t2 = checkExpr env e2
  in if t1 == BooleanType && t2 == BooleanType
       then BooleanType
       else error "Type error in &&"
checkExpr env (Or e1 e2) = 
  let t1 = checkExpr env e1
      t2 = checkExpr env e2
  in if t1 == BooleanType && t2 == BooleanType
       then BooleanType
       else error "Type error in ||"
checkExpr env (Not e1) = 
  let t1 = checkExpr env e1
  in if t1 == BooleanType
       then BooleanType
       else error "Type error in !"
checkExpr env (ReadlnStmt) = StringType

checkStm :: SymbolTable -> Statement -> Bool
checkStm env (VarDecl id typ exp) 
  = case search id env of
      Just typ -> if checkExpr env exp == typ
                    then True
                    else error "type error in vardecl"
      Nothing -> error "undeclared variable"  
checkStm env (ValDecl id typ exp)
  = case search id env of
      Just typ -> if checkExpr env exp == typ
                    then True
                    else error "type error in valdecl"
      Nothing -> error "undeclared variable"  
checkStm env (Assignment id exp)
  = case search id env of
      Just typ -> if checkExpr env exp == typ
                    then True
                    else error "type error in assign"
      Nothing -> error "undeclared variable"
checkStm env (PrintStmt exp) = True
checkStm env (WhileStmt exp block)
  = let tycond = checkExpr env exp
        check = checkBlock env block
    in if tycond == BooleanType && check
      then True
      else error "type error in while"
checkStm env (IfElseStmt exp block1 block2)
  = let tycond = checkExpr env exp
        check1 = checkBlock (generateSymbolTable env block1) block1
        check2 = checkBlock (generateSymbolTable env block2) block2
    in if tycond == BooleanType && check1 && check2
      then True
      else error "type error in if then else"
checkStm env (IfStmt exp block)
  = let tycond = checkExpr env exp
        check = checkBlock (generateSymbolTable env block) block
    in if tycond == BooleanType && check
      then True
      else error "type error in if then"

