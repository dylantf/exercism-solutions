module CarsAssemble

let successRate (speed: int) : float =
    match speed with
    | s when s >= 1 && s <= 4 -> 1.0
    | s when s >= 5 && s <= 8 -> 0.9
    | 9 -> 0.8
    | 10 -> 0.77
    | _ -> 0.0

let productionRatePerHour (speed: int) : float =
    float speed * 221.0 |> (*) (successRate speed)

let workingItemsPerMinute (speed: int) : int =
    float speed * 221.0 / 60.0 |> (*) (successRate speed) |> int
