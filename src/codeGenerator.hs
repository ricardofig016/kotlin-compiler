import           Control.Monad.State
import           Parser   (Statement (..), Exp (..), Type (..), Block (..))

data Instr = MOVE Temp Temp
           | MOVEI Temp Int
           | MOVER Temp Double
           | MOVEB Temp Bool
           | MOVES Temp String
           | OP BinOp Temp Temp Temp
           | LABEL Label
           | JUMP Label
           | COND Temp BinOp Temp Label Label
           | UOP UnOp Temp Temp
           | UCOND Temp Label Label
           | PRINT Temp
           deriving Show

data BinOp = Add | Sub | Mult | Div | Mod | Less | LessEqual | EqualTo | NotEqual | And | Or
           deriving Show

data UnOp = Not
            deriving Show

type Temp = String
type Label = String

type Count = (Int, Int)

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
transExp (TruthValue v) _ dest = return [MOVEB dest v]
transExp (Letter v) _ dest = return [MOVES dest v]
transExp (Sentence v) _ dest = return [MOVES dest v]
transExp (Id id) env dest = do
    let Just t = search id env
    return [MOVE dest t]
transExp (Add e1 e2) env dest = transBinOp Add e1 e2 env dest
transExp (Sub e1 e2) env dest = transBinOp Sub e1 e2 env dest
transExp (Mult e1 e2) env dest = transBinOp Mult e1 e2 env dest
transExp (Div e1 e2) env dest = transBinOp Div e1 e2 env dest
transExp (Mod e1 e2) env dest = transBinOp Mod e1 e2 env dest
transExp (Less e1 e2) env dest = transBinOp Less e1 e2 env dest
transExp (LessEqual e1 e2) env dest = transBinOp LessEqual e1 e2 env dest
transExp (EqualTo e1 e2) env dest = transBinOp EqualTo e1 e2 env dest
transExp (NotEqual e1 e2) env dest = transBinOp NotEqual e1 e2 env dest
transExp (And e1 e2) env dest = transBinOp And e1 e2 env dest
transExp (Or e1 e2) env dest = transBinOp Or e1 e2 env dest
transExp (Not e1) env dest = do
    t1 <- newTemp
    code1 <- transExp e1 table t1
    return (code1 ++ [OP op dest t1])

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
transCond (Less e1 e2) table labelt labelf = transBinCond Less e1 e2 table labelt labelf
transCond (LessEqual e1 e2) table labelt labelf = transBinCond LessEqual e1 e2 table labelt labelf
transCond (EqualTo e1 e2) table labelt labelf = transBinCond EqualTo e1 e2 table labelt labelf
transCond (NotEqual e1 e2) table labelt labelf = transBinCond NotEqual e1 e2 table labelt labelf
transCond (And e1 e2) table labelt labelf = transBinCond And e1 e2 table labelt labelf
transCond (Or e1 e2) table labelt labelf = transBinCond Or e1 e2 table labelt labelf
transCond (Not e1) table labelt labelf = do
    t1 <- newTemp
    code1 <- transExp e1 table t1
    return (code1 ++ [UCOND t1 labelf labelt]) -- Swap labels for negation
transCond (Id id) table labelt labelf = do
    let Just idtemp = search id table
    return [UCOND idtemp labelt labelf]

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
transStm (VarDecl id _ exp) table = do
    let Just dest = search id table
    transExp exp table dest
transStm (ValDecl id _ exp) table = do
    let Just dest = search id table
    transExp exp table dest
transStm (Assignment id exp) table = do
    let Just dest = search id table
    transExp exp table dest
transStm (PrintStmt exp) table = do
    dest <- newTemp
    code <- transExp exp table dest
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
transBlock :: [Statement] -> SymbolTable -> State Count [Instr]
transBlock [] _ = return []
transBlock (stm:rest) table = do
    code1 <- transStm stm table
    code2 <- transBlock rest table
    return (code1 ++ code2)