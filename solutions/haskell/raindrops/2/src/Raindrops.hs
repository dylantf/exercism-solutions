module Raindrops (convert) where

convert :: Int -> String
convert n
  | null result = show n
  | otherwise = concat result
  where
    sounds = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
    result = [s | (f, s) <- sounds, n `mod` f == 0]
