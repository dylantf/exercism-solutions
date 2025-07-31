module AnnalynsInfiltration exposing (canFastAttack, canFreePrisoner, canSignalPrisoner, canSpy, stealthAttackDamage)


canFastAttack : Bool -> Bool
canFastAttack knightIsAwake =
    not knightIsAwake


canSpy : Bool -> Bool -> Bool -> Bool
canSpy knightIsAwake archerIsAwake prisonerIsAwake =
    knightIsAwake || archerIsAwake || prisonerIsAwake


canSignalPrisoner : Bool -> Bool -> Bool
canSignalPrisoner archerIsAwake prisonerIsAwake =
    prisonerIsAwake && not archerIsAwake


canFreePrisoner : Bool -> Bool -> Bool -> Bool -> Bool
canFreePrisoner knightIsAwake archerIsAwake prisonerIsAwake petDogIsPresent =
    if not knightIsAwake && not archerIsAwake && prisonerIsAwake then
        True

    else if not archerIsAwake && petDogIsPresent then
        True

    else
        False


stealthAttackDamage : Bool -> Int
stealthAttackDamage annalynIsDetected =
    if annalynIsDetected then
        7

    else
        12
