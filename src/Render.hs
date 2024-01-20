module Render(renderR) where

import Brick
import qualified Brick.Widgets.Border as B
import qualified Brick.Widgets.Center as C
import qualified Brick.Widgets.Table as T
import Control.Monad (void)
import qualified Graphics.Vty as V

import Robot

robotWidget :: Robot -> Widget ()
robotWidget robot = str $ show robot

robotWidgets :: Robot -> [[Widget ()]]
robotWidgets robot =  replicate 10 $ replicate 10 $ robotWidget robot

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
handleEvent _ = pure ()

renderR :: Robot -> IO ()
renderR robot =
    void $ defaultMain app robot