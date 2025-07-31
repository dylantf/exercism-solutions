module Raindrops (convert) where

convert :: Int -> String
convert n =
  (printSounds . concatMap snd . filter (isDiv . fst)) sounds
  where
    sounds = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
    isDiv f = n `mod` f == 0
    printSounds "" = show n
    printSounds res = res