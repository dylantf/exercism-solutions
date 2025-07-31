pub fn nth(n: u32) -> u32 {
    let mut primes: Vec<u32> = vec![];

    (2..)
        .filter(|x: &u32| {
            if !primes.iter().any(|y| x % y == 0) {
                primes.push(*x);
                true
            } else {
                false
            }
        })
        .nth(n as usize)
        .unwrap()
}
