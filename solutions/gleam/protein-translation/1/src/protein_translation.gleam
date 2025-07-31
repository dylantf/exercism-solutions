import gleam/list
import gleam/result
import gleam/string

fn encode(sequence: String) -> Result(String, Nil) {
  case sequence {
    "AUG" -> Ok("Methionine")
    "UUU" | "UUC" -> Ok("Phenylalanine")
    "UUA" | "UUG" -> Ok("Leucine")
    "UCU" | "UCC" | "UCA" | "UCG" -> Ok("Serine")
    "UAU" | "UAC" -> Ok("Tyrosine")
    "UGU" | "UGC" -> Ok("Cysteine")
    "UGG" -> Ok("Tryptophan")
    "UAA" | "UAG" | "UGA" -> Ok("STOP")
    _ -> Error(Nil)
  }
}

fn encode_sequence(
  acc: List(String),
  sequences: List(String),
) -> Result(List(String), Nil) {
  case sequences {
    [] -> Ok(acc)
    [seq, ..rest] ->
      case encode(seq) {
        Ok("STOP") -> Ok(acc)
        Ok(protein) -> encode_sequence([protein, ..acc], rest)
        Error(_) -> Error(Nil)
      }
  }
}

pub fn proteins(rna: String) -> Result(List(String), Nil) {
  let codons =
    rna
    |> string.to_graphemes
    |> list.sized_chunk(3)
    |> list.map(string.join(_, ""))

  encode_sequence([], codons)
  |> result.map(list.reverse)
}
