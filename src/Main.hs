module Main where

import Data.Array.IO

type SudokuBoard = [[Maybe Integer]]
-- type SudokuBoard = (Integer, Integer) -> Maybe Integer COMMENTED OUT ALTERNATE TYPE


main::IO()
main = do
    contents <- getContents
    print $ display $ solve $ initBoard nothingBoard contents
    
-- | 'nothing board' function creates a 9x9 board filled with Nothing
nothingBoard :: SudokuBoard
nothingBoard = map (\x -> map (\y -> (Nothing)) [1..9]) [1..9]
-- nothingBoard (x, y) = Nothing //COMMENTED OUT ROUGHLY WHAT THIS WOULD LOOK LIKE (by that, I mean it compiled okay)

-- | 'initBoard' function takes empty board and file contents and returns the initialized board (TO BE IMPLEMENTED) 
initBoard :: SudokuBoard -> String -> SudokuBoard
initBoard board str = board

-- | 'solve' function takes initialized board and returns the solved board (TO BE IMPLEMENTED) 
solve :: SudokuBoard -> SudokuBoard
solve board = board
    
-- | 'display' function to convert a SudokuBoard to String representation
display :: SudokuBoard -> String
display board = ""
{-| display board = displaySpace (board "" 1 1)

-- | 'displaySpace' function to convert a SudokuBoard to String representation
displaySpace :: (SudokuBoard -> String -> Int -> Int) -> String
displaySpace board str x 10 = str
displaySpace board str 10 y = displaySpace (board str + "\n" 1 (y + 1))
displaySpace board str x y = displaySpace (board str + (board x y) (x + 1) y)
-}