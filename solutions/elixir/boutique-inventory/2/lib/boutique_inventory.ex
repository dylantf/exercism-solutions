defmodule BoutiqueInventory do
  def sort_by_price(inventory) do
    Enum.sort_by(inventory, fn el -> el[:price] end)
  end

  def with_missing_price(inventory) do
    Enum.filter(inventory, fn item -> is_nil(item[:price]) end)
  end

  @spec update_names(map(), String.t(), String.t()) :: list(map())
  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      Map.update!(item, :name, &String.replace(&1, old_word, new_word))
    end)
  end

  @spec increase_quantity(map(), pos_integer()) :: map()
  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn sizes ->
      Enum.reduce(sizes, %{}, fn {size, cur}, acc -> Map.put(acc, size, cur + count) end)
    end)
  end

  @spec total_quantity(map()) :: integer()
  def total_quantity(item) do
    Enum.reduce(item[:quantity_by_size], 0, fn {_, count}, acc -> acc + count end)
  end
end
