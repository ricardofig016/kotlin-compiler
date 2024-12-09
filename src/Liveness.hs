module Liveness where

import           CodeGenaretor (Instr (..))

data Node = Node
  { index :: Int
  , instr :: Instr
  , gen :: [String]
  , kill :: [String]
  , succ :: [Int]
  } deriving Show

type Graph = [Node]

computeGenKill :: Instr -> ([String], [String])
computeGenKill (MOVE dest src)         = ([src], [dest])
computeGenKill (MOVEI dest _)          = ([], [dest])
computeGenKill (MOVER dest _)          = ([], [dest])
computeGenKill (MOVEB dest _)          = ([], [dest])
computeGenKill (MOVES dest _)          = ([], [dest])
computeGenKill (OP _ dest src1 src2)   = ([src1, src2], [dest])
computeGenKill (LABEL _)               = ([], [])
computeGenKill (JUMP _)                = ([], [])
computeGenKill (COND src1 _ src2 _ _)  = ([src1, src2], [])
computeGenKill (PRINT src)             = ([src], [])
computeGenKill (READLN dest)           = ([], [dest])

-- Determina succ com base na instrução e o índice atual
computeSucc :: Int -> Instr -> Graph -> [Int]
computeSucc idx (JUMP label) graph =
  -- Busca a instrução com o rótulo correspondente
  case findIndex (\i -> isLabel i label) graph of
    Just j  -> [j + 1]
    Nothing -> []  -- Caso não encontre o rótulo
computeSucc idx (COND _ _ _ label1 label2) graph =
  -- Busca os índices dos dois rótulos
  map (+1) (findLabels graph [label1, label2])
computeSucc idx _ graph
  | idx + 1 < length graph = [idx + 1]  -- Próxima instrução
  | otherwise              = []         -- Última instrução

-- Verifica se uma instrução é um LABEL com o nome correto
isLabel :: Instruction -> String -> Bool
isLabel (Instruction _ (LABEL lbl) _ _ _) label = lbl == label
isLabel _ _ = False

-- Busca os índices de múltiplos rótulos
findLabels :: Graph -> [String] -> [Int]
findLabels graph labels = mapMaybe (\lbl -> findIndex (\i -> isLabel i lbl) graph) labels

-- Constrói o grafo a partir de uma lista de instruções
buildGraph :: [Instr] -> Graph
buildGraph instrs = zipWith buildInstruction [1..] instrs
  where
    -- Constrói uma única instrução do grafo
    buildInstruction :: Int -> Instr -> Instruction
    buildInstruction idx instr =
      let (genSet, killSet) = computeGenKill instr
          succSet = computeSucc idx instr graph
      in Instruction idx instr genSet killSet succSet
      where
        -- Grafo parcial (usado para calcular sucessores)
        graph = buildGraph (take (idx - 1) instrs)
