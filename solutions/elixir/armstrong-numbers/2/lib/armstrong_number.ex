defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) do
    digits = String.graphemes("#{number}") |> Enum.map(&String.to_integer/1)
    num_digits = length(digits)
    sum = Enum.reduce(digits, 0, fn n, acc -> Integer.pow(n, num_digits) + acc end)

    number == sum
  end
end
