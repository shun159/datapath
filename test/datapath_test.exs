defmodule DatapathTest do
  use ExUnit.Case
  doctest Datapath

  test "greets the world" do
    assert Datapath.hello() == :world
  end
end
