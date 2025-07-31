module CollatzConjecture

let steps (number: int): int option =
    let rec step (n: int) (acc: int) =
        match n, n % 2 = 0 with
        | 1, _ -> acc
        | _, true -> step (n / 2) (acc + 1)
        | _, false -> step (n * 3 + 1) (acc + 1)
    
    match number with
    | n when n <= 0 -> None
    | n -> step n 0 |> Some
