use std::collections::HashSet;

pub fn anagrams_for<'a>(word: &str, possible_anagrams: &'a [&str]) -> HashSet<&'a str> {
    let lowered_word = word.to_lowercase();
    let mut word_chars = lowered_word.chars().collect::<Vec<_>>();
    word_chars.sort_unstable();

    possible_anagrams
        .iter()
        .filter(|p| {
            let lowered_possible = p.to_lowercase();
            let mut possible_chars = lowered_possible.chars().collect::<Vec<_>>();
            possible_chars.sort_unstable();
            possible_chars == word_chars && lowered_word != lowered_possible
        })
        .map(|&p| p)
        .collect()
}
