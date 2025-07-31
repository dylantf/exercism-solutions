module Pangram (isPangram) where

import Data.Char

isPangram :: String -> Bool
isPangram text = alphabet == matchedChars
  where
    source = map toLower text
    alphabet = ['a' .. 'z']
    matchedChars = takeWhile (`elem` source) alphabet
