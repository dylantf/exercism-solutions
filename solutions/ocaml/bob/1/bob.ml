let response_for input =
  let input = String.trim input in
  let question = String.ends_with ~suffix:"?" input in
  let shouting =
    String.uppercase_ascii input = input
    && String.lowercase_ascii input <> input
  in
  let silence = input = "" in

  match (shouting, question, silence) with
  | true, true, _ -> "Calm down, I know what I'm doing!"
  | true, _, _ -> "Whoa, chill out!"
  | _, true, _ -> "Sure."
  | _, _, true -> "Fine. Be that way!"
  | _, _, _ -> "Whatever."
