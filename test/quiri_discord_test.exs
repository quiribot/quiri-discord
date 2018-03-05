defmodule QuiriDiscordTest do
  use ExUnit.Case
  doctest QuiriDiscord

  test "greets the world" do
    assert QuiriDiscord.hello() == :world
  end
end
