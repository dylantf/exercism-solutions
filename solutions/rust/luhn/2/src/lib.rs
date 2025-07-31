/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    let all_chars_valid = code.chars().all(|c| c.is_ascii_digit() || c == ' ');
    let digits = code.chars().filter(|&c| c != ' ').collect::<Vec<_>>();

    if digits.len() < 2 || !all_chars_valid {
        return false;
    }

    let sum = digits.iter().rev().enumerate().fold(0, |acc, (i, c)| {
        let d = c.to_digit(10).unwrap();

        if i % 2 == 0 {
            return acc + d;
        }

        let mut multiplied = d * 2;
        if multiplied > 9 {
            multiplied = multiplied - 9;
        }

        acc + multiplied
    });

    sum % 10 == 0
}
