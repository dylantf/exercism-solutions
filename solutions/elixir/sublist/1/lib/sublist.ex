defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare([], []), do: :equal
  def compare([], [_ | _]), do: :sublist
  def compare([_ | _], []), do: :superlist

  def compare(a, b) do
    cond do
      length(a) > length(b) -> sublist?(b, a) |> or_unequal(:superlist)
      length(a) < length(b) -> sublist?(a, b) |> or_unequal(:sublist)
      true -> sublist?(a, b) |> or_unequal(:equal)
    end
  end

  defp sublist?(a, b, start_index \\ 0) do
    chunk = Enum.slice(b, start_index, length(a))

    cond do
      a === chunk -> true
      length(a) > length(chunk) -> false
      true -> sublist?(a, b, start_index + 1)
    end
  end

  defp or_unequal(val, true_value) do
    if val do
      true_value
    else
      :unequal
    end
  end
end
