defmodule DataStore do
  @moduledoc """
  `DataStore` maintains application state
  """

  def start_link() do
    Agent.start_link(fn -> [] end, name: __MODULE__)
  end

  @doc """
  Puts the `fact` for the given `question` in `state`.
  """
  def input(question, fact) do
    Agent.update(__MODULE__, fn(state) ->
      new_state = [{String.to_atom(question), fact} | state]
      IO.inspect(new_state, label: "new state$$$$$$")
    end)
  end

  @doc """
  Returns the fact associated with a question
  """
  def query(question) do
    Agent.get(__MODULE__, fn(state) ->
      Keyword.get_values(state, String.to_atom(question))
    end)
  end

  @doc """
  Resets application state
  """
  def reset() do
    Agent.update(__MODULE__, fn(_state) -> %{} end)
  end
end
