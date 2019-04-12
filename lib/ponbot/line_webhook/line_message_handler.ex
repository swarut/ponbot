defmodule Ponbot.LineMessageHandler do

  def handle_message(event) do
    text = event["message"]["text"]
    PonbotWeb.Endpoint.broadcast("line:lobby", "receive_message", %{message: text, from_user: event["source"]["userId"]})
    cond do
      String.starts_with?(text, "expense:") -> handle_expense_message(event, text)
      String.starts_with?(text, "stock:") -> handle_stock_message(event, text)
      true -> Ponbot.LineWebhook.reply(event, "yoyo")
    end
  end

  def handle_expense_message(event, text) do
    Ponbot.LineWebhook.reply(event, "Received: #{text}")
  end

  def handle_stock_message(event, text) do
    Ponbot.LineWebhook.reply(event, "Received: #{text}")
  end

end


