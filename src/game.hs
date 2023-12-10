module Main where

import Control.Monad.State

-- Define the game state
data GameState = GameState
  { location :: String
  , inventory :: [String]
  } deriving (Show)

-- Define the game actions
data Action = Inspect | Take String | Use String deriving (Show)

-- Define the game logic
gameLogic :: Action -> State GameState String
gameLogic Inspect = do
  GameState loc inv <- get
  return ("You are at " ++ loc ++ ". You have: " ++ show inv)

gameLogic (Take item) = do
  GameState loc inv <- get
  put (GameState loc (item:inv))
  return ("You took the " ++ item)

gameLogic (Use item) = do
  GameState loc inv <- get
  if item `elem` inv
    then return ("You used the " ++ item)
    else return ("You don't have the " ++ item)

-- Define the game loop
gameLoop :: [Action] -> State GameState [String]
gameLoop [] = return []
gameLoop (a:as) = do
  result <- gameLogic a
  results <- gameLoop as
  return (result:results)

-- Define the main function
main :: IO ()
main = do
  let actions = [Inspect, Take "key", Use "key", Inspect]
  let initialState = GameState "start" []
  let results = evalState (gameLoop actions) initialState
  mapM_ putStrLn results
