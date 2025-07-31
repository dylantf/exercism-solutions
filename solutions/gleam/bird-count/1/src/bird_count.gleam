pub fn today(days: List(Int)) -> Int {
  case days {
    [] -> 0
    [n, ..] -> n
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [] -> [1]
    [n, ..rest] -> [n + 1, ..rest]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [] -> False
    [n, ..] if n == 0 -> True
    [_, ..rest] -> has_day_without_birds(rest)
  }
}

// Of course there's a stdlib fn for this but this is about recursion...
fn sum_days(days: List(Int), acc: Int) {
  case days {
    [] -> acc
    [n, ..rest] -> sum_days(rest, acc + n)
  }
}

pub fn total(days: List(Int)) -> Int {
  sum_days(days, 0)
}

fn count_busy_days(days: List(Int), acc: Int) {
  case days {
    [] -> acc
    [n, ..rest] ->
      case n >= 5 {
        True -> count_busy_days(rest, acc + 1)
        False -> count_busy_days(rest, acc)
      }
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  count_busy_days(days, 0)
}
