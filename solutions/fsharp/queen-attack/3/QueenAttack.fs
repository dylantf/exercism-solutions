module QueenAttack

let create (x, y) =
    let valid_cell n = n >= 0 && n <= 7
    valid_cell x && valid_cell y

let canAttack (x1, y1) (x2, y2) =
    (x1 = x2) || (y1 = y2) || abs (x1 - x2) = abs (y1 - y2)
