import gleam/list

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

fn base_order_price(order: List(Pizza)) {
  case order {
    [] -> 0
    [pizza, ..rest] -> pizza_price(pizza) + base_order_price(rest)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let surcharge = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }

  surcharge + base_order_price(order)
}
