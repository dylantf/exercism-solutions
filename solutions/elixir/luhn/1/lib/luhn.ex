defmodule Luhn do
  @doc """
  Checks if the given number is valid via the luhn formula
  """
  @spec valid?(String.t()) :: boolean
  def valid?(input) do
    input = String.replace(input, " ", "")

    with true <- String.match?(input, ~r/^\d+$/),
         true <- String.length(input) > 1,
         sum <- to_digits(input) |> luhn_sum(0),
         true <- valid_sum?(sum) do
      true
    else
      _ -> false
    end
  end

  defp to_digits(input) do
    input
    |> String.reverse()
    |> String.graphemes()
    |> Enum.map(&String.to_integer/1)
  end

  @spec luhn_sum(list(integer()), integer()) :: integer()
  defp luhn_sum([], acc), do: acc
  defp luhn_sum([x], acc), do: acc + x
  defp luhn_sum([x, y | xs], acc), do: luhn_sum(xs, acc + x + double(y))

  defp double(digit), do: normalize(digit * 2)

  defp normalize(d) when d > 9, do: d - 9
  defp normalize(d), do: d

  defp valid_sum?(sum), do: rem(sum, 10) == 0
end
