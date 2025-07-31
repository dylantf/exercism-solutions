module TisburyTreasureHunt

let getCoordinate (line: string * string) : string = snd line

let convertCoordinate (coordinate: string) : int * char =
    match Seq.toList coordinate with
    | [ a; b ] -> (System.Int32.Parse(a.ToString()), char b)
    | _ -> failwith "parse error"

let compareRecords (azarasData: string * string) (ruisData: string * (int * char) * string) : bool =
    let a = azarasData |> getCoordinate |> convertCoordinate
    let (_, r, _) = ruisData
    a = r

let createRecord
    (azarasData: string * string)
    (ruisData: string * (int * char) * string)
    : (string * string * string * string) =
    if compareRecords azarasData ruisData then
        let (item, coordinate) = azarasData
        let (location, _, color) = ruisData
        (coordinate, location, color, item)
    else
        ("", "", "", "")
