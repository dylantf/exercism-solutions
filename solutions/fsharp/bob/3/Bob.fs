module Bob

open System

let (|Question|_|) input =
    match input |> Seq.tryLast with
    | Some '?' -> Some Question
    | _ -> None

let (|Yelling|_|) input =
    let upperChars = input |> String.filter (Char.IsUpper)
    let lowerChars = input |> String.filter (Char.IsLower)

    if lowerChars.Length = 0 && upperChars.Length > 0 then
        Some Yelling
    else
        None

let response (input: string) =
    match input.Trim() with
    | Question & Yelling -> "Calm down, I know what I'm doing!"
    | Question -> "Sure."
    | Yelling -> "Whoa, chill out!"
    | "" -> "Fine. Be that way!"
    | _ -> "Whatever."
