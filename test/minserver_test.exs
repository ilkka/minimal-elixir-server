defmodule MinserverTest do
  use ExUnit.Case
  doctest Minserver

  test "greets the world" do
    assert Minserver.hello() == :world
  end
end
