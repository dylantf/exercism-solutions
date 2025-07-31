module Darts (score) where

distance :: Float -> Float -> Float
distance x y = sqrt $ x * x + y * y

data Position
  = Inner
  | Middle
  | Outer
  | Outside

position :: Float -> Position
position d
  | d <= 1 = Inner
  | d <= 5 = Middle
  | d <= 10 = Outer
  | otherwise = Outside

score :: Float -> Float -> Int
score x y =
  case pos of
    Inner -> 10
    Middle -> 5
    Outer -> 1
    Outside -> 0
  where
    pos = position $ distance x y
