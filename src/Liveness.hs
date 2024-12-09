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
  , succ  :: [Int]   -- Indices of successor instructions
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

-- Atualiza o conjunto in[i] e out[i] para um nó específico
updateNode :: Graph -> Node -> Node
updateNode graph node =
  let -- Calcula out[i] como a união dos in[j] para todos os sucessores j
      succNodes = map (\idx -> fromMaybe (error "Invalid node index") (lookupNode idx graph)) (succ node)
      outSetNew = concatMap inSet succNodes

      -- Calcula in[i] como gen[i] ∪ (out[i] \ kill[i])
      inSetNew = gen node ++ (outSetNew \\ kill node)
  in node { inSet = inSetNew, outSet = outSetNew }

-- Procura um nó no grafo pelo índice
lookupNode :: Int -> Graph -> Maybe Node
lookupNode idx = find (\node -> index node == idx)

-- Executa o algoritmo iterativo para calcular in[i] e out[i] até a convergência
computeLiveness :: Graph -> Graph
computeLiveness graph = iterateLiveness graph []
  where
    iterateLiveness :: Graph -> Graph -> Graph
    iterateLiveness currentGraph prevGraph
      | currentGraph == prevGraph = currentGraph  -- Convergência atingida
      | otherwise =
          let updatedGraph = reverse $ foldl (\acc node -> updateNode acc node : acc) [] (reverse currentGraph)
          in iterateLiveness updatedGraph currentGraph

-- Atualiza todos os nós do grafo em ordem inversa
updateGraph :: Graph -> Graph
updateGraph graph = map (updateNode graph) (reverse graph)