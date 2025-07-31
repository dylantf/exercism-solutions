import gleam/float
import gleam/result

fn distance(x: Float, y: Float) {
  use x_sq <- result.try(float.power(0.0 -. x, 2.0))
  use y_sq <- result.try(float.power(0.0 -. y, 2.0))
  float.square_root(x_sq +. y_sq)
}

pub fn score(x: Float, y: Float) -> Int {
  case distance(x, y) {
    Ok(d) if d <=. 1.0 -> 10
    Ok(d) if d <=. 5.0 -> 5
    Ok(d) if d <=. 10.0 -> 1
    _ -> 0
  }
}
