import gleam/float
import gleam/int
import gleam/iterator
import gleam/result

pub fn square_of_sum(n: Int) -> Int {
  iterator.range(1, n)
  |> iterator.to_list
  |> int.sum
  |> int.power(2.0)
  |> result.map(float.round)
  |> result.unwrap(1)
}

pub fn sum_of_squares(n: Int) -> Int {
  iterator.range(1, n)
  |> iterator.fold(0.0, fn(acc, cur) {
    int.power(cur, 2.0)
    |> result.unwrap(0.0)
    |> float.add(acc)
  })
  |> float.round
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}
