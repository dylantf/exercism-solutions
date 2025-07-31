module RomanNumerals

[<TailCall>]
let rec roman arabicNumeral =
    let rec toRoman acc n =
        match n with
        | n when n >= 1000 -> toRoman (acc + "M") (n - 1000)
        | n when n >= 900 -> toRoman (acc + "CM") (n - 900)
        | n when n >= 500 -> toRoman (acc + "D") (n - 500)
        | n when n >= 400 -> toRoman (acc + "CD") (n - 400)
        | n when n >= 100 -> toRoman (acc + "C") (n - 100)
        | n when n >= 90 -> toRoman (acc + "XC") (n - 90)
        | n when n >= 50 -> toRoman (acc + "L") (n - 50)
        | n when n >= 40 -> toRoman (acc + "XL") (n - 40)
        | n when n >= 10 -> toRoman (acc + "X") (n - 10)
        | n when n >= 9 -> toRoman (acc + "IX") (n - 9)
        | n when n >= 5 -> toRoman (acc + "V") (n - 5)
        | n when n >= 4 -> toRoman (acc + "IV") (n - 4)
        | n when n >= 1 -> toRoman (acc + "I") (n - 1)
        | _ -> acc
    
    toRoman "" arabicNumeral
    