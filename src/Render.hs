module Render(renderR) where

import Brick
import qualified Brick.Main as M
import qualified Brick.Types as BT
import qualified Brick.Widgets.Border as B
import qualified Brick.Widgets.Center as C
import qualified Brick.Widgets.Table as T
import Control.Monad (void)
import qualified Graphics.Vty as V

import Robot

robotWidget :: Robot -> (Int, Int) -> Widget ()
robotWidget (Robot d r c) (row, col) = str 
    $ if row == r && col == c then show d else "  "

robotWidgets :: Robot -> [[Widget ()]]
robotWidgets robot = 
    let coords = [[(row, col) | col <- [0..9]] | row <- [0..9]]
    in (fmap . fmap) (robotWidget robot) coords

drawUI :: Robot -> [Widget ()]
drawUI robot = [T.renderTable $ T.table $ robotWidgets robot]

app :: App Robot () ()
app = App { appDraw = drawUI
          , appStartEvent = pure ()
          , appHandleEvent = handleEvent
          , appChooseCursor = neverShowCursor
          , appAttrMap = const $ attrMap V.defAttr []
          }

handleEvent :: BrickEvent () () -> EventM () Robot ()
handleEvent (BT.VtyEvent (V.EvKey V.KEsc [])) = M.halt
handleEvent _ = pure ()

renderR :: Robot -> IO ()
renderR robot =
    void $ defaultMain app robot