module LeapYear (isLeapYear) where

isLeapYear :: Integer -> Bool
isLeapYear year =
  case (year `mod` 400, year `mod` 100, year `mod` 4) of
    (0, 0, 0) -> True
    (_, 0, 0) -> False
    (_, _, 0) -> True
    _ -> False