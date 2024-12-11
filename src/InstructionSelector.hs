module InstructionSelector where

import           CodeGeneretor (Instr (..), Temp, BinOp (..))
import           Parser        (Type (..))
import           Data.Char     (isAlphaNum)

getAssigned :: [(Temp, Int)] -> Temp -> String
getAssigned [] temp = "$t0"
getAssigned ((t, color):rest) temp
    | t == temp = if color == 33 
                    then spillToMemory t
                    else "$t"++show color
    | otherwise = getAssigned rest temp

getAssignedFloat :: [(Temp, Int)] -> Temp -> String
getAssignedFloat [] temp = "$f0"
getAssignedFloat ((t, color):rest) temp
    | t == temp = if color == 33 
                    then spillToMemoryFloat t
                    else "$f"++show color
    | otherwise = getAssignedFloat rest temp

spillToMemory :: Temp -> String
spillToMemory temp = "sw " ++ temp ++ ", 0($sp)\n"

spillToMemoryFloat :: Temp -> String
spillToMemoryFloat temp = "s.s " ++ temp ++ ", 0($sp)\n"

hash :: String -> String
hash str = "string_" ++ (map (\c -> if isAlphaNum c then c else '_') str)

hashFloat :: Double -> String
hashFloat flt = "float_" ++ (sanitize (show flt))
  where
    sanitize :: String -> String
    sanitize = map (\c -> if isAlphaNum c then c else '_')

generateData :: [Instr] -> String
generateData [] = ""
generateData ((MOVES _ str):rest) = "\t"++(hash str)++": .asciiz \""++str++"\"\n"++(generateData rest)
generateData ((MOVER _ dbl):rest) = "\t" ++ (hashFloat dbl) ++ ": .float " ++ show dbl ++ "\n" ++ (generateData rest)
generateData (_:rest) = generateData rest

assembler :: [Instr] -> [(Temp, Int)] -> String
assembler instrSet env = "\n.data\n\tbuffer: .space 100\n"++(generateData instrSet)++"\n.text\nmain:\n"++(assemblerTrans instrSet env)

assemblerTrans :: [Instr] -> [(Temp, Int)] -> String
assemblerTrans [] env = "\tli $v0, 10\n\tsyscall\n\nprint_string:\n\tli $v0, 4\n\tsyscall\n\tjr $ra\n\nprint_int:\n\tli $v0, 1\n\tsyscall\n\tjr $ra\n\nprint_float:\n\tli $v0, 2\n\tsyscall\n\tjr $ra\n\nread:\n\tli $v0, 8\n\tla $a0, buffer\n\tli $a1, 100\n\tsyscall\n\tmove $a0, $a0\n\tjr $ra\n"
assemblerTrans ((COND t1 op t2 labelt labelf):(LABEL labelx):rest) env = (assembInstrCond (COND t1 op t2 labelt labelf) (LABEL labelx) env) ++ (assemblerTrans rest env)
assemblerTrans ((JUMP label):rest) env = "\t"++"j\t"++label++"\n"++(assemblerTrans rest env)
assemblerTrans ((LABEL label):rest) env = label++":\n"++(assemblerTrans rest env) 
assemblerTrans ((COND t1 Equal t2 labelt labelf):rest) env = "\t"++"beq\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelt++"\n\tj\t"++labelf++"\n"++(assemblerTrans rest env)
assemblerTrans ((COND t1 LessThan t2 labelt labelf):rest) env = "\t"++"blt\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelt++"\n\tj\t"++labelf++"\n"++(assemblerTrans rest env)
assemblerTrans (instr:rest) env = "\t"++(assembInstrExp instr env)++"\n"++(assemblerTrans rest env)

assembInstrExp :: Instr -> [(Temp, Int)] -> String
assembInstrExp (MOVE t1 t2 FloatType) env = 
    let
        register1 = getAssigned env t1
        register2 = getAssigned env t2
    in
        if register1 == register2
        then ""
        else "mov.s "++(getAssignedFloat env t1)++", "++(getAssignedFloat env t2)
assembInstrExp (MOVE t1 t2 _) env = 
    let
        register1 = getAssigned env t1
        register2 = getAssigned env t2
    in
        if register1 == register2
        then ""
        else "move "++(getAssigned env t1)++", "++(getAssigned env t2)
assembInstrExp (MOVEI dest k) env = "li "++(getAssigned env dest)++", "++(show k)
assembInstrExp (MOVEB dest True) env = "li "++(getAssigned env dest)++", "++(show 1)
assembInstrExp (MOVEB dest False) env = "li "++(getAssigned env dest)++", "++(show 0)
assembInstrExp (MOVES dest str) env = "la "++(getAssigned env dest)++", "++(hash str)
assembInstrExp (MOVER dest dbl) env = "l.s "++(getAssignedFloat env dest)++", "++(hashFloat dbl)
assembInstrExp (PRINT temp BooleanType) env = "move $a0, "++(getAssigned env temp)++"\n\tjal print_int"
assembInstrExp (PRINT temp IntType) env = "move $a0, "++(getAssigned env temp)++"\n\tjal print_int"
assembInstrExp (PRINT temp FloatType) env = "subu $sp, $sp, 8\n\ts.s $f12, 0($sp)\n\tmov.s $f12, "++(getAssignedFloat env temp)++"\n\tjal print_float\n\tl.s $f12, 0($sp)\n\taddu $sp, $sp, 8"
assembInstrExp (PRINT temp StringType) env = "move $a0, "++(getAssigned env temp)++"\n\tjal print_string"
assembInstrExp (READLN temp) env = "jal read\n\tmove "++(getAssigned env temp)++", $a0"
assembInstrExp (OP Plus dest t1 t2 IntType) env = "add " ++ getAssigned env dest ++ ", " ++ getAssigned env t1 ++ ", " ++ getAssigned env t2
assembInstrExp (OP Minus dest t1 t2 IntType) env = "sub " ++ getAssigned env dest ++ ", " ++ getAssigned env t1 ++ ", " ++ getAssigned env t2
assembInstrExp (OP Multiply dest t1 t2 IntType) env = "mul " ++ getAssigned env dest ++ ", " ++ getAssigned env t1 ++ ", " ++ getAssigned env t2
assembInstrExp (OP Divide dest t1 t2 IntType) env = "div " ++ getAssigned env t1 ++ ", " ++ getAssigned env t2 ++ "\n" ++ "mflo " ++ getAssigned env dest
assembInstrExp (OP Modulo dest t1 t2 IntType) env = "div " ++ getAssigned env t1 ++ ", " ++ getAssigned env t2 ++ "\n" ++ "mfhi " ++ getAssigned env dest
assembInstrExp (OP Plus dest t1 t2 FloatType) env = "add.s " ++ getAssignedFloat env dest ++ ", " ++ getAssignedFloat env t1 ++ ", " ++ getAssignedFloat env t2
assembInstrExp (OP Minus dest t1 t2 FloatType) env = "sub.s " ++ getAssignedFloat env dest ++ ", " ++ getAssignedFloat env t1 ++ ", " ++ getAssignedFloat env t2
assembInstrExp (OP Multiply dest t1 t2 FloatType) env = "mul.s " ++ getAssignedFloat env dest ++ ", " ++ getAssignedFloat env t1 ++ ", " ++ getAssignedFloat env t2
assembInstrExp (OP Divide dest t1 t2 FloatType) env = "div.s " ++ getAssignedFloat env t1 ++ ", " ++ getAssignedFloat env t2 ++ "\n" ++ "mov.d " ++ getAssignedFloat env dest
assembInstrExp (OP Modulo dest t1 t2 FloatType) env = "div.s " ++ getAssigned env t1 ++ ", " ++ getAssigned env t2 ++ "\n" ++ "mov.d " ++ getAssigned env dest

assembInstrCond :: Instr -> Instr -> [(Temp, Int)] -> String
assembInstrCond (COND t1 Equal t2 labelt labelf) (LABEL labelx) env
    | labelf == labelx = "\tbeq\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelt++"\n"++labelf++":\n"
    | labelt == labelx = "\tbne\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelf++"\n"++labelt++":\n"
    | otherwise = "\tbeq\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelt++"\n\tj\t"++labelf++"\n"++labelx++":\n"
assembInstrCond (COND t1 LessThan t2 labelt labelf) (LABEL labelx) env
    | labelf == labelx = "\t\t\tblt\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelt++"\n"++labelf++":\n"
    | labelt == labelx = "\tbge\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelf++"\n"++labelt++":\n"
    | otherwise = "\tblt\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelt++"\n\tj\t"++labelf++"\n"++labelx++":\n"
assembInstrCond (COND t1 LessOrEqual t2 labelt labelf) (LABEL labelx) env
    | labelf == labelx = "\t\t\tble\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelt++"\n"++labelf++":\n"
    | labelt == labelx = "\tbgt\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelf++"\n\t"++labelt++":\n"
    | otherwise = "\tble\t"++(getAssigned env t1)++", "++(getAssigned env t2)++", "++labelt++"\n\tj\t"++labelf++"\n"++labelx++":\n"