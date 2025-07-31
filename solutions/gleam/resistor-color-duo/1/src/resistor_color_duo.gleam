import gleam/int
import gleam/list
import gleam/string

pub type Color {
  Black
  Brown
  Red
  Orange
  Yellow
  Green
  Blue
  Violet
  Grey
  White
}

fn color_value(color: Color) {
  case color {
    Black -> 0
    Brown -> 1
    Red -> 2
    Orange -> 3
    Yellow -> 4
    Green -> 5
    Blue -> 6
    Violet -> 7
    Grey -> 8
    White -> 9
  }
}

pub fn value(colors: List(Color)) -> Result(Int, Nil) {
  case colors {
    [] | [_] -> Error(Nil)
    [c1, c2, ..] ->
      [c1, c2]
      |> list.map(color_value)
      |> list.map(int.to_string)
      |> string.join("")
      |> int.parse
  }
}
