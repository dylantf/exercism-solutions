module DNA (toRNA) where

toRNA :: String -> Either Char String
toRNA = traverse transpose
  where
    transpose :: Char -> Either Char Char
    transpose 'G' = Right 'C'
    transpose 'C' = Right 'G'
    transpose 'T' = Right 'A'
    transpose 'A' = Right 'U'
    transpose c = Left c