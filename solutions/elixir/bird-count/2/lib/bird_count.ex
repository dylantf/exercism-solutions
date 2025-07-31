defmodule BirdCount do
  def today([]), do: nil
  def today([h | _]), do: h

  def increment_day_count([]), do: [1]

  def increment_day_count([h | t]), do: [h + 1 | t]

  def has_day_without_birds?(list) do
    Enum.member?(list, 0)
  end

  def total(list) do
    Enum.sum(list)
  end

  def busy_days(list) do
    Enum.filter(list, fn item -> item >= 5 end) |> length()
  end
end
