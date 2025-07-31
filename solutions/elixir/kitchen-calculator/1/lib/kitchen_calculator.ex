defmodule KitchenCalculator do
  def get_volume({_unit, amount}), do: amount

  defp conversion_factor(:cup), do: 240
  defp conversion_factor(:fluid_ounce), do: 30
  defp conversion_factor(:teaspoon), do: 5
  defp conversion_factor(:tablespoon), do: 15
  defp conversion_factor(:milliliter), do: 1

  def to_milliliter({unit, amount}), do: {:milliliter, amount * conversion_factor(unit)}

  def from_milliliter({_unit, amount}, to_unit),
    do: {to_unit, amount / conversion_factor(to_unit)}

  def convert({from_unit, _amt} = orig, to_unit) when from_unit == :milliliter,
    do: from_milliliter(orig, to_unit)

  def convert(orig, to_unit) when to_unit == :milliliter,
    do: to_milliliter(orig)

  def convert(orig, to_unit) do
    {_, ml_amt} = to_milliliter(orig)
    from_milliliter({:milliliter, ml_amt}, to_unit)
  end
end
