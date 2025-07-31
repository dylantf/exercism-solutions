module ArmstrongNumbers (armstrong) where

import Data.Char (digitToInt)

armstrong :: Int -> Bool
armstrong n = n == sum (map (^ length digits) digits)
  where digits = map digitToInt $ show n
