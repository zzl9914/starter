module Main where

import System.Exit (exitFailure)
import Starter (add, greet, projectName)

main :: IO ()
main = do
  expect (add 2 3 == 5) "add"
  expect (add (-1) 1 == 0) "add neg"
  expect (projectName == "starter") "name"
  expect (greet "Ada" == "Hello, Ada") "greet"
  expect (greet "  Ada  " == "Hello, Ada") "trim"
  expect (greet "" == "Hello, world") "empty"
  expect (greet "   " == "Hello, world") "blank"
  putStrLn "haskell ok"

expect :: Bool -> String -> IO ()
expect True _ = pure ()
expect False message = do
  putStrLn ("FAIL " ++ message)
  exitFailure
