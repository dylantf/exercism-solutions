module Pangram

let isPangram (input: string) : bool =
    let letters = "abcdefghijklmnopqrstuvwxyz"

    let len =
        input.ToLower()
        |> Seq.filter (fun c -> Seq.contains c letters)
        |> Seq.distinct
        |> Seq.length

    len = 26
