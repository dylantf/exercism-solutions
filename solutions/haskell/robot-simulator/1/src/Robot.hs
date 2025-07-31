module Robot
  ( Bearing (East, North, South, West),
    bearing,
    coordinates,
    mkRobot,
    move,
  )
where

data Bearing
  = North
  | East
  | South
  | West
  deriving (Eq, Show)

type Coordinates = (Integer, Integer)

data Robot = Robot
  { rBearing :: Bearing,
    rCoords :: (Integer, Integer)
  }

bearing :: Robot -> Bearing
bearing = rBearing

coordinates :: Robot -> Coordinates
coordinates = rCoords

mkRobot :: Bearing -> Coordinates -> Robot
mkRobot d c = Robot {rBearing = d, rCoords = c}

turnRight :: Robot -> Robot
turnRight robot@(Robot b _) = case b of
  North -> robot {rBearing = East}
  East -> robot {rBearing = South}
  South -> robot {rBearing = West}
  West -> robot {rBearing = North}

turnLeft :: Robot -> Robot
turnLeft robot@(Robot b _) = case b of
  North -> robot {rBearing = West}
  East -> robot {rBearing = North}
  South -> robot {rBearing = East}
  West -> robot {rBearing = South}

advance :: Robot -> Robot
advance (Robot b (x, y)) = case b of
  North -> Robot b (x, y + 1)
  East -> Robot b (x + 1, y)
  South -> Robot b (x, y - 1)
  West -> Robot b (x - 1, y)

processCommand :: Robot -> Char -> Robot
processCommand robot command = case command of
  'A' -> advance robot
  'L' -> turnLeft robot
  'R' -> turnRight robot
  _ -> error "Invalid command"

move :: Robot -> String -> Robot
move = foldl processCommand
