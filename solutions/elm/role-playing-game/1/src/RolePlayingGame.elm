module RolePlayingGame exposing (Player, castSpell, introduce, revive)


type alias Player =
    { name : Maybe String
    , level : Int
    , health : Int
    , mana : Maybe Int
    }


introduce : Player -> String
introduce { name } =
    case name of
        Just n ->
            n

        Nothing ->
            "Mighty Magician"


revive : Player -> Maybe Player
revive ({ health, level } as player) =
    case health of
        0 ->
            if level >= 10 then
                Just { player | health = 100, mana = Just 100 }

            else
                Just { player | health = 100 }

        _ ->
            Nothing


castSpell : Int -> Player -> ( Player, Int )
castSpell manaCost player =
    case player.mana of
        Just m ->
            if manaCost > m then
                ( player, 0 )

            else
                ( { player | mana = Just (m - manaCost) }, manaCost * 2 )

        Nothing ->
            ( subtractHealth player manaCost, 0 )


subtractHealth : Player -> Int -> Player
subtractHealth player cost =
    let
        nextHealth =
            player.health - cost
    in
    if nextHealth < 0 then
        { player | health = 0 }

    else
        { player | health = nextHealth }
