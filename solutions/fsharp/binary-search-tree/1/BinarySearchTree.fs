module BinarySearchTree

type Node =
    { Left: Node option
      Data: int
      Right: Node option }

let left node = node.Left

let right node = node.Right

let data node = node.Data

let create (values: int list) : Node =
    let rec insertValue value branch =
        match branch with
        | None ->
            { Data = value
              Left = None
              Right = None }
        | Some(b) when value <= b.Data ->
            { b with
                Left = Some(b |> left |> insertValue value) }
        | Some(b) ->
            { b with
                Right = Some(b |> right |> insertValue value) }

    values
    |> List.fold (fun node value -> Some(insertValue value node)) None
    |> Option.get

let sortedData (node: Node) : int list =
    let rec walkTree branch =
        match branch with
        | None -> []
        | Some(b) -> (b |> left |> walkTree) @ [ b.Data ] @ (b |> right |> walkTree)

    Some(node) |> walkTree
