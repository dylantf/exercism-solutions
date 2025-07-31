module Leap

let yearDivisibleBy (year: int) (factor: int) = year % factor = 0

let leapYear (year: int) : bool =
    let isDivBy = yearDivisibleBy year
    isDivBy 400 || isDivBy 100 <> isDivBy 4
