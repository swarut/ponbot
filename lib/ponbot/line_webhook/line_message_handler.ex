defmodule Ponbot.LineMessageHandler do

  def handle_expense_message(event, text) do
    Ponbot.LineWebhook.reply(event, "Received: #{text}")
  end
end


