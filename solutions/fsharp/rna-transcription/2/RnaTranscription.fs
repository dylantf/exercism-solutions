module RnaTranscription

let toRna (dna: string) : string =
    let fromDna c =
        match c with
        | 'G' -> "C"
        | 'C' -> "G"
        | 'T' -> "A"
        | 'A' -> "U"
        | _ -> failwith "Invalid character"

    String.collect fromDna dna
