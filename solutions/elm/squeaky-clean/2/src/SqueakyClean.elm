module SqueakyClean exposing (clean, clean1, clean2, clean3, clean4)


clean1 : String -> String
clean1 str =
    String.replace " " "_" str


clean2 : String -> String
clean2 str =
    let
        replaceCtrlChars toReplace =
            List.foldl (\c -> String.replace c "[CTRL]") toReplace [ "\u{000D}", "\n", "\t" ]
    in
    str |> clean1 |> replaceCtrlChars


capitalize : String -> String
capitalize word =
    case String.uncons word of
        Nothing ->
            ""

        Just ( x, xs ) ->
            String.cons (Char.toUpper x) xs


clean3 : String -> String
clean3 str =
    case String.split "-" (clean2 str) of
        [] ->
            ""

        x :: xs ->
            x ++ (xs |> List.map capitalize |> String.concat)


clean4 : String -> String
clean4 str =
    str
        |> clean3
        |> String.filter (Char.isDigit >> not)


isGreek : Char -> Bool
isGreek char =
    let
        charCode =
            Char.toCode char
    in
    charCode >= Char.toCode 'α' && charCode <= Char.toCode 'ω'


clean : String -> String
clean str =
    str
        |> clean4
        |> String.filter (isGreek >> not)
