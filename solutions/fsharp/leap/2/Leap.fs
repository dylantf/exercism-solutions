module Leap

// on every year that is evenly divisible by 4
//   except every year that is evenly divisible by 100
//     unless the year is also evenly divisible by 400

let leapYear (year: int) : bool =
    let divBy4 = year % 4 = 0
    let divBy100 = year % 100 = 0
    let divBy400 = year % 400 = 0

    divBy4 && (not divBy100 || (divBy100 && divBy400))
