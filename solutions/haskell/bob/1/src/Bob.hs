module Bob (responseFor) where

import Data.Char (toUpper)
import Data.String (IsString (fromString))
import qualified Data.Text as T

responseFor :: String -> String
responseFor input
  | question && yelling = "Calm down, I know what I'm doing!"
  | question = "Sure."
  | yelling = "Whoa, chill out!"
  | silence = "Fine. Be that way!"
  | otherwise = "Whatever."
  where
    xs = (T.unpack . T.strip . fromString) input
    question = not silence && last xs == '?'
    yelling = not silence && xs == map toUpper xs && any (\c -> toUpper c `elem` ['A' .. 'Z']) xs
    silence = length xs == (length . filter (\c -> c `elem` [' ', '\t'])) xs
