import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

fn turn_left(robot: Robot) -> Robot {
  let next_direction = case robot.direction {
    North -> West
    West -> South
    South -> East
    East -> North
  }

  Robot(..robot, direction: next_direction)
}

fn turn_right(robot: Robot) -> Robot {
  let next_direction = case robot.direction {
    North -> East
    East -> South
    South -> West
    West -> North
  }

  Robot(..robot, direction: next_direction)
}

fn advance(robot: Robot) -> Robot {
  let next_position = case robot {
    Robot(North, Position(x, y)) -> Position(x, y + 1)
    Robot(South, Position(x, y)) -> Position(x, y - 1)
    Robot(East, Position(x, y)) -> Position(x + 1, y)
    Robot(West, Position(x, y)) -> Position(x - 1, y)
  }

  Robot(..robot, position: next_position)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  let robot = create(direction, position)

  instructions
  |> string.split("")
  |> list.fold(robot, fn(robot, command) {
    case command {
      "L" -> turn_left(robot)
      "R" -> turn_right(robot)
      "A" -> advance(robot)
      _ -> panic
    }
  })
}
