pub fn square(s: u32) -> u64 {
    if !(1u32..=64).contains(&s) {
        panic!("Square must be between 1 and 64")
    }

    1u64 << (s - 1)
}

pub fn total() -> u64 {
    (1u32..=64).map(square).sum()
}
