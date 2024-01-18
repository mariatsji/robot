module Render(renderR) where

import Brick
import Robot

ui :: Robot -> Widget ()
ui _ = str "Vebjørn og Nikolai Robot 1.0"

renderR :: Robot -> IO ()
renderR robot = simpleMain $ ui robot