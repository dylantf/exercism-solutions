defmodule CollatzConjecture do
  defp succ(x), do: x + 1

  defp maybe_map({:ok, x}, f), do: {:ok, f.(x)}
  defp maybe_map(other, _f), do: other

  defp collatz(1), do: {:ok, 0}

  defp collatz(n) when rem(n, 2) == 0 do
    collatz(div(n, 2)) |> maybe_map(&succ/1)
  end

  defp collatz(n) do
    collatz(n * 3 + 1) |> maybe_map(&succ/1)
  end

  def calc(n) when is_integer(n) and n > 0 do
    {:ok, result} = collatz(n)
    result
  end
end
