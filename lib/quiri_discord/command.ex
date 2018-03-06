defmodule QuiriDiscord.Command do
  @prefix "quiri, "

  alias QuiriDiscord.Command.Util

  defp actionable_command?(msg) do
    self_id = Nostrum.Cache.Me.get().id
    String.starts_with?(msg.content, @prefix) and msg.author.id != self_id
  end

  def handle(msg) do
    if actionable_command?(msg) do
      msg.content
      |> String.trim()
      |> String.split(" ")
      |> tl
      |> execute(msg)
    end
  end

  def execute(["ping"], msg) do
    Util.ping(msg)
  end

  def execute(["search", "find"], msg) do
    search =
      send..receive do
        {:ok, result} ->
          "ok!"

        # code
        {:err, result} ->
          "err!"
          # code
      after
        60_000 -> "Seems the API didn't respond in time..."
      end
  end

  def execute(_, _) do
    :noop
  end
end
