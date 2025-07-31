module Isogram

let isIsogram (str: string) =
    let filterAZ (c: char) = List.contains c [ 'a' .. 'z' ]
    let origChars = str.ToLower() |> String.filter filterAZ
    let uniqueChars = origChars |> set |> seq
    String.length origChars = Seq.length uniqueChars
