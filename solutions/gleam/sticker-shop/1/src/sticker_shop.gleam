pub type Usd

pub type Eur

pub type Jpy

pub opaque type Money(currency) {
  Money(Int)
}

pub fn dollar(amount: Int) -> Money(Usd) {
  Money(amount)
}

pub fn euro(amount: Int) -> Money(Eur) {
  Money(amount)
}

pub fn yen(amount: Int) -> Money(Jpy) {
  Money(amount)
}

pub fn total(prices: List(Money(currency))) -> Money(currency) {
  Money(sum(prices, 0))
}

fn sum(prices: List(Money(currency)), acc: Int) -> Int {
  case prices {
    [] -> acc
    [Money(amount), ..rest] -> amount + sum(rest, acc)
  }
}
