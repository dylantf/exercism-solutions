import gleam/string

fn hammer_time(c1: String, c2: String, acc: Int) {
  case string.pop_grapheme(c1), string.pop_grapheme(c2) {
    Ok(#(g1, rest1)), Ok(#(g2, rest2)) -> {
      case g1 == g2 {
        True -> hammer_time(rest1, rest2, acc)
        False -> hammer_time(rest1, rest2, acc + 1)
      }
    }
    _, _ -> acc
  }
}

pub fn distance(strand1: String, strand2: String) -> Result(Int, Nil) {
  case string.length(strand1) == string.length(strand2) {
    False -> Error(Nil)
    True -> Ok(hammer_time(strand1, strand2, 0))
  }
}
