import gleam/list
import gleam/result
import gleam/string

fn encode(c: String) {
  case c {
    "G" -> Ok("C")
    "C" -> Ok("G")
    "T" -> Ok("A")
    "A" -> Ok("U")
    _ -> Error(Nil)
  }
}

pub fn to_rna(dna: String) -> Result(String, Nil) {
  dna
  |> string.to_graphemes
  |> list.try_map(encode)
  |> result.map(string.concat)
}
