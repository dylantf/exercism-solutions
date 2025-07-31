module ResistorColors (Color (..), Resistor (..), label, ohms) where

data Color = Black | Brown | Red | Orange | Yellow | Green | Blue | Violet | Grey | White
  deriving (Show, Enum, Bounded)

newtype Resistor = Resistor {bands :: (Color, Color, Color)}
  deriving (Show)

kilo = 1000
mega = kilo * 1000
giga = mega * 1000

label :: Resistor -> String
label resistor = do
  toText $ ohms resistor
  where
    toText v
      | v > giga = show (v `div` giga) <> " gigaohms"
      | v > mega = show (v `div` mega) <> " megaohms"
      | v > kilo = show (v `div` kilo) <> " kiloohms"
      | otherwise = show v <> " ohms"

ohms :: Resistor -> Int
ohms (Resistor (c1, c2, c3)) = (fromEnum c1 * 10 + fromEnum c2) * (10 ^ fromEnum c3)
