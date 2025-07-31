module Clock

let normalize minutes = (1440 + (minutes % 1440)) % 1440

let create hours minutes = 60 * hours + minutes |> normalize

let add minutes clock = clock + minutes |> normalize

let subtract minutes clock = clock - minutes |> normalize

let display clock =
    clock |> normalize |> (fun c -> (sprintf "%02i:%02i" (c / 60) (c % 60)))
