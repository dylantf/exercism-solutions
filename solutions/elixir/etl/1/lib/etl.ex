defmodule ETL do
  @doc """
  Transforms an old Scrabble score system to a new one.

  ## Examples

    iex> ETL.transform(%{1 => ["A", "E"], 2 => ["D", "G"]})
    %{"a" => 1, "d" => 2, "e" => 1, "g" => 2}
  """
  @spec transform(map) :: map
  def transform(input) do
    scores = Map.keys(input)

    Enum.reduce(scores, %{}, fn score, acc ->
      letters_with_score = Map.get(input, score, [])

      Enum.reduce(letters_with_score, acc, fn letter, acc1 ->
        Map.put(acc1, String.downcase(letter), score)
      end)
    end)
  end
end
