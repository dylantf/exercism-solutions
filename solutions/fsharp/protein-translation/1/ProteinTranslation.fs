module ProteinTranslation

let encode codon =
    match codon with
    | "AUG" -> Some("Methionine")
    | "UUU" | "UUC" -> Some("Phenylalanine")
    | "UUA" | "UUG" -> Some("Leucine")
    | "UCU" | "UCC" | "UCA" | "UCG" -> Some("Serine")
    | "UAU" | "UAC" -> Some("Tyrosine")
    | "UGU" | "UGC" -> Some("Cysteine")
    | "UGG" -> Some("Tryptophan")
    | "UAA" | "UAG" | "UGA" -> Some("STOP")
    | _ -> None

let rec encodeCodons acc codons =
    match codons with
    | [] -> acc
    | x :: xs ->
        match encode x with
        | Some("STOP") -> acc
        | Some(protein) -> encodeCodons (protein :: acc) xs
        | None -> acc

let proteins (rna: string) =
    rna
    |> Seq.chunkBySize 3
    |> Seq.map (System.String.Concat)
    |> Seq.toList
    |> encodeCodons []
    |> List.rev
