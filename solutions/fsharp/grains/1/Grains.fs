module Grains

let square (n: int) : Result<uint64, string> =
    match n with
    | n when n < 1 || n > 64 -> Error "square must be between 1 and 64"
    | n -> Ok(pown 2UL (n - 1))

let total: Result<uint64, string> =
    [ 0..64 ]
    |> Seq.sumBy (fun n -> square n |> Result.defaultValue 0UL)
    |> fun result -> Ok result // I don't know why this needs to be wrapped
