module BeerSong

let line1 (start: int) =
    match start with
    | n when n > 1 -> $"{n} bottles of beer on the wall, {n} bottles of beer."
    | 1 -> "1 bottle of beer on the wall, 1 bottle of beer."
    | _ -> "No more bottles of beer on the wall, no more bottles of beer."

let line2 (start: int) =
    match start with
    | n when n > 2 -> $"Take one down and pass it around, {n - 1} bottles of beer on the wall."
    | 2 -> $"Take one down and pass it around, 1 bottle of beer on the wall."
    | 1 -> $"Take it down and pass it around, no more bottles of beer on the wall."
    | _ -> "Go to the store and buy some more, 99 bottles of beer on the wall."


let rec doRecite (start: int) (loops: int) (verses: string list) =
    if loops = 0 then
        verses
    else
        verses
        @ [ ""; line1 start; line2 (start) ]
        @ doRecite (start - 1) (loops - 1) (verses)


let recite (start: int) (takeDown: int) = doRecite start takeDown [] |> List.tail
