module HighScores

let scores (values: int list) : int list = values

let latest (values: int list) : int =
    values |> List.tryLast |> Option.defaultValue 0

let personalBest (values: int list) : int =
    match values with
    | [] -> 0
    | xs -> List.max xs

let personalTopThree (values: int list) : int list =
    values |> List.sortDescending |> List.truncate 3
