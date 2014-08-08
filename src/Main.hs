module Main where

import Data.Array.IO

type SudokuBoard = [[Maybe Integer]]
--type SudokuBoard = (Int, Int) -> Maybe Integer


main::IO()
main = do
    contents <- getContents
    print $ solve $ initBoard nothingBoard contents
    
-- | 'nothing board' function creates a 9x9 board filled with Nothing
nothingBoard :: SudokuBoard
nothingBoard = map (\x -> map (\y -> (Nothing)) [1..9]) [1..9]

-- | 'initBoard' function takes empty board and file contents and returns the initialized board (TO BE IMPLEMENTED) 
initBoard :: SudokuBoard -> String -> SudokuBoard
initBoard board str = board

-- | 'solve' function takes initialized board and returns the solved board (TO BE IMPLEMENTED) 
solve :: SudokuBoard -> SudokuBoard
solve board = board
    