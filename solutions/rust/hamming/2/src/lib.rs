pub fn hamming_distance(s1: &str, s2: &str) -> Option<usize> {
    if s1.len() != s2.len() {
        return None;
    }

    if s1 == s2 {
        return Some(0);
    }

    let len = s1
        .chars()
        .zip(s2.chars())
        .into_iter()
        .filter(|(a, b)| a != b)
        .collect::<Vec<_>>()
        .len();

    Some(len)
}
