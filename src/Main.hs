module Main where

type SudokuBoard = (Int -> Int) -> Int

main::IO()
main = do
    inputPuzzle <- readFile "../puzzle.txt"
    mapM_ putStrLn (lines inputPuzzle)