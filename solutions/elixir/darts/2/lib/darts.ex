defmodule Darts do
  alias Enum

  @type position :: {number, number}

  @spec score(position) :: integer
  def score(position) do
    d = distance(position)

    cond do
      d <= 1 -> 10
      d <= 5 -> 5
      d <= 10 -> 1
      true -> 0
    end
  end

  defp distance({x, y}) do
    :math.sqrt(:math.pow(0 - x, 2) + :math.pow(0 - y, 2))
  end
end
