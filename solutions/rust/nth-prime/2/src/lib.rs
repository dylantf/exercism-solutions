pub fn nth(n: u32) -> u32 {
    let mut primes: Vec<u32> = vec![];
    let mut counter = 2;
    let mut nth_index = 0;

    while nth_index <= n {
        if !primes.iter().any(|x| counter % x == 0) {
            if nth_index == n {
                return counter;
            }

            primes.push(counter);
            nth_index += 1;
        }

        counter += 1;
    }

    panic!("Couldn't find prime");
}
