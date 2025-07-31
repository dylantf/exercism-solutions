import gleam/dict.{type Dict}
import gleam/list
import gleam/option.{None, Some}
import gleam/string

type Counts =
  Dict(String, Int)

fn count(acc: Counts, strand: List(String)) -> Counts {
  case strand {
    [] -> acc
    [nucleotide, ..rest] -> {
      dict.update(acc, nucleotide, fn(value) {
        case value {
          Some(v) -> v + 1
          None -> 1
        }
      })
      |> count(rest)
    }
  }
}

pub fn nucleotide_count(dna: String) -> Result(Counts, Nil) {
  let letters = string.to_graphemes(dna)
  let valid =
    letters
    |> list.all(fn(letter) { list.contains(["C", "G", "A", "T"], letter) })

  case valid {
    True ->
      dict.from_list([#("C", 0), #("G", 0), #("A", 0), #("T", 0)])
      |> count(letters)
      |> Ok
    False -> Error(Nil)
  }
}
