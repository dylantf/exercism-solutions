defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """

  def compare(a, a), do: :equal

  def compare(a, b) do
    cond do
      length(b) > length(a) && sublist?(a, b) -> :sublist
      length(a) > length(b) && sublist?(b, a) -> :superlist
      true -> :unequal
    end
  end

  defp sublist?([], _), do: true

  defp sublist?(a, b) do
    b
    |> Stream.chunk_every(length(a), 1, :discard)
    |> Enum.any?(&(&1 === a))
  end
end
