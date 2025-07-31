module Luhn (isValid) where

import Data.Char

lsum :: [Int] -> Int -> Int
lsum [] acc = acc
lsum [d] acc = d + acc
lsum (x : y : xs) acc = lsum xs (acc + summed)
  where
    doubled = y * 2
    summed =
      if doubled > 9 then x + doubled - 9 else x + doubled

isValid :: String -> Bool
isValid n
  | length validChars < 2 = False
  | not hasAllValidChars = False
  | otherwise = summed `rem` 10 == 0
  where
    validChars = filter (not . isSpace) n
    hasAllValidChars = all isDigit validChars
    summed = flip lsum 0 $ reverse (map digitToInt validChars)
