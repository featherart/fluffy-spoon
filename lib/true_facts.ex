defmodule TrueFacts do
  @moduledoc """
  `TrueFacts` has 2 functions: 
  the ability to input facts and the ability to query them.
  Commands can either be expressed as INPUT or QUERY
  """

  @doc """
  This function parses input from a file and writes this to internal state. 

  Error handling:
  It returns `:ok` if everything went well, `:error` if not.
    
  ## Examples

      iex> TrueFacts.parse_input("is_a_cat (lucy)")
      :ok

  """

  def parse_input(str) do
    :ok
  end
end
