defmodule Raindrops do
  def convert(n) do
    sound(n, [{3, "Pling"}, {5, "Plang"}, {7, "Plong"}])
  end

  defp sound(n, sounds, acc \\ "")

  defp sound(n, [{f, s} | r], acc) do
    if rem(n, f) == 0, do: sound(n, r, acc <> s), else: sound(n, r, acc)
  end

  defp sound(n, [], acc) do
    if acc != "", do: acc, else: "#{n}"
  end
end
