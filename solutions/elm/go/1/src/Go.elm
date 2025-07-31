module Go exposing (..)

import GoSupport exposing (..)


applyRules : Game -> Rule -> NonValidatingRule -> Rule -> Rule -> Game
applyRules game oneStonePerPointRule captureRule libertyRule koRule =
    case
        game
            |> captureRule
            |> koRule
            |> Result.andThen libertyRule
            |> Result.andThen oneStonePerPointRule
    of
        Ok nextTurn ->
            changePlayer nextTurn

        Err err ->
            { game | error = err }
