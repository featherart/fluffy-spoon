defmodule DataStoreTest do
  use ExUnit.Case, async: true

  # setup do
  #   DataStore.start_link()
  # end
  
  test "inputs a fact" do
    DataStore.start_link()   
    assert DataStore.query("lucy") == nil

    DataStore.input("is_a_cat", "lucy")
    assert DataStore.query("is_a_cat") == "lucy"
  end

  test "handles a basic query" do
    DataStore.start_link()
    assert DataStore.query("is_a_cat") == nil

    DataStore.input("is_a_cat", "lucy")
    assert DataStore.query("is_a_cat") == "lucy"
    DataStore.input("is_a_bat", "francis")
    assert DataStore.query("is_a_cat") == "francis"
  end
end
