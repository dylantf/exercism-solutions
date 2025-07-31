module RestApi

open System.Text.Json
open System.Text.Json.Serialization

type User =
    { [<JsonPropertyName("name")>]
      Name: string
      [<JsonPropertyName("owes")>]
      Owes: Map<string, decimal>
      [<JsonPropertyName("owed_by")>]
      OwedBy: Map<string, decimal>

      [<JsonPropertyName("balance")>]
      Balance: decimal }

type Database =
    { [<JsonPropertyName("users")>]
      Users: User list }

module User =
    let create name =
        { Name = name
          Owes = Map.empty
          OwedBy = Map.empty
          Balance = 0.0m }

    let name user = user.Name

    let lend borrower amount lenderNewLoan borrowerNewLoan lender =
        { lender with
            Owes = lender.Owes |> Map.change borrower (fun _ -> lenderNewLoan)
            OwedBy = lender.OwedBy |> Map.change borrower (fun _ -> borrowerNewLoan)
            Balance = lender.Balance + amount }

    let borrow lender amount borrowerNewLoan lenderNewLoan borrower =
        { borrower with
            Owes = borrower.Owes |> Map.change lender (fun _ -> borrowerNewLoan)
            OwedBy = borrower.OwedBy |> Map.change lender (fun _ -> lenderNewLoan)
            Balance = borrower.Balance - amount }

module Operations =
    let getUser users name =
        users |> List.find (User.name >> (=) name)

    let settle lender borrower amount =
        let loan =
            (lender.Owes |> Map.tryFind borrower.Name |> Option.defaultValue 0.0m) - amount

        let owes = if loan > 0.0m then Some loan else None
        let owedBy = if loan < 0.0m then abs loan |> Some else None
        owes, owedBy

    let borrow lender borrower amount =
        let owes, owedBy = settle lender borrower amount
        let lender' = lender |> User.lend (User.name borrower) amount owes owedBy
        let borrower' = borrower |> User.borrow (User.name lender) amount owedBy owes
        lender', borrower'

type RestApi(database: string) =
    let db = JsonSerializer.Deserialize<Database> database

    member _.Get(url: string) =
        match url with
        | "/users" ->
            let responseUsers = db.Users |> Seq.map User.name |> Seq.sort
            JsonSerializer.Serialize {| users = responseUsers |}
        | _ -> failwith "404"

    member _.Get(url: string, payload: string) =
        match url with
        | "/users" ->
            let payload' = JsonSerializer.Deserialize<{| users: string list |}> payload

            let responseUsers =
                payload'.users
                |> List.map (Operations.getUser db.Users)
                |> List.sortBy User.name

            JsonSerializer.Serialize { Users = responseUsers }
        | _ -> failwith "404"

    member _.Post(url: string, payload: string) =
        match url with
        | "/add" ->
            let payload' = JsonSerializer.Deserialize<{| user: string |}> payload
            User.create payload'.user |> JsonSerializer.Serialize
        | "/iou" ->
            let payload' =
                JsonSerializer.Deserialize<
                    {| lender: string
                       borrower: string
                       amount: decimal |}
                 >
                    payload

            let responseUsers =
                let lender = payload'.lender |> Operations.getUser db.Users
                let borrower = payload'.borrower |> Operations.getUser db.Users
                let lender', borrower' = Operations.borrow lender borrower payload'.amount
                [ lender'; borrower' ] |> List.sortBy User.name

            JsonSerializer.Serialize { Users = responseUsers }
        | _ -> failwith "404"
