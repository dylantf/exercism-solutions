defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}
  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(tuple, n) do
    Tuple.to_list(tuple) |> Enum.with_index() |> search_list(n)
  end

  @spec search_list([{integer, integer}], integer) :: {:ok, integer} | :not_found
  def search_list([], _), do: :not_found
  def search_list([{a, _}], n) when a == n, do: {:ok, 0}
  def search_list([{a, _}], n) when a != n, do: :not_found

  def search_list(list, n) do
    if {:ok, mid_idx} = middle_index(list) do
      {val, val_index} = Enum.at(list, mid_idx)
      {left, right} = Enum.split(list, mid_idx)

      cond do
        n == val -> {:ok, val_index}
        n < val -> search_list(left, n)
        true -> search_list(right, n)
      end
    else
      :not_found
    end
  end

  @spec middle_index([tuple]) :: {:ok, integer} | :not_found
  def middle_index([]), do: :not_found

  def middle_index(numbers) do
    Enum.count(numbers) |> div(2) |> (&{:ok, &1}).()
  end
end
