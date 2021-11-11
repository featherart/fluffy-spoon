defmodule DataStore do
  @moduledoc """
  `DataStore` maintains application state.
  The store must be started up first.

  ## Examples

      iex> DataStore.start_link()
      {:ok, #PID<0.141.0>}
  """

  @doc """
  Starts up the data store.
  """
  def start_link() do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  @doc """
  Puts the `fact` for the given `question` in state.
  """
  @spec input(String.t(), String.t()) :: nil
  def input(question, fact) do
    Agent.update(__MODULE__, fn state ->
      [{String.to_atom(question), fact} | state]
    end)
  end

  @doc """
  Returns the `fact(s)` associated with a `question`
  Returns a list of values or an empty list. 
  """
  @spec query(String.t()) :: List.t()
  def query(question) do
    Agent.get(__MODULE__, fn state ->
      Keyword.get_values(state, String.to_atom(question)) |> Enum.uniq()
    end)
  end

  @doc """
  Resets application state
  """
  @spec reset() :: nil
  def reset() do
    Agent.update(__MODULE__, fn _state -> %{} end)
  end
end
