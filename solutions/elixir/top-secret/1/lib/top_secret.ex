# not my solution i cba to finish this one

defmodule TopSecret do
  def to_ast(string) do
    Code.string_to_quoted!(string)
  end

  defp get_function_name(args) do
    case args do
      [{:when, _, fn_args}, _] ->
        get_function_name(fn_args)

      [{_, _, nil}, _] ->
        ""

      [{_, _, []}, _] ->
        ""

      [{fn_name, _, fn_args}, _] ->
        to_string(fn_name) |> String.slice(0, length(fn_args))
    end
  end

  def decode_secret_message_part({op, _, args} = ast, acc) when op in [:def, :defp] do
    name = get_function_name(args)
    {ast, [name | acc]}
  end

  def decode_secret_message_part(ast, acc) do
    {ast, acc}
  end

  def decode_secret_message(string) do
    data = to_ast(string)
    {_, acc} = Macro.prewalk(data, [], &decode_secret_message_part/2)
    acc |> Enum.reverse() |> Enum.join("")
  end
end
