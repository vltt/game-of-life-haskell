module Graphic where

import Config
import Game
import Input
import Types

import Graphics.Gloss.Interface.Pure.Simulate

start_game :: IO ()
start_game = do
    file <- fH
    simulate window backgroundColor simSteps (initWorld(toField file))  toPicture updater

toField :: [[Int]] -> Field
toField [] = []
toField (x :(xs)) = (toCell x) : toField xs

toCell :: [Int] -> Cell
toCell (x:y:_) = (x, y)
toCell _ = error "Invalid input file"

window :: Display
window = InWindow "Nice Window" (windowWidth, windowHeight) (cornerX, cornerY)

initWorld :: Field -> World
initWorld field = (World field)

toPicture :: World -> Picture
toPicture (World field) = Pictures (drawField field)

drawField :: Field -> [Picture]
drawField field = [drawCell col row field | col <- [1 .. columnsNumber], row <- [1 .. rowsNumber]]

drawCell :: Int -> Int -> Field -> Picture
drawCell col row field = 
    let dx = fromIntegral (fieldOffsetX + col * cellXsize)
        dy = fromIntegral (fieldOffsetY - row * cellYsize)
        cellIsAlive = (row, col) `elem` field
    in Translate dx dy (if cellIsAlive then drawAliveCell else drawDeadCell)

drawAliveCell :: Picture
drawAliveCell = Pictures [ 
    Color cyan (rectangleSolid (fromIntegral cellXsize) (fromIntegral cellYsize)),
    Color black (rectangleWire  (fromIntegral cellXsize) (fromIntegral cellYsize))]

drawDeadCell :: Picture
drawDeadCell = Pictures [
    Color white (rectangleSolid (fromIntegral cellXsize) (fromIntegral cellYsize)),
    Color black (rectangleWire  (fromIntegral cellXsize) (fromIntegral cellYsize))]

updater :: ViewPort-> Float -> World -> World
updater _ _ (World field) = (World (nextStep field))
