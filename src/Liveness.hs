module Liveness where

import           CodeGeneretor (Instr (..), Temp)
import           Data.List ((\\), nub, sortBy, foldl')
import Data.Function (on)

-- Definição do Node
data Node = Node
  { index :: Int
  , instr :: Instr
  , gen   :: [Temp]  -- Variables generated by the instruction
  , kill  :: [Temp]  -- Variables killed (overwritten) by the instruction
  , succs  :: [Int]   -- Indices of successor instructions
  , inSet    :: [Temp]  -- Live variables at the entry to the instruction
  , outSet   :: [Temp]  -- Live variables at the exit of the instruction
  } deriving (Eq, Show)

type Graph = [Node]
type InterferenceGraph = [(Temp, [Temp])]
type Pilha = [(Temp, [Temp])]

-- Função para calcular gen e kill de cada instrução
computeGenKill :: Instr -> ([Temp], [Temp])
computeGenKill (MOVE dest src _)         = ([src], [dest])
computeGenKill (MOVEI dest _)          = ([], [dest])
computeGenKill (MOVER dest _)          = ([], [dest])
computeGenKill (MOVEB dest _)          = ([], [dest])
computeGenKill (MOVES dest _)          = ([], [dest])
computeGenKill (OP _ dest src1 src2 _)   = ([src1, src2], [dest])
computeGenKill (LABEL _)               = ([], [])
computeGenKill (JUMP _)                = ([], [])
computeGenKill (COND src1 _ src2 _ _)  = ([src1, src2], [])
computeGenKill (PRINT src _)             = ([src], [])
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

updateNode :: Node -> Graph -> Node
updateNode node graph =  
    let
        newInSet  = nub (gen node ++ (outSet node \\ kill node))

        succNodes = map (\i -> getNodeOfIndex graph i) (succs node)
        newOutSet = nub (concatMap inSet succNodes)

        updatedNode = node { inSet = newInSet, outSet = newOutSet }
    in
       updatedNode

updateGraph :: Graph -> Graph
updateGraph graph = 
    let
        -- Replace the node in the graph
        updatedGraph = map (\n -> updateNode n graph) graph
    in
        updatedGraph


-- Iterative liveness analysis processing the graph in reverse order
computeLiveness :: Graph -> Graph
computeLiveness graph = iterateLiveness graph 
  where
    -- Iterative function to update until convergence
    iterateLiveness :: Graph -> Graph
    iterateLiveness currentGraph
        | currentGraph == updatedGraph = updatedGraph
        | otherwise = iterateLiveness updatedGraph
      where updatedGraph = (reverse (updateGraph (reverse currentGraph)))

-- Função para gerar o grafo de interferências
generateInterferenceGraph :: Graph -> InterferenceGraph
generateInterferenceGraph [] = []  -- Base case, empty graph
generateInterferenceGraph (node:graph) =
  let
    kills = kill node
    outVars = outSet node

    isAssignment :: Instr -> Bool
    isAssignment (MOVE dest src _) = dest == src
    isAssignment _ = False

    isListNotEmpty :: [Temp] -> Bool
    isListNotEmpty [] = False
    isListNotEmpty _ = True

    in
    if isListNotEmpty kills && isListNotEmpty outVars && not (isAssignment (instr node)) then
      let
        x = head kills
        edges = filter (/= x) outVars
        updatedGraph = addToGraph x edges (generateInterferenceGraph graph)
      in
        updatedGraph
    else
      generateInterferenceGraph graph

-- Add an undirected edge to the interference graph
addToGraph :: Temp -> [Temp] -> InterferenceGraph -> InterferenceGraph
addToGraph x neighbors graph = 
  let
    addEdge :: Temp -> [Temp] -> InterferenceGraph -> InterferenceGraph
    addEdge temp nbrs g = 
      case lookup temp g of
        Just existingNeighbors -> 
          let updatedNeighbors = nub (existingNeighbors ++ nbrs)
          in (temp, updatedNeighbors) : filter ((/= temp) . fst) g
        Nothing -> (temp, nbrs) : g

  in
    let graphWithX = addEdge x neighbors graph
    in foldr (\neighbor g -> addEdge neighbor [x] g) graphWithX neighbors

initPilha :: Pilha
initPilha = []

push :: (Temp, [Temp]) -> Pilha -> Pilha
push x stack = x : stack

pop :: Pilha -> ((Temp, [Temp]), Pilha)
pop (node:stack) = (node, stack)

getLessEdges :: InterferenceGraph -> (Temp,[Temp]) -> (Temp,[Temp])
getLessEdges [] node = node
getLessEdges ((t,edges):graph) (tSent, edgesSent)
  | tSent == "start" = getLessEdges graph (t,edges)
  | length edges < length edgesSent = getLessEdges graph (t,edges)
  | otherwise = getLessEdges graph (tSent, edgesSent)

removeFromGraph :: Temp -> InterferenceGraph -> InterferenceGraph
removeFromGraph _ [] = []
removeFromGraph t ((tNode, edgesNode):graph)
  | t == tNode = removeFromGraph t graph
  | otherwise = [(tNode, filter (/= t) edgesNode)] ++ (removeFromGraph t graph)

generateStack :: InterferenceGraph -> Pilha -> Pilha
generateStack [] stack = stack
generateStack graph stack =
  let
    (t,edges) = getLessEdges graph ("start", [])
    newStack = push (t, edges) stack
    newGraph = removeFromGraph t graph
  in
    generateStack newGraph newStack

selectColor :: Int -> Int -> [Temp] -> [(Temp, Int)] -> Int
selectColor max color edges translator = 
    if all (\neighbor -> not (isColorConflict neighbor color translator)) edges
    then color
    else if color+1 <= max
      then selectColor max (color + 1) edges translator
      else 33

isColorConflict :: Temp -> Int -> [(Temp, Int)] -> Bool
isColorConflict neighbor color translator =
    case lookup neighbor translator of
        Just neighborColor -> neighborColor == color
        Nothing -> False

attributeTemps :: Pilha -> [(Temp, Int)] -> [(Temp, Int)]
attributeTemps [] translator = translator
attributeTemps stack translator = 
  let
    ((t,edges), newStack) = pop stack
    color = selectColor 32 0 edges translator
  in
    attributeTemps newStack (translator ++ [(t,color)])