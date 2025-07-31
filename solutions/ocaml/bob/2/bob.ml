let response_for input =
  let open Base.String in
  let input = strip input in
  let question = is_suffix ~suffix:"?" input in
  let shouting = uppercase input = input && lowercase input <> input in
  let silence = is_empty input in

  if shouting && question then "Calm down, I know what I'm doing!"
  else if shouting then "Whoa, chill out!"
  else if question then "Sure."
  else if silence then "Fine. Be that way!"
  else "Whatever."
