module DNA (nucleotideCounts, Nucleotide (..)) where

import Data.Map (Map, fromList)

data Nucleotide = A | C | G | T deriving (Eq, Ord, Show, Enum, Bounded)

nucleotides :: [Char]
nucleotides = map (head . show) [minBound .. maxBound :: Nucleotide]

isValid :: String -> Bool
isValid = all (`elem` nucleotides)

nucleotideCounts :: String -> Either String (Map Nucleotide Int)
nucleotideCounts xs =
  if isValid xs
    then Right counts
    else Left "invalid"
  where
    counts = fromList $ map (\n -> (n, countOccurence n xs)) [A, C, G, T]
    countOccurence c = foldl (\acc x -> if x == convert c then acc + 1 else acc) 0
    convert = head . show