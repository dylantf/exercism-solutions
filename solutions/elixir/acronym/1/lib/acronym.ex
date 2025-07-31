defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/[\s\-]/)
    |> Enum.map(&map_first_letter/1)
    |> Enum.join()
    |> String.upcase()
  end

  defp map_first_letter(word) do
    word
    |> String.graphemes()
    |> Enum.filter(&Regex.match?(~r/[a-zA-Z]/, &1))
    |> Enum.take(1)
  end
end
