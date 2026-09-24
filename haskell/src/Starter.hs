module Starter
  ( projectName
  , add
  , greet
  ) where

import Data.Char (isSpace)
import Data.List (dropWhileEnd)

projectName :: String
projectName = "starter"

add :: Int -> Int -> Int
add a b = a + b

greet :: String -> String
greet name =
  let who = case trim name of
        "" -> "world"
        trimmed -> trimmed
   in "Hello, " ++ who

trim :: String -> String
trim = dropWhileEnd isSpace . dropWhile isSpace
