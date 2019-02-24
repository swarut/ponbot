defmodule PonbotWeb.Line.WebhookController do
  use PonbotWeb, :controller

  def index(conn, _params) do
    Enum.each(conn.params["events"], fn(event) ->
      # Task.async(fn() -> handle_webhook(event, event["type"]) end)
      Ponbot.LineWebhookSupervisor.handle_webhook(event, event["type"])
    end)

    conn |> put_status(200) |> render("index.html")
  end

end
