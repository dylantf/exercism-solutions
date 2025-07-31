const SOUNDS: [(u32, &'static str); 3] = [(3, "Pling"), (5, "Plang"), (7, "Plong")];

pub fn raindrops(n: u32) -> String {
    SOUNDS
        .iter()
        .filter(|(f, _)| n % f == 0)
        .fold(None, |acc, (_, sound)| {
            Some(acc.unwrap_or("".to_owned()) + sound.to_owned())
        })
        .unwrap_or(n.to_string())
}
