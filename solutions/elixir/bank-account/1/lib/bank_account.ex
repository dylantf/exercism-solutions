defmodule BankAccount do
  @opaque account :: pid

  use GenServer

  @spec open() :: account
  def open() do
    {:ok, pid} = GenServer.start_link(__MODULE__, 0)
    pid
  end

  @spec close(account) :: any
  def close(account) do
    GenServer.call(account, :close_account)
  end

  @spec balance(account) :: integer
  def balance(account) do
    GenServer.call(account, :get_balance)
  end

  @spec deposit(account, integer) :: :ok | {:error, :account_closed | :amount_must_be_positive}
  def deposit(_account, amount) when amount < 0, do: {:error, :amount_must_be_positive}

  def deposit(account, amount) do
    GenServer.call(account, {:deposit, amount})
  end

  @spec withdraw(account, integer) ::
          :ok | {:error, :account_closed | :amount_must_be_positive | :not_enough_balance}
  def withdraw(_account, amount) when amount < 0, do: {:error, :amount_must_be_positive}

  def withdraw(account, amount) do
    GenServer.call(account, {:withdraw, amount})
  end

  @impl GenServer
  def init(init_arg) do
    {:ok, init_arg}
  end

  @impl GenServer
  def handle_call(:close_account, _, _state) do
    {:reply, :ok, :closed}
  end

  @impl GenServer
  def handle_call(:get_balance, _, state) do
    if state == :closed do
      {:reply, {:error, :account_closed}, state}
    else
      {:reply, state, state}
    end
  end

  @impl GenServer
  def handle_call({:deposit, amount}, _, state) do
    if state == :closed do
      {:reply, {:error, :account_closed}, state}
    else
      {:reply, :ok, state + amount}
    end
  end

  @impl GenServer
  def handle_call({:withdraw, amount}, _, state) do
    case state do
      :closed -> {:reply, {:error, :account_closed}, state}
      bal when bal < amount -> {:reply, {:error, :not_enough_balance}, state}
      bal -> {:reply, :ok, bal - amount}
    end
  end
end
