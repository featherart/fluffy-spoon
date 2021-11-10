defmodule DataStore do
  @moduledoc """
  `DataStore` maintains application state
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
      new_state = [{String.to_atom(question), fact} | state]
      IO.inspect(new_state, label: "new state$$$$$$")
    end)
  end

  @doc """
  Returns the `fact(s)` associated with a `question`
  Returns a list of values or an empty list if the question has not been input.
  """
  @spec query(String.t()) :: List.t()
  def query(question) do
    Agent.get(__MODULE__, fn state ->
      Keyword.get_values(state, String.to_atom(question))
    end)
  end

  @doc """
  Resets application state
  """
  @spec reset(nil) :: nil
  def reset() do
    Agent.update(__MODULE__, fn _state -> %{} end)
  end
end
