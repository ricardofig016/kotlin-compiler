{
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
\(                                      { \_ -> LPAREN }
\)                                      { \_ -> RPAREN }
\{                                      { \_ -> LBRACE }
\}                                      { \_ -> RBRACE }
\,                                      { \_ -> COMMA }
\:                                      { \_ -> COLON }
\;                                      { \_ -> SEMICOLON }
\=                                      { \_ -> ASSIGN }

-- arithmetic operators
\+                                      { \_ -> PLUS }
\-                                      { \_ -> MINUS }
\*                                      { \_ -> MULT }
\/                                      { \_ -> DIV }
\%                                      { \_ -> MOD }
\+\+                                    { \_ -> INCREMENT }
\-\-                                    { \_ -> DECREMENT }
\+\=                                    { \_ -> PLUSEQUAL }
\-\=                                    { \_ -> MINUSEQUAL }
\*\=                                    { \_ -> MULTEQUAL }
\/\=                                    { \_ -> DIVEQUAL }
\%\=                                    { \_ -> MODEQUAL }

-- comparison operators
\<                                      { \_ -> LESS }
\>                                      { \_ -> GREATER }
\<\=                                    { \_ -> LESSEQUAL }
\>\=                                    { \_ -> GREATEREQUAL }
\=\=                                    { \_ -> EQUALTO }
\!\=                                    { \_ -> NOTEQUAL }

-- logical operators
\&\&                                    { \_ -> AND }
\|\|                                    { \_ -> OR }
\!                                      { \_ -> NOT }

-- reserved words
if                                      { \_ -> IF }
else                                    { \_ -> ELSE }
while                                   { \_ -> WHILE }
true                                    { \_ -> TRUE }
false                                   { \_ -> FALSE }
val                                     { \_ -> VAL }
var                                     { \_ -> VAR }
fun                                     { \_ -> FUN }
main                                    { \_ -> MAIN }
print                                   { \_ -> PRINT }
readln                                  { \_ -> READLN }

-- primitive types
Int                                     { \_ -> INT }
Long                                    { \_ -> LONG }
Float                                   { \_ -> FLOAT }
Double                                  { \_ -> DOUBLE }
Boolean                                 { \_ -> BOOLEAN }
Char                                    { \_ -> CHAR }
String                                  { \_ -> STRING }

-- identifiers and literals
( $alpha | _ ) ( $alpha | $digit | _ )*   { \s -> ID s }
$digit+                                   { \s -> NUM (read s) }
$digit* \. $digit+                        { \s -> REAL (read s) }
\' \\? . \'                               { \s -> LETTER (init (tail s)) }
\" ( ~\" | \\\" )* \"                     { \s -> SENTENCE (init (tail s)) }



{
data Token =
    -- special characters
      LPAREN
    | RPAREN
    | LBRACE
    | RBRACE
    | COMMA
    | COLON
    | SEMICOLON
    | ASSIGN
    
    -- arithmetic operators
    | PLUS
    | MINUS
    | MULT
    | DIV
    | MOD
    | INCREMENT
    | DECREMENT
    | PLUSEQUAL
    | MINUSEQUAL
    | MULTEQUAL
    | DIVEQUAL
    | MODEQUAL

    -- comparison operators
    | LESS
    | GREATER
    | LESSEQUAL
    | GREATEREQUAL
    | EQUALTO
    | NOTEQUAL

    -- logical operators
    | AND
    | OR
    | NOT

    -- reserved words
    | IF
    | ELSE
    | WHILE
    | TRUE
    | FALSE
    | VAL -- immutable variable
    | VAR -- mutable variable
    | FUN
    | MAIN
    | PRINT
    | READLN

    -- primitive types
    | INT
    | LONG
    | FLOAT
    | DOUBLE
    | BOOLEAN
    | CHAR
    | STRING

    -- identifiers and literals
    | ID String
    | NUM Int
    | REAL Double
    | LETTER String -- string of length 1
    | SENTENCE String

    deriving (Eq, Show)
}
