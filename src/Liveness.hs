module Liveness where

import           CodeGenaretor (Instr (..), Temp)
import           Data.List ((\\))
import           Data.Maybe (fromMaybe)

-- Definição do Node
data Node = Node
  { index :: Int
  , instr :: Instr
  , gen   :: [Temp]  -- Variables generated by the instruction
  , kill  :: [Temp]  -- Variables killed (overwritten) by the instruction
  , succs  :: [Int]   -- Indices of successor instructions
  , inSet    :: [Temp]  -- Live variables at the entry to the instruction
  , outSet   :: [Temp]  -- Live variables at the exit of the instruction
  } deriving Show

type Graph = [Node]

-- Função para calcular gen e kill de cada instrução
computeGenKill :: Instr -> ([Temp], [Temp])
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

computeSucc :: Int -> Int -> Instr -> [Instr] -> [Int]
computeSucc _ _ (JUMP label) instrset = [(findLabelIndex 1 label instrset)]
computeSucc _ _ (COND _ _ _ label1 label2) instrset = [(findLabelIndex 1 label1 instrset), (findLabelIndex 1 label2 instrset)]
computeSucc indx size _ _
  | indx < size = [indx+1]
  | otherwise = []

findLabelIndex :: Int -> String -> [Instr] -> Int
findLabelIndex _ _ [] = -1  -- If the label is not found, return -1
findLabelIndex idx label1 (LABEL label2 : instrs)
  | label1 == label2 = idx  -- Found the label, return the index
  | otherwise = findLabelIndex (idx + 1) label1 instrs  -- Recurse with incremented index
findLabelIndex idx label (_:instrs) = findLabelIndex (idx + 1) label instrs  -- Skip non-LABEL instructions

-- Função para construir o grafo a partir da lista de instruções
buildGraph :: [Instr] -> Graph
buildGraph instrs = buildNodes instrs 1
  where
    -- Função auxiliar para construir os nós do grafo com base nas instruções
    buildNodes :: [Instr] -> Int -> Graph
    buildNodes [] _ = []
    buildNodes (instruct:instructs) idx =
      let (genSet, killSet) = computeGenKill instruct
          succSet = computeSucc idx (length instrs) instruct instrs
          node = Node idx instruct genSet killSet succSet [] []
          restOfGraph = buildNodes instructs (idx + 1)
      in node : restOfGraph

getNodeOfIndex :: Graph -> Int -> Node
getNodeOfIndex [] _ = error "Index not found in graph"
getNodeOfIndex (node:graph) indx 
    | indx == index node = node
    | otherwise = getNodeOfIndex graph indx

updateGraph :: Int -> Graph -> Graph
updateGraph indx graph = 
    let
        node = getNodeOfIndex graph indx

        newInSet  = gen node ++ (outSet node \\ kill node)

        succNodes = map (`getNodeOfIndex` graph) (succs node)
        newOutSet = concatMap inSet succNodes

        updatedNode = node { inSet = newInSet, outSet = newOutSet }

        -- Replace the node in the graph
        updatedGraph = map (\n -> if index n == indx then updatedNode else n) graph
    in
        updatedGraph


computeLiveness :: Int -> Graph -> Graph
computeLiveness indx graph
    | updatedGraph == graph = updatedGraph
    | otherwise = computeLiveness indx+1 updatedGraph
    where updatedGraph = updateGraph indx graph