// First attempt, not optimized!

pub fn is_prime(n: u32) -> bool {
    if n < 2 {
        return false;
    }

    for i in 2..n {
        if n % i == 0 {
            return false;
        }
    }

    return true;
}

pub fn nth(n: u32) -> u32 {
    let mut i: u32 = 0;
    let mut nth_prime_idx: u32 = 0;

    while nth_prime_idx <= n {
        if is_prime(i) {
            if nth_prime_idx == n {
                return i;
            }

            nth_prime_idx += 1;
        }

        i += 1
    }

    panic!("Couldn't find the nth prime at: {n}");
}
