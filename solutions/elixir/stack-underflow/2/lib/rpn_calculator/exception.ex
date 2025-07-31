defmodule RPNCalculator.Exception do
  defmodule DivisionByZeroError do
    defexception message: "division by zero occurred"
  end

  defmodule StackUnderflowError do
    @message "stack underflow occurred"
    defexception message: @message

    @impl true
    def exception(context) do
      case context do
        [] -> %StackUnderflowError{}
        _ -> %StackUnderflowError{message: "#{@message}, context: #{context}"}
      end
    end
  end

  def divide([0, _]), do: raise(DivisionByZeroError)
  def divide([a, b]), do: div(b, a)
  def divide(_), do: raise(StackUnderflowError, "when dividing")
end
