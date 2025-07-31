module Darts

let score x y =
    let d n = pown (0. - n) 2
    let distance = sqrt (d x + d y)

    match distance with
    | d when d <= 1 -> 10
    | d when d <= 5 -> 5
    | d when d <= 10 -> 1
    | _ -> 0