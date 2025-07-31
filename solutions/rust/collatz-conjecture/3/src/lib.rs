pub fn collatz(n: u64) -> Option<u64> {
    match n {
        0 => None,
        1 => Some(0),
        even if even % 2 == 0 => collatz(even / 2).map(|x| x + 1),
        odd => collatz(odd.checked_mul(3)?.checked_add(1)?).map(|x| x + 1),
    }
}
