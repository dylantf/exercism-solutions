{-# LANGUAGE RecordWildCards #-}

module Robot
  ( Bearing (East, North, South, West),
    bearing,
    coordinates,
    mkRobot,
    move,
  )
where

data Bearing = North | East | South | West
  deriving (Eq, Show, Enum, Bounded)

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

next :: (Eq a, Bounded a, Enum a) => a -> a
next x = if x == maxBound then minBound else succ x

prev :: (Eq a, Bounded a, Enum a) => a -> a
prev x = if x == minBound then maxBound else pred x

turnRight :: Robot -> Robot
turnRight robot@(Robot {..}) = robot {rBearing = next rBearing}

turnLeft :: Robot -> Robot
turnLeft robot@(Robot {..}) = robot {rBearing = prev rBearing}

advance :: Robot -> Robot
advance robot@(Robot b (x, y)) =
  robot {rCoords = nextCoords}
  where
    nextCoords = case b of
      North -> (x, y + 1)
      East -> (x + 1, y)
      South -> (x, y - 1)
      West -> (x - 1, y)

processCommand :: Robot -> Char -> Robot
processCommand robot command = case command of
  'A' -> advance robot
  'L' -> turnLeft robot
  'R' -> turnRight robot
  _ -> error "Invalid command"

move :: Robot -> String -> Robot
move = foldl processCommand
