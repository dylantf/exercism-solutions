import gleam/list

pub type Tree {
  Nil
  Node(data: Int, left: Tree, right: Tree)
}

fn insert(tree: Tree, value: Int) -> Tree {
  case tree {
    Nil -> Node(value, left: Nil, right: Nil)
    Node(data, left, right) if value <= data ->
      Node(data:, left: insert(left, value), right:)
    Node(data, left, right) -> Node(data:, left:, right: insert(right, value))
  }
}

pub fn to_tree(data: List(Int)) -> Tree {
  data
  |> list.fold(Nil, insert)
}

fn walk_tree(tree: Tree) -> List(Int) {
  case tree {
    Nil -> []
    Node(data, left, right) ->
      walk_tree(left)
      |> list.append([data])
      |> list.append(walk_tree(right))
  }
}

pub fn sorted_data(data: List(Int)) -> List(Int) {
  data
  |> to_tree
  |> walk_tree
}
