module ValentinesDay

type Approval =
    | Yes
    | No
    | Maybe

type Cuisine =
    | Korean
    | Turkish

type Genre =
    | Crime
    | Horror
    | Romance
    | Thriller

type Activity =
    | BoardGame
    | Chill
    | Movie of Genre
    | Restaurant of Cuisine
    | Walk of int32

let rateActivity (activity: Activity) : Approval =
    match activity with
    | BoardGame -> No
    | Chill -> No
    | Movie m ->
        match m with
        | Romance -> Yes
        | _ -> No
    | Restaurant r ->
        match r with
        | Korean -> Yes
        | Turkish -> Maybe
    | Walk distance ->
        match distance with
        | d when d < 3 -> Yes
        | d when d < 5 -> Maybe
        | _ -> No
