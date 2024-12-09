module SemanticAnalyzer where

import           SymbolTable (initializeSymbolTable, search, insertNewEntry, SymbolTable, SymbolTableInfo (..), Mutable)
import           Parser      (Type (..), Exp (..), Statement (..), Block (..))


generateSymbolTable :: SymbolTable -> Block -> SymbolTable
generateSymbolTable table (Statements []) = table
generateSymbolTable table (Statements ((VarDecl iden typ _):rest)) = generateSymbolTable (insertNewEntry iden (DATATYPE typ True) table) (Statements rest)
generateSymbolTable table (Statements ((ValDecl iden typ _):rest)) = generateSymbolTable (insertNewEntry iden (DATATYPE typ False) table) (Statements rest)
generateSymbolTable table (Statements (_:rest)) = generateSymbolTable table (Statements rest)

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
checkExpr env (Id iden) = case (search iden env) of
  Nothing -> error "undeclared var"
  Just (DATATYPE t _) -> t
  Just (DATATEMP _) -> error "symbolTable malformatted"
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
checkExpr _ (ReadlnStmt) = StringType

checkStm :: SymbolTable -> Statement -> Bool
checkStm env (VarDecl iden _ expr) 
  = case search iden env of
      Just (DATATYPE typ _) -> if checkExpr env expr == typ
                    then True
                    else error "type error in vardecl"
      Just (DATATEMP _) -> error "symbolTable malformatted"
      Nothing -> error "undeclared variable"  
checkStm env (ValDecl iden _ expr)
  = case search iden env of
      Just (DATATYPE typ _) -> if checkExpr env expr == typ
                    then True
                    else error "type error in valdecl"
      Just (DATATEMP _) -> error "symbolTable malformatted"
      Nothing -> error "undeclared variable"  
checkStm env (Assignment iden expr)
  = case search iden env of
      Just (DATATYPE typ canAssign) -> if not canAssign 
                    then error "val cannot be reassigned!" 
                    else if checkExpr env expr == typ
                    then True
                    else error "type error in assign"
      Just (DATATEMP _) -> error "symbolTable malformatted"
      Nothing -> error "undeclared variable"
checkStm _ (PrintStmt _) = True
checkStm env (WhileStmt expr block)
  = let tycond = checkExpr env expr
        check = checkBlock env block
    in if tycond == BooleanType && check
      then True
      else error "type error in while"
checkStm env (IfElseStmt expr block1 block2)
  = let tycond = checkExpr env expr
        check1 = checkBlock (generateSymbolTable env block1) block1
        check2 = checkBlock (generateSymbolTable env block2) block2
    in if tycond == BooleanType && check1 && check2
      then True
      else error "type error in if then else"
checkStm env (IfStmt expr block)
  = let tycond = checkExpr env expr
        check = checkBlock (generateSymbolTable env block) block
    in if tycond == BooleanType && check
      then True
      else error "type error in if then"

checkBlock :: SymbolTable -> Block -> Bool
checkBlock _ (Statements []) = True
checkBlock env (Statements (stm:rest)) = 
  (checkStm env stm) && (checkBlock env (Statements rest))

checkAST :: Block -> Bool
checkAST (Statements []) = True
checkAST block = checkBlock (generateSymbolTable initializeSymbolTable block) block