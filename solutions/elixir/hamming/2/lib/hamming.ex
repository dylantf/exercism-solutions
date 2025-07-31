defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance(~c"AAGTCATA", ~c"TAGCGATC")
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: {:ok, non_neg_integer} | {:error, String.t()}
  def hamming_distance([], []), do: {:ok, 0}

  def hamming_distance(strand1, strand2) when length(strand1) != length(strand2) do
    {:error, "strands must be of equal length"}
  end

  def hamming_distance(strand1, strand2) do
    {:ok, calc_distance(strand1, strand2)}
  end

  @spec calc_distance([char], [char], non_neg_integer) :: non_neg_integer
  defp calc_distance(strand1, strand2, acc \\ 0) do
    case {strand1, strand2} do
      {[], []} ->
        acc

      {[c1 | rest1], [c2 | rest2]} ->
        next_distance = if c1 == c2, do: acc, else: acc + 1
        calc_distance(rest1, rest2, next_distance)
    end
  end
end
