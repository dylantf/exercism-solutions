import gleam/string

pub fn message(log_line: String) -> String {
  let assert Ok(#(_lvl, msg)) = string.split_once(log_line, on: ": ")
  string.trim(msg)
}

pub fn log_level(log_line: String) -> String {
  let assert Ok(#(lvl, _)) = string.split_once(log_line, on: ": ")
  lvl
  |> string.replace(each: "[", with: "")
  |> string.replace(each: "]", with: "")
  |> string.lowercase()
}

pub fn reformat(log_line: String) -> String {
  let lvl = log_level(log_line)
  let msg = message(log_line)

  msg <> " (" <> lvl <> ")"
}
