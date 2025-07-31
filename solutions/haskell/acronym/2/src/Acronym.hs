module Acronym (abbreviate) where

import Data.Char

abbreviate :: String -> String
abbreviate = concatMap (filter isUpper . abbreviateWord) . words . map replaceSeparator
  where
    replaceSeparator '-' = ' '
    replaceSeparator other = other
    abbreviateWord [] = []
    abbreviateWord word@(x : xs)
      | all isUpper word = x : map toLower xs
      | otherwise = toUpper x : xs
