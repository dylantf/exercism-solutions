import gleam/list
import gleam/set
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  let alphabet = string.to_graphemes("abcdefghijklmnopqrstuvwxyz")

  let sentence =
    sentence
    |> string.lowercase
    |> string.to_graphemes
    |> list.filter(list.contains(alphabet, _))

  set.from_list(sentence) == set.from_list(alphabet)
}
