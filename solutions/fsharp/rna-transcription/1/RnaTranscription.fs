module RnaTranscription

let fromDna c =
    match c with
    | 'G' -> 'C'
    | 'C' -> 'G'
    | 'T' -> 'A'
    | 'A' -> 'U'
    | _ -> failwith "Invalid character"

// SURELY there is a less disgusting way to get it back into a string???
let toRna (dna: string) : string =
    dna.ToCharArray()
    |> Array.map fromDna
    |> fun result -> new System.String(result)
