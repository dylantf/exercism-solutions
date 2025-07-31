defmodule LucasNumbers do
  def generate(count) when is_integer(count) and count >= 1 do
    Stream.unfold({2, 1}, fn {x, y} -> {x, {y, x + y}} end)
    |> Enum.take(count)
  end

  def generate(_) do
    raise(ArgumentError, "count must be specified as an integer >= 1")
  end
end
