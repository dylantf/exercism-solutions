module Acronym (abbreviate) where

import Data.Char (isLower, isUpper, toUpper)

isMixedCase :: String -> Bool
isMixedCase input = any isUpper input && any isLower input

convertSeparators :: String -> String
convertSeparators = map (\c -> if c `elem` separators then ' ' else c)
  where
    separators = ['-']

abbreviateWord :: String -> String
abbreviateWord w =
  if isMixedCase w
    then filter isUpper w
    else [(toUpper . head) w]

abbreviate :: String -> String
abbreviate = concatMap abbreviateWord . words . convertSeparators
