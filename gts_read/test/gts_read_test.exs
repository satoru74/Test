defmodule GtsReadTest do
  use ExUnit.Case
  doctest GtsRead

  test "greets the world" do
    assert GtsRead.hello() == :world
  end
end
