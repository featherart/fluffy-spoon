defmodule TrueFactsTest do
  use ExUnit.Case
  doctest TrueFacts

  test "parse_input/2 returns :ok tuple" do
    assert TrueFacts.parse_input("is_a_cat", "lucy") == {:ok, true}
  end
end
