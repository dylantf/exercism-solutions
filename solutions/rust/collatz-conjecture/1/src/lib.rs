pub fn collatz(n: u64) -> Option<u64> {
    if n == 0 {
        return None;
    }

    Some(steps(n))
}

fn steps(n: u64) -> u64 {
    let mut count: u64 = 0;
    let mut cur: u64 = n;

    while cur > 1 {
        if cur % 2 == 0 {
            cur /= 2;
        } else {
            cur = cur * 3 + 1;
        }

        count += 1;
    }

    count
}
