module Raindrops

type Sound = int * string

let sounds: Sound array = [| (3, "Pling"); (5, "Plang"); (7, "Plong") |]

let convert (n: int) =
    sounds
    |> Seq.fold
        (fun acc (f, s) ->
            match n % f with
            | 0 ->
                match acc with
                | Some(a) -> Some(a + s)
                | None -> Some(s)
            | _ -> acc)
        None
    |> fun res ->
        match res with
        | Some(s) -> s
        | None -> $"{n}"
