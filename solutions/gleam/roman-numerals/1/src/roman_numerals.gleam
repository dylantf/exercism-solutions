pub fn convert(number: Int) -> String {
  case number {
    n if number >= 1000 -> "M" <> convert(n - 1000)
    n if number >= 900 -> "CM" <> convert(n - 900)
    n if number >= 500 -> "D" <> convert(n - 500)
    n if number >= 400 -> "CD" <> convert(n - 400)
    n if number >= 100 -> "C" <> convert(n - 100)
    n if number >= 90 -> "XC" <> convert(n - 90)
    n if number >= 50 -> "L" <> convert(n - 50)
    n if number >= 40 -> "XL" <> convert(n - 40)
    n if number >= 10 -> "X" <> convert(n - 10)
    n if number >= 9 -> "IX" <> convert(n - 9)
    n if number >= 5 -> "V" <> convert(n - 5)
    n if number >= 4 -> "IV" <> convert(n - 4)
    n if number >= 1 -> "I" <> convert(n - 1)
    _ -> ""
  }
}
