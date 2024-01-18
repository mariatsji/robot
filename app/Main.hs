module Main where

import Robot

main :: IO ()
main = 
    let robot = new
        instructions = [Move 3, Turn D, Move 2, Turn R, Move 1]
        robot' = executeAll instructions robot
    in print $ draw robot'
