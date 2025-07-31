import gleam/int
import gleam/list
import gleam/result
import gleam/string

pub fn valid(value: String) -> Bool {
  value
  |> to_digits
  |> result.then(validate_length)
  |> result.map(validate_checksum)
  |> result.unwrap(False)
}

fn to_digits(input) {
  input
  |> string.replace(" ", "")
  |> string.to_graphemes
  |> list.reverse
  |> list.try_map(int.parse)
}

fn validate_length(input) {
  case list.length(input) > 1 {
    True -> Ok(input)
    False -> Error(Nil)
  }
}

fn validate_checksum(digits) {
  checksum(digits, 0) % 10 == 0
}

fn checksum(digits, acc) {
  case digits {
    [] -> acc
    [x] -> acc + x
    [x, y, ..xs] -> checksum(xs, acc + x + normalize(y * 2))
  }
}

fn normalize(digit) {
  case digit {
    d if d > 9 -> d - 9
    d -> d
  }
}
