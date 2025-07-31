pub fn is_leap_year(year: u64) -> bool {
    let is_even = year % 4 == 0;
    let is_div_by_100 = year % 100 == 0;
    let is_div_by_400 = year % 400 == 0;

    if is_even && (!is_div_by_100 || is_div_by_400) {
        true
    } else {
        false
    }
}
