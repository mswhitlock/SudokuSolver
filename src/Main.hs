module Main where

import Data.Array
import Data.Array.IO
import Data.Char
import Data.Maybe

type SudokuBoard = Array (Int, Int) (Maybe Int)
-- type SudokuBoard = (Integer, Integer) -> Maybe Integer COMMENTED OUT ALTERNATE TYPE

main::IO()
main = interact (display . solve . initBoard)

-- | 'setBoardTile' function takes a given SudokuBoard, a coordinate, and an number and returns a new SudokuBoard with the given number at the given Coordinate
--setBoardTile :: SudokuBoard -> (Integer, Integer) -> Integer -> SudokuBoard
--setBoardTile b (x, y) i = b//[(x, y), i]

-- | 'initBoard' function takes empty board and file contents and returns the initialized board
initBoard :: String -> SudokuBoard
initBoard str = array ((1,1), (9,9)) [((x, y), value) | x <- [1..9]
                                                      , y <- [1..9]
                                                      , let value = toMaybeInt $ lines str !! (y - 1) !! (x - 1)]

toMaybeInt :: Char -> Maybe Int
toMaybeInt c | isDigit c = Just (read [c])
             | c == ' '  = Nothing
             | otherwise = error "Invalid input board"

-- | 'solve' function takes initialized board and returns the solved board (TO BE IMPLEMENTED) 
solve :: SudokuBoard -> SudokuBoard
solve board = board
    
-- | 'display' function to convert a SudokuBoard to String representation
display :: SudokuBoard -> String
display board = ""
-- COMMENTED OUT DISPLAY OF BOARD BASED ON FUNCTION
-- THIS DOESN'T COMPILE AND IT'S ACTUALLY PRETTY UGLY, BUT I THINK THE ISSUE IS JUST HORRIBLE SYNTAX
{-| display board = displaySpace (board "" 1 1)

-- | 'displaySpace' function to convert a SudokuBoard to String representation
displaySpace :: (SudokuBoard -> String -> Int -> Int) -> String
displaySpace board str x 10 = str
displaySpace board str 10 y = displaySpace (board str + "\n" 1 (y + 1))
displaySpace board str x y = displaySpace (board str + (board x y) (x + 1) y)
-}
