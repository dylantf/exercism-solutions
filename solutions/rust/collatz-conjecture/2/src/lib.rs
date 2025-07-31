pub fn collatz(n: u64) -> Option<u64> {
    if n == 0 {
        return None;
    }

    let mut count = 0;
    let mut n = n;

    while n > 1 {
        if n % 2 == 0 {
            n /= 2;
        } else {
            n = n.checked_mul(3)?.checked_add(1)?;
        }

        count += 1;
    }

    Some(count)
}
