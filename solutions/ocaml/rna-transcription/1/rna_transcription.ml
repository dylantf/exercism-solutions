type dna = [ `A | `C | `G | `T ]
type rna = [ `U | `G | `C | `A ]

let to_rna =
  List.map (fun d -> match d with `A -> `U | `C -> `G | `G -> `C | `T -> `A)
