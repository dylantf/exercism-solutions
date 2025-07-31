let sounds = [ (3, "Pling"); (5, "Plang"); (7, "Plong") ]

let raindrop n =
  let rec get_sound acc sounds =
    match (acc, sounds) with
    | "", [] -> string_of_int n
    | str, [] -> str
    | str, (f, s) :: xs ->
        let next = if n mod f = 0 then str ^ s else str in
        get_sound next xs
  in
  get_sound "" sounds
