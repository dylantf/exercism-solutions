defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class(), do: Enum.random(@planetary_classes)

  def random_ship_registry_number() do
    num = Enum.random(1000..9999)
    "NCC-#{num}"
  end

  def random_stardate() do
    :rand.uniform() * 1000.0 + 41000.0
  end

  def format_stardate(stardate) do
    if !is_float(stardate), do: raise(ArgumentError)
    to_string(round(stardate * 10) / 10)
  end
end
