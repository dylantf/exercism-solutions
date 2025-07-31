defmodule DNA do
  def encode_nucleotide(code_point) do
    case code_point do
      ?\s -> 0b0000
      ?A -> 0b0001
      ?C -> 0b0010
      ?G -> 0b0100
      ?T -> 0b1000
    end
  end

  def decode_nucleotide(encoded_code) do
    case encoded_code do
      0b0000 -> ?\s
      0b0001 -> ?A
      0b0010 -> ?C
      0b0100 -> ?G
      0b1000 -> ?T
    end
  end

  def encode(dna), do: do_encode(dna)

  defp do_encode(dna, acc \\ <<>>)
  defp do_encode([h], acc), do: <<acc::bitstring, encode_nucleotide(h)::4>>

  defp do_encode([h | t], acc) do
    <<acc::bitstring, encode_nucleotide(h)::4, do_encode(t, acc)::bitstring>>
  end

  def decode(dna), do: do_decode(dna)

  defp do_decode(dna, acc \\ '')
  defp do_decode(<<h::4>>, acc), do: [decode_nucleotide(h) | acc]

  defp do_decode(<<h::4, t::bitstring>>, acc) do
    [decode_nucleotide(h) | do_decode(t, acc)]
  end
end
