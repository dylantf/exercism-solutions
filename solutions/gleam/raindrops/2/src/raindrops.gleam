import gleam/int
import gleam/list

const sounds = [#(3, "Pling"), #(5, "Plang"), #(7, "Plong")]

pub fn convert(number: Int) -> String {
  let sound =
    list.fold(sounds, "", fn(acc, cur) {
      case int.modulo(number, by: cur.0) {
        Ok(0) -> acc <> cur.1
        _ -> acc
      }
    })

  case sound {
    "" -> int.to_string(number)
    s -> s
  }
}
