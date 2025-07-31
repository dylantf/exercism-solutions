defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %{data: data, left: nil, right: nil}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(tree, data) do
    case tree do
      nil -> new(data)
      %{data: value, left: left} when data <= value -> %{tree | left: insert(left, data)}
      %{right: right} -> %{tree | right: insert(right, data)}
    end
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    case tree do
      nil ->
        []

      %{data: data, left: left, right: right} ->
        in_order(left)
        |> Kernel.++([data])
        |> Kernel.++(in_order(right))
    end
  end
end
