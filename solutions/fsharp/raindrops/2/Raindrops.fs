module Raindrops

type Sound = int * string

let sounds: Sound array = [| (3, "Pling"); (5, "Plang"); (7, "Plong") |]

let convert (n: int) =
    let sound =
        sounds
        |> Seq.filter (fun (f, _) -> n % f = 0)
        |> Seq.map (fun (_, s) -> s)
        |> String.concat ""

    if sound <> "" then sound else $"{n}"
