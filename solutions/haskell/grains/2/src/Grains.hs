module Grains (square, total) where

import Data.Bits

square :: Integer -> Maybe Integer
square n
  | n >= 1 && n <= 64 = (1 `shiftL`) <$> Just (fromInteger n - 1)
  | otherwise = Nothing

total :: Integer
total = (1 `shiftL` 64) - 1
