module Test where

import           Control.Monad     (forM_)
import           Control.Monad.RWS (MonadState (put))
import           Lexer
import           Parser

main :: IO ()
main = do
  let tests = 2
  forM_ [1 .. tests] $ \i -> do
    input <- readFile ("./../tests/input" ++ show i ++ ".kt")
    outputFile <- readFile ("./../tests/output" ++ show i ++ ".txt")
    -- putStrLn ("input " ++ show i ++ ": " ++ show (alexScanTokens input)) -- print tokens
    let correctOutput = read outputFile :: Double
    let result = parse $ alexScanTokens input
    let test = result == correctOutput
    if test
      then putStrLn ("Test " ++ show i ++ " passed")
      else do
        putStrLn ("Test " ++ show i ++ " failed:")
        putStrLn ("  Exp: " ++ show correctOutput)
        putStrLn ("  Got: " ++ show result)
        putStrLn "" -- empty line
