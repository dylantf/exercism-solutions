defmodule Allergies do
  @points %{
    "eggs" => 1,
    "peanuts" => 2,
    "shellfish" => 4,
    "strawberries" => 8,
    "tomatoes" => 16,
    "chocolate" => 32,
    "pollen" => 64,
    "cats" => 128
  }

  def list(flags) do
    @points
    |> Map.keys()
    |> Enum.filter(&allergic_to?(flags, &1))
  end

  def allergic_to?(flags, item) do
    Bitwise.band(flags, @points[item]) != 0
  end
end
