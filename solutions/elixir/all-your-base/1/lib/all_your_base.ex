defmodule AllYourBase do
  @spec convert(list, integer, integer) :: {:ok, list} | {:error, String.t()}
  def convert(_digits, _input_base, output_base) when output_base < 2 do
    {:error, "output base must be >= 2"}
  end

  def convert(_digits, input_base, _output_base) when input_base < 2 do
    {:error, "input base must be >= 2"}
  end

  def convert(digits, input_base, output_base) do
    if Enum.any?(digits, fn digit -> digit < 0 or digit >= input_base end) do
      {:error, "all digits must be >= 0 and < input base"}
    else
      {:ok,
       digits
       |> Integer.undigits(input_base)
       |> Integer.digits(output_base)}
    end
  end
end
