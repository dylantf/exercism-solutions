pub type Error {
  NonPositiveNumber
}

pub fn steps(number: Int) -> Result(Int, Error) {
  case number {
    _ if number <= 0 -> Error(NonPositiveNumber)
    _ -> Ok(collatz(number, 0))
  }
}

fn collatz(n: Int, acc: Int) {
  case n, n % 2 {
    1, _ -> acc
    _, 0 -> collatz(n / 2, acc + 1)
    _, _ -> collatz(n * 3 + 1, acc + 1)
  }
}
