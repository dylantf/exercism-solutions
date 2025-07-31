module Luhn

open System

let valid (number: string) =
    let double (i, n) =
        match i + 1, n with
        | i, n when i % 2 = 0 && n * 2 > 9 -> n * 2 - 9
        | i, n when i % 2 = 0 -> n * 2
        | _, n -> n

    let chars = number.Replace(" ", "")
    let digits = chars |> String.filter Char.IsDigit

    if chars.Length < 2 || chars.Length <> digits.Length then
        false
    else
        let total =
            digits |> Seq.map (string >> int) |> Seq.rev |> Seq.indexed |> Seq.sumBy double

        total % 10 = 0
