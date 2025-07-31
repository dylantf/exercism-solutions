import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(e) = problem
  e
}

pub fn remove_team_prefix(team: String) -> String {
  let assert Ok(#(_, name)) = string.split_once(team, "Team ")
  name
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert Ok(#(region, team_with_prefix)) = string.split_once(combined, ",")
  let team_name = remove_team_prefix(team_with_prefix)
  #(region, team_name)
}
