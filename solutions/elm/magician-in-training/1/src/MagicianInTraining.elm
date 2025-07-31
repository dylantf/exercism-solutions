module MagicianInTraining exposing (..)

import Array exposing (..)


getCard : Int -> Array Int -> Maybe Int
getCard index deck =
    Array.get index deck


setCard : Int -> Int -> Array Int -> Array Int
setCard index newCard deck =
    Array.set index newCard deck


addCard : Int -> Array Int -> Array Int
addCard newCard deck =
    Array.push newCard deck


removeCard : Int -> Array Int -> Array Int
removeCard index deck =
    deck
        |> Array.toIndexedList
        |> List.filter (\( i, _ ) -> i /= index)
        |> List.map Tuple.second
        |> Array.fromList


evenCardCount : Array Int -> Int
evenCardCount deck =
    deck
        |> Array.toList
        |> List.filter (\i -> modBy 2 i == 0)
        |> List.length
