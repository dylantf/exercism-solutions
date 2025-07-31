module SqueakyClean

open System

let transform (c: char) : string =
    match c with
    | '-' -> "_"
    | ' ' -> ""
    | c when Char.IsUpper c -> "-" + (c |> Char.ToLower |> string)
    | c when Char.IsNumber c -> ""
    | c when c >= 'A' && c <= 'Z' -> c |> Char.ToLower |> string
    | c when c >= 'α' && c <= 'ω' -> "?"
    | other -> string other

let clean (identifier: string) : string = String.collect transform identifier
