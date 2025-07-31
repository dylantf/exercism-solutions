// WIP

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

let createUser name =
    { Name = name
      Owes = Map.empty
      OwedBy = Map.empty
      Balance = 0.0m }

type GetUserPayload =
    { [<JsonPropertyName("users")>]
      Users: string list }

type AddUserPayload =
    { [<JsonPropertyName("user")>]
      User: string }

let sortUsers users = Seq.sortBy _.Name users

let getUsersByName (names: string list) (db: Database) =
    db.Users |> Seq.filter (fun u -> Seq.contains u.Name names) |> sortUsers

type RestApi(database: string) =
    let db = JsonSerializer.Deserialize<Database> database

    member _.Get(url: string) =
        match url with
        | "/users" ->
            let response = db.Users |> sortUsers |> Seq.map _.Name
            JsonSerializer.Serialize {| users = response |}
        | _ -> failwith "404"


    member _.Get(url: string, payload: string) =
        match url with
        | "/users" ->
            let parsedPayload = JsonSerializer.Deserialize<GetUserPayload> payload
            let response = getUsersByName parsedPayload.Users db
            JsonSerializer.Serialize {| users = response |}
        | _ -> failwith "404"

    member _.Post(url: string, payload: string) =
        match url with
        | "/add" ->
            let parsedPayload = JsonSerializer.Deserialize<AddUserPayload> payload
            createUser parsedPayload.User |> JsonSerializer.Serialize
        | "/iou" -> failwith "not implemented"
        | _ -> failwith "404"
