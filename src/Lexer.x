{
-- Analisador lexical para a calculador simples
module Lexer where
}

%wrapper "basic"
$alpha = [a-zA-Z]
$digit = [0-9]

tokens :-

-- white space and comments
$white+                                 ;
\/ \/ .*                                ;
\/ \* ( ~\* | \* ~\/ | \** \n )* \* \/  ;

-- special characters
\(                                      {\_ -> LPAREN}
\)                                      {\_ -> RPAREN}

-- arithmetic operators
\+                                      { \_ -> PLUS }
\-                                      { \_ -> MINUS }
\*                                      { \_ -> MULT }
\/                                      { \_ -> DIV }

-- reserved words
sqrt                                    { \_ -> SQRT }
exp                                     { \_ -> EXP }
log                                     { \_ -> LOG }

-- identifiers and literals
$digit+                                 { \s -> NUM (read s) }
$digit* \. $digit+                      { \s -> REAL (read s) }


{
data Token =
    -- special characters
      LPAREN
    | RPAREN
    
    -- arithmetic operators
    | PLUS
    | MINUS
    | MULT
    | DIV

    -- reserved words
    | SQRT
    | EXP
    | LOG

    -- identifiers and literals
    | NUM Int
    | REAL Double

    deriving (Eq, Show)
}
