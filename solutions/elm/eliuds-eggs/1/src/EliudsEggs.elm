module EliudsEggs exposing (eggCount)


eggCount : Int -> Int
eggCount n =
    case n of
        0 ->
            0

        1 ->
            1

        other ->
            modBy 2 other + eggCount (n // 2)
