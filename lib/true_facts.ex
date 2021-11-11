defmodule TrueFacts do
  @moduledoc """
  `TrueFacts` has 2 functions: 
  the ability to input facts and the ability to query them.
  Commands can either be expressed as INPUT or QUERY
  """

  @doc """
  The function `parse_input` parses input from a file.
  Requires the DataStore to be started up first.

  For each line that starts with INPUT a new entry gets made into a keyword list.
  If the line starts with QUERY a line gets written to `output.txt`.
    
      iex> TrueFacts.parse_input("input.txt")
      :ok

  """

  @spec parse_input(String.t()) :: :ok | :error
  def parse_input(file) do
    case File.read(file) do
      {:ok, body} ->
        String.split(String.trim(body), "\n")
        |> Enum.each(fn line ->
          [_command, question, fact] = String.split(line)

          cond do
            String.match?(line, ~r/INPUT/) ->
              DataStore.input(question, String.replace(fact, ~r/[()]/, ""))

            String.match?(line, ~r/QUERY/) ->
              write_to_file(question, fact)
          end
        end)

        :ok

      {:error, _reason} ->
        IO.puts("something went wrong")
        :error
    end
  end

  @doc """
  Writes to the `output.txt` file.
  """
  @spec write_to_file(String.t(), String.t()) :: nil
  def write_to_file(question, fact) do
    res = DataStore.query(question)

    if Enum.member?(res, String.replace(fact, ~r/[()]/, "")) do
      File.write("output.txt", "---\ntrue")
    else
      File.write("output.txt", "---\nfalse")
    end
  end
end
