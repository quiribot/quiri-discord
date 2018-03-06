defmodule QuiriDiscord do
  use Application

  alias QuiriDiscord.Consumer

  def start(_, _) do
    import Supervisor.Spec

    children = for i <- 1..System.schedulers_online(), do: worker(Consumer, [], id: i)
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
