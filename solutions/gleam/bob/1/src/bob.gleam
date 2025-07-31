import gleam/string

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)

  let is_question = string.ends_with(remark, "?")
  let is_yelling =
    string.uppercase(remark) == remark && string.lowercase(remark) != remark

  let is_silence = remark == ""

  case is_question, is_yelling, is_silence {
    True, False, False -> "Sure."
    True, True, False -> "Calm down, I know what I'm doing!"
    False, True, False -> "Whoa, chill out!"
    False, False, True -> "Fine. Be that way!"
    _, _, _ -> "Whatever."
  }
}
