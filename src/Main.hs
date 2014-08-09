module Main where

import Data.Array
import Data.Array.IO
import Data.Char
import Data.Maybe

type SudokuBoard = Array (Int, Int) (Maybe Int)

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
toMaybeInt c | c == ' '  = Nothing
	     | isDigit c = Just (digitToInt c)
	     | otherwise = error "Invalid input board"

-- | 'display' function to convert a SudokuBoard to String representation
display :: SudokuBoard -> String
display board = unlines [rowToString board y | y <- [1..9]]

rowToString :: SudokuBoard -> Int -> String
rowToString board y = [fromMaybeInt $ board ! (x,y) | x <- [1..9]]

fromMaybeInt :: Maybe Int -> Char
fromMaybeInt Nothing  = ' '
fromMaybeInt (Just x) = intToDigit x

-- | 'solve' function takes initialized board and returns the solved board (TO BE IMPLEMENTED) 
solve :: SudokuBoard -> SudokuBoard
solve board = board
    
