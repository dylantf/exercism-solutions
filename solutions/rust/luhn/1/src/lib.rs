/// Check a Luhn checksum.
pub fn is_valid(code: &str) -> bool {
    if contains_invalid_chars(code) {
        return false;
    }

    let digits: Vec<_> = code
        .chars()
        .into_iter()
        .filter(|c| c.is_digit(10))
        .map(|c| c.to_digit(10).unwrap())
        .collect();

    if digits.len() < 2 {
        return false;
    }

    let result = digits.iter().rev().enumerate().map(|(i, d)| {
        if i % 2 == 0 {
            return d.clone();
        }

        let mult = d * 2;
        if mult > 9 {
            mult - 9
        } else {
            mult
        }
    });

    let sum: u32 = result.sum();
    sum % 10 == 0
}

fn contains_invalid_chars(s: &str) -> bool {
    let filtered: String = s
        .chars()
        .into_iter()
        .filter(|c| c.is_digit(10) || c == &' ')
        .collect();

    s.len() != filtered.len()
}
