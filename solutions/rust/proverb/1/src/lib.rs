pub fn build_proverb(list: &[&str]) -> String {
    if list.len() == 0 {
        return String::from("");
    }

    let mut result: Vec<String> = vec![];
    
    list.windows(2).into_iter().for_each(|x| {
        let line = format!("For want of a {} the {} was lost.", x[0], x[1]);
        result.push(line);
    });

    result.push(format!("And all for the want of a {}.", list[0]));
    result.join("\n")
}
