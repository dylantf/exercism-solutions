module TwoFer

let twoFer (input: string option) : string =
    let name = defaultArg input "you"
    sprintf "One for %s, one for me." name
