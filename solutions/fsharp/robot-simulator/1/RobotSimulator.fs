module RobotSimulator

type Direction =
    | North
    | East
    | South
    | West

type Position = int * int

type Robot =
    { Direction: Direction
      Position: Position }

let turnRight robot =
    { robot with
        Direction =
            match robot.Direction with
            | North -> East
            | East -> South
            | South -> West
            | West -> North }

let turnLeft robot =
    { robot with
        Direction =
            match robot.Direction with
            | North -> West
            | East -> North
            | South -> East
            | West -> South }

let advance robot =
    let (x, y) = robot.Position

    let nextPosition =
        match robot.Direction with
        | North -> (x, y + 1)
        | East -> (x + 1, y)
        | South -> (x, y - 1)
        | West -> (x - 1, y)

    { robot with Position = nextPosition }

let interpret robot command =
    robot
    |> match command with
       | 'A' -> advance
       | 'R' -> turnRight
       | 'L' -> turnLeft
       | _ -> failwith "Invalid command"

let create direction position =
    { Direction = direction
      Position = position }

let move (instructions: string) (robot: Robot) : Robot =
    instructions.ToCharArray() |> Array.fold interpret robot
