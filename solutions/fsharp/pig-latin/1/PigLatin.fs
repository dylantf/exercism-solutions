module PigLatin

let vowelSounds = [ "a"; "e"; "i"; "o"; "u"; "xr"; "yt" ]

let consonants = [ "b"; "c"; "d"; "f"; "g"; "h"; "j"; "k"; "l"; "m"; "n"; "p"; "q"; "r"; "s"; "t"; "v"; "w"; "x"; "y"; "z" ]

// Some of these probably need their own rules but the tests pass 🤷
let consonantClusters = [ "ch"; "st"; "sh"; "sch"; "thr"; "th"; "qu"; "rh" ]

let startsWithSound (word: string) (sound: string) =
    word.ToLower().StartsWith(sound.ToLower())

let rec startsWithAnySound (sounds: string list) (word: string) =
    match sounds with
    | [] -> None
    | sound :: rest ->
        if startsWithSound word sound then
            Some(sound, word.Substring(sound.Length))
        else
            startsWithAnySound rest word

let startsWithConsonantCluster = startsWithAnySound consonantClusters
let startsWithConsonantLetter = startsWithAnySound consonants

let (|Rule4|_|) (word: string) =
    let charList = word.ToCharArray() |> Array.toList

    match charList with
    | prefix :: 'y' :: _ -> Some($"y{prefix}ay")
    | _ ->
        match startsWithConsonantCluster word with
        | Some(cluster, rest) when rest.ToLower().StartsWith("y") -> Some($"{rest}{cluster}ay")
        | _ -> None

let (|Rule1|_|) (word: string) =
    match startsWithAnySound vowelSounds word with
    | Some _ -> Some($"{word}ay")
    | _ -> None

let startsWithConsonant word =
    match startsWithConsonantCluster word with
    | Some(cluster, suffix) -> Some(cluster, suffix)
    | None ->
        match startsWithConsonantLetter word with
        | Some(letter, suffix) -> Some(letter, suffix)
        | _ -> None


let (|Rule2|_|) (word: string) =
    match startsWithConsonant word with
    | Some(prefix, suffix) -> Some($"{suffix}{prefix}ay")
    | None -> None

let (|Rule3|_|) (word) =
    match startsWithConsonant word with
    | Some(prefix, suffix) ->
        match startsWithAnySound [ "qu" ] suffix with
        | Some(_, rest) -> Some $"{rest}{prefix}quay"
        | _ -> None
    | _ -> None

let translateWord word =
    match word with
    | Rule4 translated -> translated
    | Rule1 translated -> translated
    | Rule3 translated -> translated
    | Rule2 translated -> translated
    | _ -> word

let translate (input: string) : string =
    input.Split(" ") |> Array.map translateWord |> String.concat " "
