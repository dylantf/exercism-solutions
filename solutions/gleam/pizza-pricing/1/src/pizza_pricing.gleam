import gleam/list
import gleam/result

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza {
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(p) -> 1 + pizza_price(p)
    ExtraToppings(p) -> 2 + pizza_price(p)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let base_fee =
    order
    |> list.map(pizza_price)
    |> list.reduce(fn(acc, price) { acc + price })
    |> result.unwrap(0)

  let surcharge = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }

  base_fee + surcharge
}
