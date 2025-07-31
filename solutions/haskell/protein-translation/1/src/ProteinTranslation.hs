module ProteinTranslation (proteins) where

import Data.List (find)

type Protein = String

type Codon = String

codonMapping :: [([Codon], Protein)]
codonMapping =
  [ (["AUG"], "Methionine"),
    (["UUU", "UUC"], "Phenylalanine"),
    (["UUA", "UUG"], "Leucine"),
    (["UCU", "UCC", "UCA", "UCG"], "Serine"),
    (["UAU", "UAC"], "Tyrosine"),
    (["UGU", "UGC"], "Cysteine"),
    (["UGG"], "Tryptophan"),
    (["UAA", "UAG", "UGA"], "STOP")
  ]

decodeCodon :: Codon -> Maybe Protein
decodeCodon c = snd <$> find (\(codons, _) -> c `elem` codons) codonMapping

decodeCodons :: [Protein] -> [Codon] -> [Protein]
decodeCodons acc [] = acc
decodeCodons acc (x : xs) =
  case decodeCodon x of
    Just "STOP" -> acc
    Just protein -> decodeCodons (protein : acc) xs
    Nothing -> acc

chunkBy :: Int -> [a] -> [[a]]
chunkBy _ [] = []
chunkBy n xs = take n xs : chunkBy n (drop n xs)

proteins :: String -> Maybe [Protein]
proteins rna = Just $ reverse $ decodeCodons [] $ chunkBy 3 rna
