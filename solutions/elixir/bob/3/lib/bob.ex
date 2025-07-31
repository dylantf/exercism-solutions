defmodule Bob do
  defp yelling?(input) do
    String.upcase(input) == input && String.downcase(input) !== input
  end

  defp question?(input) do
    String.ends_with?(input, "?")
  end

  defp silence?(input) do
    String.replace(input, ~r/[\r\t\n]/, "") == ""
  end

  def hey(input) do
    input = String.trim(input)

    cond do
      silence?(input) -> "Fine. Be that way!"
      yelling?(input) && question?(input) -> "Calm down, I know what I'm doing!"
      yelling?(input) -> "Whoa, chill out!"
      question?(input) -> "Sure."
      true -> "Whatever."
    end
  end
end
