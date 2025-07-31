module Bob

let (|Question|_|) (input: string) =
    if input.EndsWith('?') then Some() else None

let (|Yelling|_|) (input: string) =
    if input <> input.ToLower() && input = input.ToUpper() then
        Some()
    else
        None

let response (input: string) =
    match input.Trim() with
    | Question & Yelling -> "Calm down, I know what I'm doing!"
    | Question -> "Sure."
    | Yelling -> "Whoa, chill out!"
    | "" -> "Fine. Be that way!"
    | _ -> "Whatever."
