#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(a: &[T], b: &[T]) -> Comparison {
    match (a.len(), b.len()) {
        (x, y) if x == y && a == b => Comparison::Equal,
        (x, y) if x > y && is_sublist(b, a) => Comparison::Superlist,
        (x, y) if x < y && is_sublist(a, b) => Comparison::Sublist,
        _ => Comparison::Unequal,
    }
}

fn is_sublist<T: PartialEq>(a: &[T], b: &[T]) -> bool {
    a.is_empty() || b.windows(a.len()).any(|win| win == a)
}
