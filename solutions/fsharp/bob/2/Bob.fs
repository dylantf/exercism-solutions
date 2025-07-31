module Bob

open System

let isQuestion (input: string) =
    match input |> Seq.tryLast with
    | Some '?' -> true
    | _ -> false

let isYelling (input: string) =
    let upperChars = input |> String.filter (Char.IsUpper)
    let lowerChars = input |> String.filter (Char.IsLower)

    lowerChars.Length = 0 && upperChars.Length > 0

let response (input: string) =
    match input.Trim() with
    | x when isQuestion x && isYelling x -> "Calm down, I know what I'm doing!"
    | x when isQuestion x -> "Sure."
    | x when isYelling x -> "Whoa, chill out!"
    | "" -> "Fine. Be that way!"
    | _ -> "Whatever."
