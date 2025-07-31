module NucleotideCount

let allValid =
    List.forall (fun letter -> List.contains letter [ 'C'; 'G'; 'A'; 'T' ])

[<TailCall>]
let rec count strand counts =
    match strand with
    | [] -> counts
    | nucleotide :: rest ->
        counts
        |> Map.change nucleotide (fun curCount ->
            match curCount with
            | Some(c) -> Some(c + 1)
            | None -> None)
        |> count rest

let nucleotideCounts (strand: string) =
    let nucleotides = strand.ToCharArray() |> Array.toList

    if allValid nucleotides then
        let init = Map [ ('C', 0); ('G', 0); ('A', 0); ('T', 0) ]
        Some(count nucleotides init)
    else
        None
