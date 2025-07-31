defmodule CollatzConjecture do
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(n) when is_integer(n) and n > 0, do: do_calc(n, 0)

  def do_calc(1, acc), do: acc

  def do_calc(n, acc) when rem(n, 2) == 0 do
    do_calc(div(n, 2), acc + 1)
  end

  def do_calc(n, acc) do
    do_calc(n * 3 + 1, acc + 1)
  end
end
