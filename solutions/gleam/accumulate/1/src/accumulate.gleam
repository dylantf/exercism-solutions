import gleam/list

pub fn accumulate(list: List(a), fun: fn(a) -> b) -> List(b) {
  accumulate_help(list, fun, [])
  |> list.reverse
}

fn accumulate_help(list: List(a), fun: fn(a) -> b, acc: List(b)) {
  case list {
    [] -> acc
    [a, ..rest] -> accumulate_help(rest, fun, [fun(a), ..acc])
  }
}
