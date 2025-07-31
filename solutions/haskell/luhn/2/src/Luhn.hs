module Luhn (isValid) where

import Control.Monad (guard)
import Data.Char

lsum :: [Int] -> Int
lsum digits = sum (zipWith ($) (cycle [id, adjust]) digits)
  where
    adjust n
      | n * 2 > 9 = n * 2 - 9
      | otherwise = n * 2

isValid :: String -> Bool
isValid n = case do
  let cleaned = filter (not . isSpace) n
  guard (all isDigit cleaned)
  let validChars = filter isDigit cleaned
  guard (length validChars >= 2)
  let digits = map digitToInt validChars
  let summed = lsum $ reverse digits
  guard (summed `rem` 10 == 0)
  return True of
  Just _ -> True
  Nothing -> False
