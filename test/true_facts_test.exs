defmodule TrueFactsTest do
  use ExUnit.Case
  doctest TrueFacts

  setup do
    pid = DataStore.start_link()
    %{pid: pid}
  end

  test "parse_input/1 returns :ok if file exists" do
    assert TrueFacts.parse_input("input.txt") == :ok
  end
end
