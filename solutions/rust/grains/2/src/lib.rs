pub fn square(s: u32) -> u64 {
    1u64.checked_shl(s - 1)
        .expect("Square must be between 1 and 64")
    // if !(1u32..=64).contains(&s) {
    //     panic!("Square must be between 1 and 64")
    // }

    // 2u64.pow(s - 1)
}

pub fn total() -> u64 {
    (1u32..=64).fold(0, |acc, cur| acc + square(cur))
}
