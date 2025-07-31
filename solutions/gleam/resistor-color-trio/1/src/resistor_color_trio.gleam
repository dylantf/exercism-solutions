import gleam/float
import gleam/int
import gleam/list
import gleam/result

const giga = 1_000_000_000

const mega = 1_000_000

const kilo = 1000

pub type Resistance {
  Resistance(unit: String, value: Int)
}

fn color_value(color: String) -> Int {
  case color {
    "black" -> 0
    "brown" -> 1
    "red" -> 2
    "orange" -> 3
    "yellow" -> 4
    "green" -> 5
    "blue" -> 6
    "violet" -> 7
    "grey" -> 8
    "white" -> 9
    _ -> panic
  }
}

fn add_zeroes(value: Int, num_zeroes: Int) -> Result(Int, Nil) {
  int.to_float(num_zeroes)
  |> int.power(10, _)
  |> result.map(float.round)
  |> result.map(int.multiply(_, value))
}

fn to_resistance(value: Int) {
  case value {
    v if v > giga -> Resistance("gigaohms", v / giga)
    v if v > mega -> Resistance("megaohms", v / mega)
    v if v > kilo -> Resistance("kiloohms", v / kilo)
    v -> Resistance("ohms", v)
  }
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  let values = colors |> list.map(color_value)
  let value = case values {
    [] -> Error(Nil)
    [d1] -> add_zeroes(d1, 0)
    [d1, d2] -> add_zeroes(d1 * 10 + d2, 0)
    [d1, d2, d3, ..] -> add_zeroes(d1 * 10 + d2, d3)
  }

  result.map(value, to_resistance)
}
