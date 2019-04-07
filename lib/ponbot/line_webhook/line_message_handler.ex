defmodule Ponbot.LineMessageHandler do

  def handle_expense_message(event, text) do
    PonbotWeb.Endpoint.broadcast("line:lobby", "receive_message", %{text: "yoman"})
    Ponbot.LineWebhook.reply(event, "Received: #{text}")
  end
end


