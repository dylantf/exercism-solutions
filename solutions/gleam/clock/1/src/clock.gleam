import gleam/int

pub type Clock {
  Clock(minutes: Int)
}

/// Convert raw minutes into maximum clock-minutes per day
fn normalize(clock: Clock) -> Clock {
  // Maximum number of minutes in a 24-hour clock
  let max = 1440
  Clock(minutes: { max + { clock.minutes % max } } % max)
}

pub fn create(hour hour: Int, minute minute: Int) -> Clock {
  Clock(hour * 60 + minute) |> normalize
}

pub fn add(clock: Clock, minutes minutes: Int) -> Clock {
  Clock(minutes: clock.minutes + minutes) |> normalize
}

pub fn subtract(clock: Clock, minutes minutes: Int) -> Clock {
  Clock(minutes: clock.minutes - minutes) |> normalize
}

fn lpad(number: Int) -> String {
  case number {
    n if n < 10 -> "0" <> int.to_string(n)
    n -> int.to_string(n)
  }
}

pub fn display(clock: Clock) -> String {
  let hours = clock.minutes / 60
  let minutes = clock.minutes % 60
  lpad(hours) <> ":" <> lpad(minutes)
}
