defmodule Ponbot.LineWebhookSupervisor do
  def handle_webhook(event, event_type) do
    opts = [restart: :transient]
    p = Task.Supervisor.start_child(__MODULE__, Ponbot.LineWebhook, :handle_webhook, [event, event_type], opts )
    child_pids = Task.Supervisor.children(__MODULE__)
    IO.puts("p - #{inspect p}")
    IO.puts("child count = #{length(child_pids)} --- #{inspect __MODULE__}")
  end
end
