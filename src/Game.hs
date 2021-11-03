module Game where

import Types
import Config

nextStep :: Field -> Field 
nextStep field = next [(x, y) | x <- [0 .. rowsNumber], y <- [0 .. columnsNumber]] field

next :: [Cell] -> Field -> Field
next [] _ = []
next (x : (xs)) field = if (checkCell x field)
                            then x : (next xs field)
                            else next xs field

checkCell :: Cell -> Field -> Bool
checkCell cell field = if cell `elem` field
                            then checkAlive cell field
                            else checkDead cell field

checkAlive :: Cell -> Field -> Bool
checkAlive cell field = 
    let number_of_alive_neighbors = numOfAliveNeighbors (getNeighbors cell) field
    in number_of_alive_neighbors == 2 || number_of_alive_neighbors == 3

checkDead :: Cell -> Field -> Bool
checkDead cell field = (numOfAliveNeighbors (getNeighbors cell) field) == 3

numOfAliveNeighbors :: [Cell] -> Field -> Int
numOfAliveNeighbors [] _ = 0
numOfAliveNeighbors (x : (xs)) field = if x `elem` field
                                        then 1 + numOfAliveNeighbors xs field
                                        else numOfAliveNeighbors xs field

getNeighbors :: Cell -> [Cell]
getNeighbors (x, y) = [(x + dx, y + dy) | dx <- [-1..1], dy <- [-1..1], (dx,dy) /= (0,0),
                                        x + dx <= (rowsNumber - 1), x + dx >= 0,
                                        y + dy <= (columnsNumber - 1), y + dy >= 0]
