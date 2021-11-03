module Config where

import Graphics.Gloss

-- Update frequency
simSteps :: Int
simSteps = 10

-- Window
-- Size of window
windowHeight :: Int
windowHeight = 1000

windowWidth :: Int
windowWidth = 1500

-- Position for the top-left corner of the window
cornerX :: Int
cornerX = 100

cornerY :: Int
cornerY = 100

-- Background color of main window
backgroundColor :: Color
backgroundColor = white

-- Cell
-- Size of cell
cellXsize :: Int
cellXsize = 20

cellYsize :: Int
cellYsize = 20

-- Field
-- Field size
rowsNumber :: Int
rowsNumber = 40

columnsNumber :: Int
columnsNumber = 40

-- Offset of field
fieldOffsetX :: Int
fieldOffsetX = -cellXsize * columnsNumber `div` 2

fieldOffsetY :: Int
fieldOffsetY = cellYsize * rowsNumber `div` 2