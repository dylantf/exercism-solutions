module TopScorers exposing (..)

import Dict exposing (Dict)
import TopScorersSupport exposing (PlayerName)


updateGoalCountForPlayer : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
updateGoalCountForPlayer playerName playerGoalCounts =
    let
        initOrIncrement value =
            case value of
                Just v ->
                    Just (v + 1)

                Nothing ->
                    Just 1
    in
    Dict.update playerName initOrIncrement playerGoalCounts


aggregateScorers : List PlayerName -> Dict PlayerName Int
aggregateScorers playerNames =
    List.foldl updateGoalCountForPlayer Dict.empty playerNames


removeInsignificantPlayers : Int -> Dict PlayerName Int -> Dict PlayerName Int
removeInsignificantPlayers goalThreshold playerGoalCounts =
    Dict.filter (\_ goals -> goals >= goalThreshold) playerGoalCounts


resetPlayerGoalCount : PlayerName -> Dict PlayerName Int -> Dict PlayerName Int
resetPlayerGoalCount playerName playerGoalCounts =
    Dict.insert playerName 0 playerGoalCounts


formatPlayerGoals : ( String, Int ) -> String
formatPlayerGoals ( name, goals ) =
    name ++ ": " ++ String.fromInt goals


formatPlayer : PlayerName -> Dict PlayerName Int -> String
formatPlayer playerName playerGoalCounts =
    playerGoalCounts
        |> Dict.get playerName
        |> Maybe.withDefault 0
        |> (\goals -> formatPlayerGoals ( playerName, goals ))


formatPlayers : Dict PlayerName Int -> String
formatPlayers players =
    players
        |> Dict.toList
        |> List.map formatPlayerGoals
        |> String.join ", "


combineGames : Dict PlayerName Int -> Dict PlayerName Int -> Dict PlayerName Int
combineGames game1 game2 =
    Dict.merge
        (\name game1Goals dict -> Dict.insert name game1Goals dict)
        (\name game1Goals game2Goals dict -> Dict.insert name (game1Goals + game2Goals) dict)
        (\name game2Goals dict -> Dict.insert name game2Goals dict)
        game1
        game2
        Dict.empty
