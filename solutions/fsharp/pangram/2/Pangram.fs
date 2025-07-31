module Pangram

let isPangram (input: string) : bool =
    let len =
        input.ToLower()
        |> Seq.filter (fun c -> Seq.contains c [ 'a' .. 'z' ])
        |> Seq.distinct
        |> Seq.length

    len = 26
