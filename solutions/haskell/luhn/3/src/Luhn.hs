module Luhn (isValid) where

import Data.Char

lsum :: [Int] -> Int
lsum digits = sum $ zipWith ($) (cycle [id, double]) digits
  where
    double x = if x * 2 > 9 then x * 2 - 9 else x * 2

isValid :: String -> Bool
isValid n
  | length validChars < 2 = False
  | not hasAllValidChars = False
  | otherwise = summed `rem` 10 == 0
  where
    validChars = filter (not . isSpace) n
    hasAllValidChars = all isDigit validChars
    summed = lsum (reverse (map digitToInt validChars))