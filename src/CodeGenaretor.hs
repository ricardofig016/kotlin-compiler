module CodeGenaretor where

import           Control.Monad.State
import           Parser   (Statement (..), Exp (..), Block (..))
import           SymbolTable (search, insertNewEntry, initializeSymbolTable, SymbolTable, SymbolTableInfo (..))

data Instr = MOVE Temp Temp
           | MOVEI Temp Int
           | MOVER Temp Double
           | MOVEB Temp Bool
           | MOVES Temp String
           | OP BinOp Temp Temp Temp
           | LABEL Label
           | JUMP Label
           | COND Temp BinOp Temp Label Label
           | PRINT Temp
           | READLN Temp

instance Show Instr where
    show (MOVE src dest) = "MOVE " ++ show src ++ " " ++ show dest
    show (MOVEI dest v) = "MOVEI " ++ show dest ++ " " ++ show v
    show (MOVER dest v) = "MOVER " ++ show dest ++ " " ++ show v
    show (MOVEB dest v) = "MOVEB " ++ show dest ++ " " ++ show v
    show (MOVES dest v) = "MOVES " ++ show dest ++ " " ++ show v
    show (OP op dest src1 src2) = "OP " ++ show op ++ " " ++ show dest ++ " " ++ show src1 ++ " " ++ show src2
    show (LABEL label) = "LABEL " ++ show label
    show (JUMP label) = "JUMP " ++ show label
    show (COND src1 op src2 labelTrue labelFalse) = 
        "COND " ++ show src1 ++ " " ++ show op ++ " " ++ show src2 ++ " " 
        ++ show labelTrue ++ " " ++ show labelFalse
    show (PRINT dest) = "PRINT " ++ show dest
    show (READLN dest) = "READLN " ++ show dest


data BinOp = Plus | Minus | Multiply | Divide | Modulo | LessThan | LessOrEqual | Equal | NoEqual | AndOp | OrOp
           deriving Show

data UnOp = Negate
            deriving Show

type Temp = String
type Label = String

type Count = (Int, Int)

generateSymbolTable :: SymbolTable -> Block -> State Count SymbolTable
generateSymbolTable table (Statements []) = return table
generateSymbolTable table (Statements ((VarDecl iden _ _):rest)) = do 
    temp <- newTemp
    let newTable = insertNewEntry iden (DATATEMP temp) table 
    generateSymbolTable newTable (Statements rest)
generateSymbolTable table (Statements ((ValDecl iden _ _):rest)) = do
    temp <- newTemp
    let newTable = insertNewEntry iden (DATATEMP temp) table
    generateSymbolTable newTable (Statements rest)
generateSymbolTable table (Statements (_:rest)) = generateSymbolTable table (Statements rest)

newTemp :: State Count Temp
newTemp = do
    (temps, labels) <- get
    put (temps + 1, labels)
    return ("t" ++ show temps)

newLabel :: State Count Label
newLabel = do
    (temps, labels) <- get
    put (temps, labels + 1)
    return ("L" ++ show labels)

-- Translate Expressions
transExp :: Exp -> SymbolTable -> Temp -> State Count [Instr]
transExp (Num v) _ dest = return [MOVEI dest v]
transExp (Real v) _ dest = return [MOVER dest v]
transExp (TruthValue False) _ dest = return [MOVEI dest 0]
transExp (TruthValue True) _ dest = return [MOVEI dest 1]
transExp (Letter v) _ dest = return [MOVES dest v]
transExp (Sentence v) _ dest = return [MOVES dest v]
transExp (ReadlnStmt) _ dest = return [READLN dest]
transExp (Id iden) env dest = do
    case search iden env of
        Just (DATATEMP t) -> return [MOVE dest t]
        Just (DATATYPE _ _) -> error "wrong environment"
        Nothing -> error "variable non-declared"
transExp (Add e1 e2) env dest = transBinOp Plus e1 e2 env dest
transExp (Sub e1 e2) env dest = transBinOp Minus e1 e2 env dest
transExp (Mult e1 e2) env dest = transBinOp Multiply e1 e2 env dest
transExp (Div e1 e2) env dest = transBinOp Divide e1 e2 env dest
transExp (Mod e1 e2) env dest = transBinOp Modulo e1 e2 env dest
transExp (Less e1 e2) env dest = transExpCond (Less e1 e2) env dest
transExp (LessEqual e1 e2) env dest = transExpCond (LessEqual e1 e2) env dest
transExp (EqualTo e1 e2) env dest = transExpCond (EqualTo e1 e2) env dest
transExp (NotEqual e1 e2) env dest = transExpCond (NotEqual e1 e2) env dest
transExp (And e1 e2) env dest = transExpCond (And e1 e2) env dest
transExp (Or e1 e2) env dest = transExpCond (Or e1 e2) env dest
transExp (Not e1) env dest = transExpCond (Not e1) env dest

transExpCond ::  Exp -> SymbolTable -> Temp -> State Count [Instr]
transExpCond cond table dest = do
    label1 <- newLabel
    label2 <- newLabel
    label3 <- newLabel
    code <- transCond cond table label1 label2
    return (code ++ [LABEL label1, MOVEI dest 1, JUMP label3] ++ [LABEL label2, MOVEI dest 0, LABEL label3])

-- Helper for binary operations
transBinOp :: BinOp -> Exp -> Exp -> SymbolTable -> Temp -> State Count [Instr]
transBinOp op e1 e2 table dest = do
    t1 <- newTemp
    t2 <- newTemp
    code1 <- transExp e1 table t1
    code2 <- transExp e2 table t2
    return (code1 ++ code2 ++ [OP op dest t1 t2])

-- Translate Conditions
transCond :: Exp -> SymbolTable -> Label -> Label -> State Count [Instr]
transCond (Less e1 e2) table labelt labelf = transBinCond LessThan e1 e2 table labelt labelf
transCond (LessEqual e1 e2) table labelt labelf = transBinCond LessOrEqual e1 e2 table labelt labelf
transCond (EqualTo e1 e2) table labelt labelf = transBinCond Equal e1 e2 table labelt labelf
transCond (NotEqual e1 e2) table labelt labelf = transBinCond NoEqual e1 e2 table labelt labelf
transCond (And e1 e2) table labelt labelf = do 
    label2 <- newLabel
    code1 <- transCond e1 table label2 labelf
    code2 <- transCond e2 table labelt labelf
    return (code1 ++ [LABEL label2] ++ code2)
transCond (Or e1 e2) table labelt labelf = do 
    label2 <- newLabel
    code1 <- transCond e1 table labelt label2
    code2 <- transCond e2 table labelt labelf
    return (code1 ++ [LABEL label2] ++ code2)
transCond (Not e1) table labelt labelf = transCond e1 table labelf labelt
transCond (TruthValue True) _ labelt _ = do return [JUMP labelt]
transCond (TruthValue False) _ _ labelf = do return [JUMP labelf]
transCond (Id iden) table labelt labelf = do
    ttrue <- newTemp
    codeTrue <- transExp (TruthValue True) table ttrue
    case search iden table of
        Just (DATATEMP idtemp) ->  return (codeTrue ++ [COND idtemp Equal ttrue labelt labelf])
        Just (DATATYPE _ _) -> error "wrong environment"
        Nothing -> error "variable not declared (failed on semanticAnalyzer!)"
transCond _ _ _ _ = error "trying to translate a non-condition in a condition" 

-- Helper for binary conditions
transBinCond :: BinOp -> Exp -> Exp -> SymbolTable -> Label -> Label -> State Count [Instr]
transBinCond op e1 e2 table labelt labelf = do
    t1 <- newTemp
    t2 <- newTemp
    code1 <- transExp e1 table t1
    code2 <- transExp e2 table t2
    return (code1 ++ code2 ++ [COND t1 op t2 labelt labelf])

-- Translate Statements
transStm :: Statement -> SymbolTable -> State Count [Instr]
transStm (VarDecl iden _ expr) table = do
    case search iden table of
        Just (DATATEMP dest) -> transExp expr table dest
        Just (DATATYPE _ _) -> error "wrong environment"
        Nothing -> error "variable non-declared"
transStm (ValDecl iden _ expr) table = do
    case search iden table of
        Just (DATATEMP dest) -> transExp expr table dest
        Just (DATATYPE _ _) -> error "wrong environment"
        Nothing -> error "variable non-declared"
transStm (Assignment iden expr) table = do
    case search iden table of
        Just (DATATEMP dest) -> transExp expr table dest
        Just (DATATYPE _ _) -> error "wrong environment"
        Nothing -> error "variable non-declared"
transStm (PrintStmt expr) table = do
    dest <- newTemp
    code <- transExp expr table dest
    return (code ++ [PRINT dest])
transStm (IfStmt cond block) table = do
    label1 <- newLabel
    label2 <- newLabel
    code1 <- transCond cond table label1 label2
    code2 <- transBlock block table
    return (code1 ++ [LABEL label1] ++ code2 ++ [LABEL label2])
transStm (IfElseStmt cond b1 b2) table = do
    label1 <- newLabel
    label2 <- newLabel
    label3 <- newLabel
    code1 <- transCond cond table label1 label2
    code2 <- transBlock b1 table
    code3 <- transBlock b2 table
    return (code1 ++ [LABEL label1] ++ code2 ++ [JUMP label3] ++ [LABEL label2] ++ code3 ++ [LABEL label3])
transStm (WhileStmt cond block) table = do
    labelStart <- newLabel
    labelTrue <- newLabel
    labelEnd <- newLabel
    codeCond <- transCond cond table labelTrue labelEnd
    codeBlock <- transBlock block table
    return ([LABEL labelStart] ++ codeCond ++ [LABEL labelTrue] ++ codeBlock ++ [JUMP labelStart, LABEL labelEnd])

-- Translate a Block
transBlock :: Block -> SymbolTable -> State Count [Instr]
transBlock (Statements []) _ = return []
transBlock (Statements (stm:rest)) table = do
    code1 <- transStm stm table
    code2 <- transBlock (Statements rest) table
    return (code1 ++ code2)

transAST :: Block -> State Count [Instr]
transAST (Statements []) = return []
transAST block = do
    symbolTable <- generateSymbolTable initializeSymbolTable block
    transBlock block symbolTable