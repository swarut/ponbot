defmodule Ponbot.LineWebhookSupervisor do
  def handle_webhook(event, event_type) do
    opts = [restart: :transient]
    Task.Supervisor.start_child(__MODULE__, Ponbot.LineWebhook, :handle_webhook, [event, event_type], opts )
  end
end
