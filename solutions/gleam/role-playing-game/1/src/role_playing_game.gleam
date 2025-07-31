import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  option.unwrap(player.name, "Mighty Magician")
}

pub fn revive(player: Player) -> Option(Player) {
  case player {
    Player(health: h, ..) if h > 0 -> None
    Player(level: level, ..) if level >= 10 ->
      Some(Player(..player, mana: Some(100), health: 100))
    Player(..) -> Some(Player(..player, mana: None, health: 100))
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(m) if m < cost -> #(player, 0)
    Some(m) if m == cost -> #(Player(..player, mana: None), cost * 2)
    Some(m) -> #(Player(..player, mana: Some(m - cost)), cost * 2)
    None ->
      case player.health <= cost {
        True -> #(Player(..player, health: 0), 0)
        False -> #(Player(..player, health: player.health - cost), 0)
      }
  }
}
