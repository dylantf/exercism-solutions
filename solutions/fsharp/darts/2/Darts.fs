// Active Pattern version
module Darts

let distance x y = sqrt (x * x + y * y)

let (|Inner|Middle|Outer|Outside|) (d: float) =
    match d with
    | d when d <= 1 -> Inner
    | d when d <= 5 -> Middle
    | d when d <= 10 -> Outer
    | _ -> Outside

let score x y =
    match distance x y with
    | Inner -> 10
    | Middle -> 5
    | Outer -> 1
    | Outside -> 0
