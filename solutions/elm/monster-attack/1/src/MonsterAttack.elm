module MonsterAttack exposing (..)


type alias MonsterDamage =
    String


attackWith : String -> Int -> String
attackWith weapon strength =
    "Attacked with " ++ weapon ++ " of strength " ++ String.fromInt strength ++ "."


attackWithSword1 : MonsterDamage -> Int -> MonsterDamage
attackWithSword1 monsterDamage strength =
    monsterDamage ++ attackWith "sword" strength


attackWithClaw1 : MonsterDamage -> Int -> MonsterDamage
attackWithClaw1 monsterDamage strength =
    monsterDamage ++ attackWith "claw" strength


annalynAttack : MonsterDamage -> MonsterDamage
annalynAttack monsterDamage =
    attackWithSword1 monsterDamage 5


kazakAttack : MonsterDamage -> MonsterDamage
kazakAttack monsterDamage =
    attackWithClaw1 monsterDamage 1


attack1 : MonsterDamage -> MonsterDamage
attack1 monsterDamage =
    annalynAttack (kazakAttack (kazakAttack (annalynAttack monsterDamage)))


attackWithSword2 : Int -> MonsterDamage -> MonsterDamage
attackWithSword2 strength monsterDamage =
    attackWithSword1 monsterDamage strength


attackWithClaw2 : Int -> MonsterDamage -> MonsterDamage
attackWithClaw2 strength monsterDamage =
    attackWithClaw1 monsterDamage strength


attack2 : MonsterDamage -> MonsterDamage
attack2 monsterDamage =
    monsterDamage
        |> annalynAttack
        |> kazakAttack
        |> kazakAttack
        |> annalynAttack


attack3 : MonsterDamage -> MonsterDamage
attack3 =
    annalynAttack
        >> kazakAttack
        >> kazakAttack
        >> annalynAttack
