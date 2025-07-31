defmodule BasketballWebsite do
  @doc """
  Given a map and a dot-separated path-string, retrieve the value
  """
  @spec extract_from_path(data :: map(), path :: String.t()) :: any()
  def extract_from_path(data, path) do
    extract_from(data, String.split(path, "."))
  end

  @spec extract_from(data :: map(), path :: list(String.t())) :: any()
  defp extract_from(_data, []), do: nil
  defp extract_from(data, [el]), do: data[el]

  defp extract_from(data, [h | t]) do
    extract_from(data[h], t)
  end

  @doc """
  Given a map and a dot-separated path-string, retrieve the value
  """
  @spec get_in_path(data :: map(), path :: String.t()) :: any()
  def get_in_path(data, path) do
    get_in(data, String.split(path, "."))
  end
end
