module Raindrops

let convert (n: int) =
    let r =
        [| (3, "Pling"); (5, "Plang"); (7, "Plong") |]
        |> Seq.choose (fun (f, s) -> if n % f = 0 then Some s else None)

    if Seq.isEmpty r then n.ToString() else Seq.reduce (+) r
