module CollatzConjecture (collatz) where

steps :: Integer -> Integer -> Integer
steps 1 acc = acc
steps n acc
  | even n = steps (n `div` 2) (acc + 1)
  | otherwise = steps ((n * 3) + 1) (acc + 1)

collatz :: Integer -> Maybe Integer
collatz n
  | n > 0 = Just $ steps n 0
  | otherwise = Nothing
