module ParseInstructions (parse) where

import Robot

import Control.Applicative ((<|>))
import Data.Attoparsec.Text (Parser)
import Data.Attoparsec.Text qualified as A
import Data.Text (Text)

parse :: Text -> Either String [Instruction]
parse = A.parseOnly isParser

isParser :: Parser [Instruction]
isParser = A.many1 (iParser <* (A.endOfLine <|> A.endOfInput))

iParser :: Parser Instruction
iParser = moveParser <|> leftParser <|> rightParser

moveParser :: Parser Instruction
moveParser = do
    _ <- A.asciiCI "go"
    _ <- A.space
    n <- A.decimal
    pure $ Go n

leftParser :: Parser Instruction
leftParser = do
    _ <- A.asciiCI "turn left"
    pure TurnLeft

rightParser :: Parser Instruction
rightParser = do
    _ <- A.asciiCI "turn right"
    pure TurnRight