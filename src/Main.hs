module Main where

import Data.Array
import Data.Array.IO
import Data.Char
import Data.Maybe

type SudokuBoard = Array (Int, Int) (Maybe Int)

main::IO()
main = interact (display . solve . initBoard)

-- | 'setBoardTile' function takes a given SudokuBoard, a coordinate, and an number and returns a new SudokuBoard with the given number at the given Coordinate
setBoardTile :: SudokuBoard -> (Int, Int) -> Int -> SudokuBoard
setBoardTile b (x, y) i = b // [((x, y), Just i)]

-- | 'initBoard' function takes empty board and file contents and returns the initialized board
initBoard :: String -> SudokuBoard
initBoard str = array ((0,0), (8,8)) [((x, y), value) | x <- [0..8]
                                                      , y <- [0..8]
                                                      , let value = toMaybeInt $ lines str !! y !! x ]

toMaybeInt :: Char -> Maybe Int
toMaybeInt c | c == ' '  = Nothing
             | isDigit c = Just (digitToInt c)
             | otherwise = error "Invalid input board"

-- | 'display' function to convert a SudokuBoard to String representation
display :: SudokuBoard -> String
display board = unlines [rowToString board y | y <- [0..8]]

rowToString :: SudokuBoard -> Int -> String
rowToString board y = [fromMaybeInt $ board ! (x,y) | x <- [0..8]]

fromMaybeInt :: Maybe Int -> Char
fromMaybeInt Nothing  = ' '
fromMaybeInt (Just x) = intToDigit x

-- | 'solve' function takes initialized board and returns the solved board (TO BE IMPLEMENTED) 
solve :: SudokuBoard -> SudokuBoard
solve board = board

-- | 'check' returns a boolean indicating if there are contradictions within the board
check :: SudokuBoard -> Bool
check b = checkRows b && checkColumns b && checkTiles b

checkRows :: SudokuBoard -> Bool
checkRows b = foldl1 (&&) [checkRow b y | y <- [0..8]]

checkColumns :: SudokuBoard -> Bool
checkColumns b = foldl1 (&&) [checkColumn b x | x <- [0..8]]

checkTiles :: SudokuBoard -> Bool
checkTiles b = foldl1 (&&) [checkTile b t | t <- range ((0,0), (2,2))]


checkSet :: [Maybe Int] -> Bool
checkSet [] = True
checkSet (Nothing : xs) = checkSet xs
checkSet (x : xs) = notElem x xs && checkSet xs

checkRow :: SudokuBoard -> Int -> Bool
checkRow b y = checkSet $ getRowValues b y

checkColumn :: SudokuBoard -> Int -> Bool
checkColumn b x = checkSet $ getColumnValues b x

checkTile :: SudokuBoard -> (Int, Int) -> Bool
checkTile b p = checkSet $ getTileValues b p
	

getRowValues :: SudokuBoard -> Int -> [Maybe Int]
getRowValues board y = [board!(x,y) | x <- [0..8]]

getColumnValues :: SudokuBoard -> Int -> [Maybe Int]
getColumnValues board x = [board!(x,y) | y <- [0..8]]

getTileValues :: SudokuBoard -> (Int, Int) -> [Maybe Int]
getTileValues board (x,y) = [ board ! c | c <- range ((x, x+2), (y, y+2))]
