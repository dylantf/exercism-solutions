module HighScores

let scores (values: int list) : int list = values

let latest (values: int list) : int = values |> List.rev |> List.head

let personalBest (values: int list) : int = List.max values

let personalTopThree (values: int list) : int list =
    values
    |> List.sort
    |> List.rev
    |> fun sorted ->
        match sorted with
        | res when List.length res <= 3 -> List.take (List.length res) res
        | res -> List.take 3 res
