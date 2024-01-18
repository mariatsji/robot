module Main where

import Test.Hspec

import qualified ParserTests

main :: IO ()
main = hspec ParserTests.spec