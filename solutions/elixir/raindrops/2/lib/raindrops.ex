defmodule Raindrops do
  @type raindrop :: {factor :: pos_integer(), sound :: String.t()}

  @spec convert(pos_integer()) :: String.t()
  def convert(n) do
    sound(n, [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}])
  end

  @spec sound(pos_integer(), list(raindrop()), String.t()) :: String.t()
  defp sound(n, sounds, acc \\ "")

  defp sound(n, [{f, s} | r], acc) do
    if rem(n, f) == 0, do: sound(n, r, acc <> s), else: sound(n, r, acc)
  end

  defp sound(n, [], acc) do
    if acc != "", do: acc, else: "#{n}"
  end

  def run do
    1..100 |> Enum.each(fn n -> convert(n) |> IO.puts() end)
  end
end
