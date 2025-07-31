defmodule BirdCount do
  def today([]), do: nil
  def today(list), do: List.first(list)

  def increment_day_count([]), do: [1]

  def increment_day_count([first | rest]) do
    [first + 1 | rest]
  end

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
