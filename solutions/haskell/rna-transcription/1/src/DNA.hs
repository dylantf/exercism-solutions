module DNA (toRNA) where

import Data.List (find)

validChars :: [Char]
validChars = ['G', 'C', 'T', 'A']

transpose :: Char -> Char
transpose 'G' = 'C'
transpose 'C' = 'G'
transpose 'T' = 'A'
transpose 'A' = 'U'
transpose _ = 'X'

isValid :: String -> Either Char String
isValid input = case find (`notElem` validChars) input of
  Just x -> Left x
  Nothing -> Right input

toRNA :: String -> Either Char String
toRNA xs = case isValid xs of
  Left x -> Left x
  Right str -> Right $ map transpose str
