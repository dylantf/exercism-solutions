module Luhn

open System

let valid (input: string) =
    let toDigits s =
        s |> Seq.map (string >> int) |> Seq.toList |> List.rev

    let double x =
        let doubled = x * 2
        if doubled <= 9 then doubled else doubled - 9

    let rec checksum acc digits =
        match digits with
        | [] -> acc
        | [ x ] -> acc + x
        | x :: y :: xs -> checksum (acc + x + double y) xs

    let validateChecksum digits =
        let sum = checksum 0 digits
        sum % 10 = 0

    let input = input.Replace(" ", "")
    let numbers = input |> String.filter Char.IsDigit
    let isValidChars = input |> Seq.forall Char.IsDigit
    let isValidLength = numbers.Length > 1

    match isValidChars && isValidLength with
    | false -> false
    | true -> numbers |> toDigits |> validateChecksum
