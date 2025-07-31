defmodule NameBadge do
  def print(id, name, department) do
    id = if !is_nil(id), do: "[#{id}]"
    department = if !is_nil(department), do: String.upcase(department), else: "OWNER"

    [id, name, department]
    |> Enum.reject(&is_nil/1)
    |> Enum.join(" - ")
  end
end
