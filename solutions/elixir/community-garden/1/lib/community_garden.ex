# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    Agent.start(fn -> %{plots: [], next_id: 1} end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state.plots end)
  end

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn %{plots: plots, next_id: next_id} = state ->
      plot = %Plot{plot_id: next_id, registered_to: register_to}
      {plot, %{state | plots: [plot | plots], next_id: next_id + 1}}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn %{plots: plots} = state ->
      plots = Enum.reject(plots, fn p -> p.plot_id == plot_id end)
      {plots, %{state | plots: plots}}
    end)

    :ok
  end

  def get_registration(pid, plot_id) do
    Agent.get(pid, & &1.plots)
    |> Enum.find(fn p -> p.plot_id == plot_id end)
    |> case do
      %Plot{} = p -> p
      _ -> {:not_found, "plot is unregistered"}
    end
  end
end
