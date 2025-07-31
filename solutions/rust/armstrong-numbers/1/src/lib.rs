pub fn is_armstrong_number(num: u32) -> bool {
    let digits = num
        .to_string()
        .chars()
        .filter(|c| c.is_ascii_digit())
        .map(|c| c.to_digit(10).unwrap())
        .collect::<Vec<_>>();

    let num_digits = digits.len() as u32;

    let sum = digits
        .iter()
        .fold(0u64, |acc, n| acc + (*n as u64).pow(num_digits));

    sum == num.into()
}
