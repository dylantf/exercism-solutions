module Grains (square, total) where

p :: Integer -> Integer
p n = 2 ^ (n - 1)

square :: Integer -> Maybe Integer
square n
  | n < 1 || n > 64 = Nothing
  | otherwise = Just (p n)

total :: Integer
total = foldr ((+) . p) 0 [1 .. 64]
