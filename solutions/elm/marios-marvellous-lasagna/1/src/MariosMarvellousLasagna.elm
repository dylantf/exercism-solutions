module MariosMarvellousLasagna exposing (remainingTimeInMinutes)


remainingTimeInMinutes : number -> number -> number
remainingTimeInMinutes layers minutesElapsed =
    let
        expectedMinutesInOven =
            40

        preparationTimeInMinutes =
            2 * layers
    in
    expectedMinutesInOven + preparationTimeInMinutes - minutesElapsed
