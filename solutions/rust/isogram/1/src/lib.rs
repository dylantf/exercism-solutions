use std::collections::HashSet;

pub fn check(candidate: &str) -> bool {
    let only_alpha = candidate
        .to_lowercase()
        .chars()
        .filter(|c| c.is_alphabetic())
        .collect::<Vec<_>>();

    let uniques = only_alpha.clone().into_iter().collect::<HashSet<_>>();

    only_alpha.len() == uniques.len()
}
