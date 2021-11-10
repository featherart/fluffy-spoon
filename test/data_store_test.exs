defmodule DataStoreTest do
  use ExUnit.Case, async: true

  setup do
    pid = DataStore.start_link()
    %{pid: pid}
  end
  
  test "inputs a fact" do
    assert DataStore.query("lucy") == []

    DataStore.input("is_a_cat", "lucy")
    DataStore.input("is_a_cat", "lulu")
    assert DataStore.query("is_a_cat") == ["lulu", "lucy"]
  end

  test "handles a basic query" do
    assert DataStore.query("is_a_cat") == []

    DataStore.input("is_a_cat", "lucy")
    assert DataStore.query("is_a_cat") == ["lucy"]
    DataStore.input("is_a_bat", "francis")
    assert DataStore.query("is_a_bat") == ["francis"]
  end
end
