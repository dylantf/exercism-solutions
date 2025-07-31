// I guess fizzbuzz was copyrighted?
pub fn raindrops(n: u32) -> String {
    let mut sound: Vec<&str> = Vec::new();

    if n % 3 == 0 {
        sound.push("Pling");
    }
    if n % 5 == 0 {
        sound.push("Plang");
    }
    if n % 7 == 0 {
        sound.push("Plong")
    }

    if sound.len() == 0 {
        n.to_string()
    } else {
        sound.join("")
    }
}
