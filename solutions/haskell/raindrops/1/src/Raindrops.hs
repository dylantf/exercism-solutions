module Raindrops (convert) where

convert :: Int -> String
convert n =
  (printSounds . concatMap snd . filter (isDiv . fst)) sounds
  where
    sounds = [(3, "Pling"), (5, "Plang"), (7, "Plong")]
    isDiv factor = rem n factor == 0
    printSounds "" = show n
    printSounds str = str