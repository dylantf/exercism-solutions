let leap_year y = 
    let divisible n = y mod n = 0 in
    let div_by_400 = divisible 400 in
    let div_by_100 = divisible 100 in
    let div_by_4 = divisible 4 in
    div_by_400 || (div_by_4 && not div_by_100)
