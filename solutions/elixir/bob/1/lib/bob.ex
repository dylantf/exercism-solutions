defmodule Bob do
  defp is_yelling(input) do
    String.upcase(input) == input && String.downcase(input) !== input
  end

  defp is_question(input) do
    input
    |> String.trim()
    |> String.ends_with?("?")
  end

  defp is_silence(input) do
    String.replace(input, ~r/[\r\t\n]/, "") == ""
  end

  def hey(input) do
    input = String.trim(input)

    cond do
      is_silence(input) -> "Fine. Be that way!"
      is_yelling(input) && is_question(input) -> "Calm down, I know what I'm doing!"
      is_yelling(input) -> "Whoa, chill out!"
      is_question(input) -> "Sure."
      true -> "Whatever."
    end
  end
end
