module ArmstrongNumbers

let isArmstrongNumber (number: int) : bool =
    let digits = string number
    let length = String.length digits

    digits
    |> Seq.map (string >> int)
    |> Seq.sumBy (fun n -> pown n length)
    |> (=) number
