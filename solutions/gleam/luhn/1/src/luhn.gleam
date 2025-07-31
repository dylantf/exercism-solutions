import gleam/int
import gleam/list
import gleam/regex
import gleam/result
import gleam/string

pub fn valid(value: String) -> Bool {
  let luhn_sum = {
    use input <- result.try(validate_string(value))
    use digits <- result.try(to_digits(input))
    use sum <- result.try(is_luhn_valid(digits))
    Ok(sum)
  }

  case luhn_sum {
    Ok(_) -> True
    Error(_) -> False
  }
}

fn validate_string(input: String) {
  let input = string.replace(input, " ", "")
  let assert Ok(pattern) = regex.from_string("^\\d+$")
  let is_all_digits = regex.check(with: pattern, content: input)
  let is_valid_length = string.length(input) > 1

  case is_all_digits, is_valid_length {
    True, True -> Ok(input)
    _, _ -> Error(Nil)
  }
}

fn to_digits(input: String) -> Result(List(Int), Nil) {
  input
  |> string.to_graphemes()
  |> list.map(int.parse)
  |> list.fold(Ok([]), fn(acc, digit) {
    case acc, digit {
      Ok(acc), Ok(d) -> Ok([d, ..acc])
      Error(_), _ -> Error(Nil)
      _, Error(_) -> Error(Nil)
    }
  })
}

fn is_luhn_valid(digits: List(Int)) {
  let sum = checksum(digits, 0)
  case sum % 10 == 0 {
    True -> Ok(sum)
    False -> Error(Nil)
  }
}

fn checksum(digits: List(Int), acc: Int) {
  case digits {
    [] -> acc
    [x] -> acc + x
    [x, y, ..xs] -> checksum(xs, acc + x + normalize(y * 2))
  }
}

fn normalize(digit: Int) {
  case digit {
    d if d > 9 -> d - 9
    d -> d
  }
}
