import gleam/string

// Manual implementation of string.reverse

fn swap(value: String, index: Int) -> String {
  let length = string.length(value)
  let swap_index = length - index - 1
  let char1 = string.slice(value, index, 1)
  let char2 = string.slice(value, swap_index, 1)

  let first_chunk = string.slice(value, 0, index)
  let middle_chunk = string.slice(value, index + 1, swap_index - index - 1)
  let last_chunk = string.slice(value, swap_index + 1, length - swap_index - 1)
  first_chunk <> char2 <> middle_chunk <> char1 <> last_chunk
}

fn reverse_string_rec(value: String, index: Int) -> String {
  let length = string.length(value)
  case length, index {
    0, _ -> ""
    _, i if i >= length / 2 -> value
    _, i -> {
      let swapped = swap(value, i)
      reverse_string_rec(swapped, i + 1)
    }
  }
}

pub fn reverse(value: String) -> String {
  reverse_string_rec(value, 0)
}
