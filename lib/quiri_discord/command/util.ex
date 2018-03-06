defmodule QuiriDiscord.Command.Util do
  require OK
  require Logger

  alias Nostrum.Api
  alias HTTPoison

  def ping(msg) do
    now = DateTime.utc_now() |> DateTime.to_unix(:millisecond)

    OK.try do
      pong <- Api.create_message(msg.channel_id, "Pong!")
      {:ok, time, _} = DateTime.from_iso8601(pong.timestamp)
      ping = DateTime.to_unix(time, :millisecond) - now
      _ <- Api.edit_message(msg.channel_id, pong.id, "Pong! #{ping}ms")
    after
    rescue
      err -> Logger.error(inspect(err))
    end
  end
end
