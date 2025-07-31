type dna = [ `A | `C | `G | `T ]
type rna = [ `U | `G | `C | `A ]

let to_rna = 
    let dna_to_rna = function 
    | `A -> `U 
    | `C -> `G 
    | `G -> `C 
    | `T -> `A
    in List.map dna_to_rna
