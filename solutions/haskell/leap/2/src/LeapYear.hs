module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year
  | divisible year 400 = True
  | divisible year 100 = False
  | divisible year 4 = True
  | otherwise = False
  where
    divisible x y = rem x y == 0