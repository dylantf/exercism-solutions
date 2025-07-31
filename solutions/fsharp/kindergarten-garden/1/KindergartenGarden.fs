module KindergartenGarden

type Plant =
    | Clover
    | Grass
    | Radishes
    | Violets

let plant (p: char) =
    match p with
    | 'C' -> Clover
    | 'G' -> Grass
    | 'R' -> Radishes
    | 'V' -> Violets
    | _ -> failwith "Not a valid plant!"

let reformat (diagram: string) =
    let (row0, row1) =
        match diagram.Split("\n") with
        | [| r0; r1 |] -> (r0, r1)
        | _ -> failwith "Incorrectly formatted diagram"

    // Reorder the two-line string to a single line
    let row0Chars = row0.ToCharArray()
    let row1Chars = row1.ToCharArray()

    let mutable i = 0
    let mutable reformatted: char list = []

    for i in 0..2 .. row0Chars.Length - 1 do
        reformatted <- List.append reformatted [ row0Chars[i]; row0Chars[i + 1]; row1Chars[i]; row1Chars[i + 1] ]

    reformatted

let findStudentIndex name =
    [| "Alice"
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
       "Larry" |]
    |> Array.tryFindIndex (fun s -> s = name)

let plants (diagram: string) (student: string) : Plant list =
    let mapped = reformat diagram |> List.map plant

    let studentIndex =
        match findStudentIndex student with
        | Some idx -> idx * 4
        | None -> failwith "Invalid student"

    mapped[studentIndex .. studentIndex + 3]
