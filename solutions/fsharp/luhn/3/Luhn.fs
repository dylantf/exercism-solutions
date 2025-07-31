module Luhn

open System

let validateInput (input: string) =
    let input = input.Replace(" ", "")
    let isValidChars = input |> Seq.forall Char.IsDigit
    let isValidLength = input.Length > 1

    if isValidChars && isValidLength then
        Ok input
    else
        Error "invalid input"

let toDigits (input: string) =
    input |> Seq.map (string >> int) |> Seq.rev |> Seq.toList |> Ok

let double n =
    let doubled = n * 2
    if doubled <= 9 then doubled else doubled - 9

let validateLuhnSum digits =
    let rec luhnSum (acc: int) (digits: int list) =
        match digits with
        | [] -> acc
        | [ x ] -> acc + x
        | x :: y :: xs -> luhnSum (acc + x + double y) xs

    match luhnSum 0 digits with
    | sum when sum % 10 = 0 -> Ok true
    | _ -> Error "invalid"

let valid (input: string) =
    validateInput input
    |> Result.bind toDigits
    |> Result.bind validateLuhnSum
    |> Result.defaultValue false
