{
module Parser where
import Lexer  
}

%name parse
%tokentype { Token }
%error { parseError }

%token

'('     { LPAREN }
')'     { RPAREN }
'+'     { PLUS }
'-'     { MINUS }
'*'     { MULT }
'/'     { DIV }
sqrt    { SQRT }
exp     { EXP }
log     { LOG }
num     { NUM $$ }
real    { REAL $$ }

%%

Exp : Term          { $1 }
    | Exp '+' Term  { $1 + $3 }
    | Exp '-' Term  { $1 - $3 }

Term : Term_            { $1 }
     | Term '*' Term_   { $1 * $3 }
     | Term '/' Term_   { $1 / $3 }

Term_ : num                 { fromIntegral $1 }
      | real                { $1 }
      | '(' Exp ')'         { $2 }
      | sqrt '(' Exp ')'    { fromIntegral (round (sqrt $3 * 10^7)) / 10^7 }
      | exp '(' Exp ')'     { fromIntegral (round (exp $3 * 10^7)) / 10^7 }
      | log '(' Exp ')'     { fromIntegral (round (log $3 * 10^7)) / 10^7 }

{
parseError :: [Token] -> a
parseError toks = error ("parse error on tokens: " ++ show toks)
}

