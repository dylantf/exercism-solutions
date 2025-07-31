import gleam/int
import gleam/list
import gleam/string

const sounds = [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]

pub fn convert(number: Int) -> String {
  let sound =
    sounds
    |> list.fold("", fn(acc, cur) {
      case int.modulo(number, by: cur.0) {
        Ok(0) -> acc <> cur.1
        _ -> acc
      }
    })

  case string.length(sound) > 0 {
    True -> sound
    False -> int.to_string(number)
  }
}
