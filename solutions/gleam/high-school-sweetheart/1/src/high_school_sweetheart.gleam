import gleam/list
import gleam/string

pub fn first_letter(name: String) {
  name
  |> string.trim
  |> string.slice(0, 1)
}

pub fn initial(name: String) {
  name
  |> first_letter
  |> string.uppercase
  |> string.append(".")
}

pub fn initials(full_name: String) {
  full_name
  |> string.trim
  |> string.split(" ")
  |> list.map(initial)
  |> string.join(" ")
}

pub fn pair(full_name1: String, full_name2: String) {
  let i1 = initials(full_name1)
  let i2 = initials(full_name2)

  // Please add string interpolation to gleam 🙈
  "
     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     " <> i1 <> "  +  " <> i2 <> "     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"
}
