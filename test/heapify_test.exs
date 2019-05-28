defmodule HeapifyTest do
  use ExUnit.Case
  doctest Heapify

  test "it heapifies a list" do
    list = [5,4,3,2,1]

    list = Heapify.run(list)
    assert Enum.at(list, 0) == 1
  end

  test "it can heapify a very long list" do
    list = Enum.map(0..9_999, fn _ -> :rand.uniform(10_000) end)

    list = Heapify.run(list)
    assert Enum.min(list) == hd(list)
  end

  test "it will raise an error if given parameter is not a list" do
    assert_raise RuntimeError, fn -> Heapify.run(nil) end
    assert_raise RuntimeError, fn -> Heapify.run("test") end
  end
end
