import gleam/int

pub fn is_leap_year(year: Int) -> Bool {
  let div_by = fn(n: Int) {
    case int.modulo(year, n) {
      Ok(0) -> True
      _ -> False
    }
  }

  case div_by(4), div_by(100), div_by(400) {
    True, False, _ -> True
    _, True, True -> True
    _, _, _ -> False
  }
}
