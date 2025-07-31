module LuciansLusciousLasagna exposing (elapsedTimeInMinutes, expectedMinutesInOven, preparationTimeInMinutes)


expectedMinutesInOven : number
expectedMinutesInOven =
    40


preparationTimeInMinutes : number -> number
preparationTimeInMinutes numLayers =
    numLayers * 2


elapsedTimeInMinutes : number -> number -> number
elapsedTimeInMinutes numLayers elapsedMinutes =
    preparationTimeInMinutes numLayers + elapsedMinutes
