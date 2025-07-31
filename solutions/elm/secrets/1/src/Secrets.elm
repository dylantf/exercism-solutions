module Secrets exposing (clearBits, decrypt, flipBits, setBits, shiftBack)

import Bitwise


shiftBack : Int -> Int -> Int
shiftBack amount value =
    Bitwise.shiftRightZfBy amount value


setBits : Int -> Int -> Int
setBits mask value =
    Bitwise.or mask value


flipBits : Int -> Int -> Int
flipBits mask value =
    Bitwise.xor mask value


clearBits : Int -> Int -> Int
clearBits mask value =
    Bitwise.and value (Bitwise.complement mask)


decrypt : Int -> Int
decrypt secret =
    setBits 1996 secret
        |> flipBits 2009
        |> shiftBack 5
        |> clearBits 17
