module Bob (responseFor) where

import Data.Char
import Data.List

responseFor :: String -> String
responseFor input
  | silence = "Fine. Be that way!"
  | question && yelling = "Calm down, I know what I'm doing!"
  | question = "Sure."
  | yelling = "Whoa, chill out!"
  | otherwise = "Whatever."
  where
    chars = filter (not . isSpace) input
    question = "?" `isSuffixOf` chars
    yelling = (not . any isLower) chars && any isAlpha chars
    silence = null chars
