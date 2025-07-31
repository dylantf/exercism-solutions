module Hamming (distance) where

distance :: String -> String -> Maybe Int
distance xs ys =
  if length xs /= length ys
    then Nothing
    else (Just . sum) (zipWith (\a b -> (if a /= b then 1 else 0)) xs ys)
