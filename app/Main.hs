module Main where

import qualified Data.Text.IO as TIO
import Robot
import Render
import ParseInstructions
import System.Environment (getArgs)

main :: IO ()
main = do
    [args] <- getArgs
    txt <- TIO.readFile args
    case parse txt of
        Left err -> putStrLn err
        Right is -> renderR $ executeAll is new

