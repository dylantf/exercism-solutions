defmodule RnaTranscription do
  @spec to_rna([char]) :: [char]
  def to_rna(dna) do
    Enum.map(dna, &from_dna/1)
  end

  @spec from_dna(char) :: char
  defp from_dna(?G), do: ?C
  defp from_dna(?C), do: ?G
  defp from_dna(?T), do: ?A
  defp from_dna(?A), do: ?U
end
