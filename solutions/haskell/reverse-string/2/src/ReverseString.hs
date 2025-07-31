module ReverseString (reverseString) where

reverseString :: String -> String
reverseString str = foldl (\acc cur -> cur:acc) [] str
