defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) when not is_integer(input), do: raise(FunctionClauseError)
  def calc(input) when input < 1, do: raise(FunctionClauseError)
  def calc(1), do: 0
  def calc(input), do: calc(0, input)

  def calc(iterations, input) do
    result =
      if rem(input, 2) == 0 do
        trunc(input / 2)
      else
        input * 3 + 1
      end

    if result == 1 do
      iterations + 1
    else
      calc(iterations + 1, result)
    end
  end
end
