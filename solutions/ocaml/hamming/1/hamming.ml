type nucleotide = A | C | G | T

let hamming_distance a b =
  match (a, b) with
  | [], _ :: _ -> Error "left strand must not be empty"
  | _ :: _, [] -> Error "right strand must not be empty"
  | a, b when List.length a <> List.length b ->
      Error "left and right strands must be of equal length"
  | [], [] -> Ok 0
  | a, b ->
      let distance =
        a |> List.combine b
        |> List.fold_left (fun acc (x, y) -> if x == y then acc else acc + 1) 0
      in
      Ok distance
