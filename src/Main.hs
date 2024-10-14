module Main where

import           Control.Monad     (forM_)
import           Control.Monad.RWS (MonadState (put))
import           Lexer
import           Parser

main :: IO ()
main = do
  input <- getLine
  let result = parse $ alexScanTokens input
  print result
