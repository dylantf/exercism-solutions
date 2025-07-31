module Grains

let squareExn n = pown 2UL (n - 1)

let square n =
    if n >= 1 && n <= 64 then
        squareExn n |> Ok
    else
        Error "square must be between 1 and 64"

let total: Result<uint64, string> = Seq.sumBy squareExn [ 0..64 ] |> Ok
