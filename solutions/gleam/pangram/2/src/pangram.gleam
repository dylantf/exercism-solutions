import gleam/list
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  let alphabet = string.to_graphemes("abcdefghijklmnopqrstuvwxyz")

  let sentence =
    sentence
    |> string.lowercase
    |> string.to_graphemes

  list.all(alphabet, list.contains(sentence, _))
}
