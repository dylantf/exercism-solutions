module KindergartenGarden

type Plant =
    | Clover
    | Grass
    | Radishes
    | Violets

let mapPlant (p: char) =
    match p with
    | 'C' -> Clover
    | 'G' -> Grass
    | 'R' -> Radishes
    | 'V' -> Violets
    | _ -> failwith "Not a valid plant!"

let children =
    [ "Alice"
      "Bob"
      "Charlie"
      "David"
      "Eve"
      "Fred"
      "Ginny"
      "Harriet"
      "Ileana"
      "Joseph"
      "Kincaid"
      "Larry" ]

let plants (diagram: string) (student: string) : Plant list =
    let studentIdx = children |> List.findIndex (fun s -> s = student)

    diagram.Split("\n")
    |> Seq.collect (Seq.skip (studentIdx * 2) >> Seq.take 2)
    |> Seq.map mapPlant
    |> List.ofSeq
