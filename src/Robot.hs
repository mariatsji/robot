module Robot (Robot(..), draw, Instruction (..), Direction (..), new, execute, executeAll)
where

import Data.Text (Text)
import Data.Text qualified as T

-- the robot has an objective heading, not relative to itself
data Direction = U | D | L | R
    deriving stock (Eq)

instance Show Direction where
    show U = "/\\"
    show D = "\\/"
    show L = "<-"
    show R = "->"

data Instruction = Go Int | TurnRight | TurnLeft
    deriving stock (Eq, Show)

type Row = Int -- 0 is the top row
type Col = Int -- 0 is the leftmost column

data Robot = Robot Direction Row Col
    deriving stock (Eq)

instance Show Robot where
    show (Robot d _ _) = show d

new :: Robot
new = Robot R 0 0

execute :: Instruction -> Robot -> Robot
execute (Go n) (Robot d r c) = case d of
    U -> Robot d (r - n) c
    D -> Robot d (r + n) c
    L -> Robot d r (c - n)
    R -> Robot d r (c + n)
execute TurnLeft (Robot d r c) =
    Robot
        ( case d of
            U -> L
            D -> R
            L -> D
            R -> U
        )
        r
        c
execute TurnRight (Robot d r c) =
    Robot
        ( case d of
            U -> R
            D -> L
            L -> U
            R -> D
        )
        r
        c

executeAll :: [Instruction] -> Robot -> Robot
executeAll is r = foldl (flip execute) r is

draw :: Robot -> Text
draw = T.pack . show