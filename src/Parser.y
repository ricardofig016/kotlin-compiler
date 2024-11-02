{
module Parser where
import Lexer  
}

%name parse
%tokentype { Token }
%error { parseError }

%token

'('         { LPAREN }
')'         { RPAREN }
'{'         { LBRACE }
'}'         { RBRACE }
-- ','         { COMMA }
':'         { COLON }
';'         { SEMICOLON }
'='         { ASSIGN }
'+'         { PLUS }
'-'         { MINUS }
'*'         { MULT }
'/'         { DIV }
'%'         { MOD }
-- '++'        { INCREMENT }
-- '--'        { DECREMENT }
-- '+='        { PLUSEQUAL }
-- '-='        { MINUSEQUAL }
-- '*='        { MULTEQUAL }
-- '/='        { DIVEQUAL }
-- '%='        { MODEQUAL }
-- '<'         { LESS }
-- '>'         { GREATER }
-- '<='        { LESSEQUAL }
-- '>='        { GREATEREQUAL }
-- '=='        { EQUALTO }
-- '!='        { NOTEQUAL }
-- '&&'        { AND }
-- '||'        { OR }
-- '!'         { NOT }
if          { IF }
else        { ELSE }
while       { WHILE }
-- true        { TRUE }
-- false       { FALSE }
val         { VAL }
var         { VAR }
fun         { FUN }
main        { MAIN }
print       { PRINT }
-- readln      { READLN }
int         { INT }
long        { LONG }
float       { FLOAT }
double      { DOUBLE }
boolean     { BOOLEAN }
char        { CHAR }
string      { STRING }
id          { ID $$ }
num         { NUM $$ }
real        { REAL $$ }
-- letter      { LETTER $$ }
-- sentence    { SENTENCE $$ }

%%

Program : MainFunction { $1 }

MainFunction : fun main '(' ')' Block { $5 }

Block : '{' Statements '}' { Statements $2 }
      | '{' '}'            { Statements [] }

-- all statements are terminated by a semicolon (for now at least)
Statements : Statement ';' Statements { $1 : $3 }
           | Statement ';'            { [$1] }

Statement : var id ':' Type '=' Exp { VarDecl $2 $4 $6 }
          | val id ':' Type '=' Exp { ValDecl $2 $4 $6 }
          | id '=' Exp { Assignment $1 $3 }
          | print '(' Exp ')' { PrintStmt $3 }
          | while '(' Exp ')' Block { WhileStmt $3 $5 }
          | if '(' Exp ')' Block else Block { IfElseStmt $3 $5 $7 }
          | if '(' Exp ')' Block            { IfStmt $3 $5 }
          -- TODO: add the missing statements

Exp : Term         { $1 }
    | Exp '+' Term { Add $1 $3 }
    | Exp '-' Term { Sub $1 $3 }

Term : Factor           { $1 }
     | Term '*' Factor  { Mult $1 $3 }
     | Term '/' Factor  { Div $1 $3 }
     | Term '%' Factor  { Mod $1 $3 }

Factor : num         { Num $1 }
       | real        { Real $1 }
       | id          { Var $1 }
       | '(' Exp ')' { $2 }

Type : int     { IntType }
     | long    { LongType }
     | float   { FloatType }
     | double  { DoubleType }
     | boolean { BooleanType }
     | char    { CharType }
     | string  { StringType }

{
data Program = Block
  deriving Show

data Block = Statements [Statement]
  deriving Show

data Statement
  = VarDecl String Type Exp
  | ValDecl String Type Exp
  | Assignment String Exp
  | PrintStmt Exp
  | WhileStmt Exp Block
  | IfElseStmt Exp Block Block
  | IfStmt Exp Block
  deriving Show

data Exp
  = Num Int
  | Real Double
  | Var String
  | Add Exp Exp
  | Sub Exp Exp
  | Mult Exp Exp
  | Div Exp Exp
  | Mod Exp Exp
  deriving Show

data Type
  = IntType
  | LongType
  | FloatType
  | DoubleType
  | BooleanType
  | CharType
  | StringType
  deriving Show


parseError :: [Token] -> a
parseError toks = error ("parse error on tokens: " ++ show toks)
parseError _ = error "parse error: no tokens"
}

