defmodule LucasNumbers do
  def generate(count) when count < 1 or not is_integer(count) do
    raise(ArgumentError, "count must be specified as an integer >= 1")
  end

  def generate(1), do: [2]
  def generate(2), do: [2, 1]

  def generate(count) do
    Stream.unfold({2, 1, 3}, fn
      {prev1, prev2, i} -> {{prev1, prev2, i}, {prev2, prev1 + prev2, i + 1}}
    end)
    |> Enum.take(count)
    |> Enum.map(fn {n, _, _} -> n end)
  end
end
