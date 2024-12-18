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
-- ','         { COMMA } -- the comma token is used for separating function parameters and array/list values, which we don't support in this subset of kotlin
':'         { COLON }
';'         { SEMICOLON }
'='         { ASSIGN }
'+'         { PLUS }
'-'         { MINUS }
'*'         { MULT }
'/'         { DIV }
'%'         { MOD }
'++'        { INCREMENT }
'--'        { DECREMENT }
'+='        { PLUSEQUAL }
'-='        { MINUSEQUAL }
'*='        { MULTEQUAL }
'/='        { DIVEQUAL }
'%='        { MODEQUAL }
'<'         { LESS }
'>'         { GREATER }
'<='        { LESSEQUAL }
'>='        { GREATEREQUAL }
'=='        { EQUALTO }
'!='        { NOTEQUAL }
'&&'        { AND }
'||'        { OR }
'!'         { NOT }
if          { IF }
else        { ELSE }
while       { WHILE }
true        { TRUE }
false       { FALSE }
val         { VAL }
var         { VAR }
fun         { FUN }
main        { MAIN }
print       { PRINT }
readln      { READLN }
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
letter      { LETTER $$ }
sentence    { SENTENCE $$ }

%%

Program : MainFunction { $1 }

MainFunction : fun main '(' ')' Block { $5 }

Block : '{' Statements '}' { Statements $2 }
      | '{' '}'            { Statements [] }

-- all statements are terminated by a semicolon (for now at least)
Statements : Statement Statements { $1 : $2 }
           | Statement            { [$1] }

Statement : var id ':' Type '=' Exp ';'     { VarDecl $2 $4 $6 }
          | val id ':' Type '=' Exp ';'     { ValDecl $2 $4 $6 }
          | id '=' Exp ';'                  { Assignment $1 $3 }
          | id '++' ';'                     { Assignment $1 (Add (Id $1) (Num 1)) }
          | id '--' ';'                     { Assignment $1 (Sub (Id $1) (Num 1)) }
          | id '+=' Exp ';'                 { Assignment $1 (Add (Id $1) $3) }
          | id '-=' Exp ';'                 { Assignment $1 (Sub (Id $1) $3) }
          | id '*=' Exp ';'                 { Assignment $1 (Mult (Id $1) $3) }
          | id '/=' Exp ';'                 { Assignment $1 (Div (Id $1) $3) }
          | id '%=' Exp ';'                 { Assignment $1 (Mod (Id $1) $3) }
          | print '(' Exp ')' ';'           { PrintStmt $3 }
          | while '(' Exp ')' Block         { WhileStmt $3 $5 }
          | if '(' Exp ')' Block else Block { IfElseStmt $3 $5 $7 }
          | if '(' Exp ')' Block            { IfStmt $3 $5 }
          -- TODO: add the missing statements

Exp : DisjunctionExp { $1 }

DisjunctionExp : ConjunctionExp                     { $1 }
               | DisjunctionExp '||' ConjunctionExp { Or $1 $3 }

ConjunctionExp : ComparisonExp                     { $1 }
               | ConjunctionExp '&&' ComparisonExp { And $1 $3 }

ComparisonExp : NotExp                    { $1 }
              | ComparisonExp '<' NotExp  { Less $1 $3 }
              | ComparisonExp '>' NotExp  { Less $3 $1 }
              | ComparisonExp '<=' NotExp { LessEqual $1 $3 }
              | ComparisonExp '>=' NotExp { LessEqual $3 $1 }
              | ComparisonExp '==' NotExp { EqualTo $1 $3 }
              | ComparisonExp '!=' NotExp { NotEqual $1 $3 }

NotExp : AddSubExp  { $1 }
       | '!' NotExp { Not $2 }

AddSubExp : MultDivExp               { $1 }
          | AddSubExp '+' MultDivExp { Add $1 $3 }
          | AddSubExp '-' MultDivExp { Sub $1 $3 }

MultDivExp : Unit                { $1 }
           | MultDivExp '*' Unit { Mult $1 $3 }
           | MultDivExp '/' Unit { Div $1 $3 }
           | MultDivExp '%' Unit { Mod $1 $3 }

Unit : num            { Num $1 }
     | real           { Real $1 }
     | id             { Id $1 }
     | true           { TruthValue True }
     | false          { TruthValue False }
     | letter         { Letter $1 }
     | sentence       { Sentence $1 }
     | '(' Exp ')'    { $2 }
     | readln '(' ')' { ReadlnStmt }

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
  | Id String
  | TruthValue Bool
  | Letter String -- string of length 1
  | Sentence String
  | Add Exp Exp
  | Sub Exp Exp
  | Mult Exp Exp
  | Div Exp Exp
  | Mod Exp Exp
  | Less Exp Exp
  | LessEqual Exp Exp
  | EqualTo Exp Exp
  | NotEqual Exp Exp
  | And Exp Exp
  | Or Exp Exp
  | Not Exp
  | ReadlnStmt
  deriving Show

data Type
  = IntType
  | LongType
  | FloatType
  | DoubleType
  | BooleanType
  | CharType
  | StringType
  deriving (Eq, Show)


parseError :: [Token] -> a
parseError toks = error ("parse error on tokens: " ++ show toks)
parseError _ = error "parse error: no tokens"
}

