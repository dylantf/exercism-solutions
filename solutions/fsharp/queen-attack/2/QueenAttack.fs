// Attempt 1 to just to get it working, mutable loops 🙈
module QueenAttack

type Position = (int * int)

let create (position: Position) : bool =
    let valid_cell x = List.contains x [ 0..7 ]
    (position |> fst |> valid_cell) && (position |> snd |> valid_cell)

let diagonals ((x, y): Position) =
    let mutable acc: Position list = [ (x, y) ]
    let mutable a = x
    let mutable b = y

    while create (a - 1, b - 1) do
        a <- a - 1
        b <- b - 1
        acc <- acc @ [ (a, b) ]

    a <- x
    b <- y

    while create (a + 1, b + 1) do
        a <- a + 1
        b <- b + 1
        acc <- acc @ [ (a, b) ]

    a <- x
    b <- y

    while create (a + 1, b - 1) do
        a <- a + 1
        b <- b - 1
        acc <- acc @ [ (a, b) ]

    a <- x
    b <- y

    while create (a - 1, b + 1) do
        a <- a - 1
        b <- b + 1
        acc <- acc @ [ (a, b) ]

    acc

let canAttack (queen1: Position) (queen2: Position) =
    match (queen1, queen2) with
    | ((x1, y1), (x2, y2)) when x1 = x2 || y1 = y2 -> true
    | (p1, p2) when p1 |> diagonals |> List.contains p2 -> true
    | _ -> false
