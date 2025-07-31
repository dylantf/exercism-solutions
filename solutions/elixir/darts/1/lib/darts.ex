defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}) do
    x = abs(x)
    y = abs(y)

    cond do
      x < 1 and y < 1 -> 10
      x < 4 and y < 4 -> 5
      x < 9 and y < 9 -> 1
      true -> 0
    end
  end
end
