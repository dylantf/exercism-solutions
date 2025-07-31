module InterestIsInteresting

let interestRate (balance: decimal) : single =
    match balance with
    | b when b < 0m -> 3.213f
    | b when b < 1000m -> 0.5f
    | b when b < 5000m -> 1.621f
    | _ -> 2.475f

let interest (balance: decimal) : decimal =
    let rate = balance |> interestRate |> decimal |> (*) 0.01m
    balance * rate

let annualBalanceUpdate (balance: decimal) : decimal = balance + interest balance

let amountToDonate (balance: decimal) (taxFreePercentage: float) : int =
    let percentage = (decimal taxFreePercentage) / 100m

    if balance > 0m then
        (balance * percentage * 2m) |> int
    else
        0
