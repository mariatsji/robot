module ParserTests(spec) where

import ParseInstructions
import Robot

import Data.Text (Text)
import NeatInterpolation
import Test.Hspec

movez :: Text
movez =
  [text|
go 5
turn right
go 3
turn right
go 2
|]

spec :: Spec
spec = describe "Move parser" $ do
    it "can parse moves" $ do
      parse movez `shouldBe` Right [Go 5, TurnRight, Go 3, TurnRight, Go 2]
    it "moves relative to the robot's direction" $ do
      let robot = new
          Right instructions = parse movez
          robot' = executeAll instructions robot
      robot' `shouldBe` Robot L 3 3
