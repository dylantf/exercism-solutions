use std::cmp::Ordering;

pub fn num_bottles(n: &u32, capitalize: bool) -> String {
    match n.cmp(&1) {
        Ordering::Greater => format!("{n} bottles"),
        Ordering::Equal => String::from("1 bottle"),
        Ordering::Less => match capitalize {
            true => String::from("No more bottles"),
            false => String::from("no more bottles"),
        },
    }
}

pub fn l2_obj(n: &u32) -> String {
    if n > &1 {
        String::from("one")
    } else {
        String::from("it")
    }
}

pub fn verse(n: u32) -> String {
    let ln1 = format!(
        "{} of beer on the wall, {} of beer.",
        num_bottles(&n, true),
        num_bottles(&n, false)
    );

    let ln2 = if n > 0 {
        format!(
            "Take {} down and pass it around, {} of beer on the wall.",
            l2_obj(&n),
            num_bottles(&(&n - &1), false)
        )
    } else {
        // This assignment always puts it at 99 instead of the actual start count
        String::from("Go to the store and buy some more, 99 bottles of beer on the wall.")
    };

    format!("{ln1}\n{ln2}\n")
}

pub fn sing(start: u32, end: u32) -> String {
    (end..=start)
        .rev()
        .map(verse)
        .collect::<Vec<_>>()
        .join("\n")
}
