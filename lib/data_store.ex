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
      IO.inspect(state, label: "state")
      new_state = List.push(state, %{question => fact})
      IO.inspect(new_state, label: "new state$$$$$$")
    end)
  end

  # How to handle are_friends (x, y)

  @doc """
  Returns the fact associated with a question
  """
  def query(question) do
    Agent.get(__MODULE__, fn(state) ->
      #Map.get(state, question)
      List.find(state, question)
    end)
  end

  @doc """
  Resets application state
  """
  def reset() do
    Agent.update(__MODULE__, fn(_state) -> %{} end)
  end
end
