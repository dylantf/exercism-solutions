import gleam/result

pub type Error {
  NonPositiveNumber
}

fn succ(x) {
  x + 1
}

pub fn steps(n: Int) -> Result(Int, Error) {
  case n, n % 2 == 0 {
    _, _ if n <= 0 -> Error(NonPositiveNumber)
    1, _ -> Ok(0)
    n, True -> result.map(steps(n / 2), succ)
    n, False -> result.map(steps(n * 3 + 1), succ)
  }
}
