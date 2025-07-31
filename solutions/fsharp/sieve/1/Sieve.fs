module Sieve

[<TailCall>]
let rec sieve limit unmarked acc =
    match unmarked with
    | [] -> List.rev acc
    | x :: xs ->
        let marked = seq { x * x .. x .. limit }
        let nextUnmarked = List.except marked xs
        sieve limit nextUnmarked (x :: acc)

let primes limit = sieve limit [ 2..limit ] []
