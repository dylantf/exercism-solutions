pub fn primes_up_to(limit: u64) -> Vec<u64> {
    let mut primes = vec![true; limit as usize + 1];
    primes[0] = false;
    primes[1] = false;

    for i in 2..=((limit as f64).sqrt() as usize) {
        if primes[i] {
            for multiple in (i * i..=limit as usize).step_by(i) {
                primes[multiple] = false;
            }
        }
    }

    primes
        .iter()
        .enumerate()
        .filter(|&(_, &prime)| prime)
        .map(|(i, _)| i as u64)
        .collect()
}
