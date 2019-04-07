defmodule Ponbot.LineWebhook do

  alias Ponbot.Configurations

  @channel_id Application.get_env(:ponbot, :line_channel_id)
  @channel_secret Application.get_env(:ponbot, :line_channel_secret)

  def handle_webhook(event, event_type) when event_type == "message" do
    case event["message"]["type"] do
      "text" ->
        text = event["message"]["text"]
        PonbotWeb.Endpoint.broadcast("line:lobby", "receive_message", %{message: text, from_user: event["source"]["userId"]})
        cond do
          String.starts_with?(text, "expense:") -> Ponbot.LineMessageHandler.handle_expense_message(event, text) #reply(event, "Received: #{text}")
          String.starts_with?(text, "weather:") -> reply(event, "Fine weather day")
          true -> reply(event, "yoyo")
        end

      "sticker" ->
        IO.puts "------------ignore sticker---------------------"
    end
  end

  def handle_webhook(event, event_type) when event_type == "follow" do
    reply_token = event["replyToken"]
    access_token = get_access_token()
    case ExLineWrapper.reply("Hello, nice to meet you!", reply_token, access_token) do
      {:ok} -> IO.puts "Reply message is successful sent."
    end
  end

  def handle_webhook(_event, event_type) when event_type == "unfollow" do
    IO.puts "Bot got unfollowed"
  end

  def reply(event, message) do
    reply_token = event["replyToken"]
    access_token = get_access_token()
    case ExLineWrapper.reply(message, reply_token, access_token) do
      {:ok} -> IO.puts "Message replied."
      {:error, "401"} ->
        IO.puts "ERROR : 401, unauthorized, will renew the token."
        renew_access_token()
        reply(event, message)
    end
  end

  defp get_access_token do
    case Configurations.get_setting_by_key("line_access_token") do
      %Configurations.Setting{key: "line_access_token", value: value} ->
        value
      nil ->
        {:ok, resp} = ExLineWrapper.authenticate(@channel_id, @channel_secret)
        {:ok, setting} = Configurations.create_setting(%{key: "line_access_token", value: resp["access_token"]})
        setting.value
    end
  end

  defp renew_access_token do
    setting = Configurations.get_setting_by_key("line_access_token")
    {:ok, resp} = ExLineWrapper.authenticate(@channel_id, @channel_secret)
    {:ok, setting} = Configurations.update_setting(setting, %{key: "line_acess_token", value: resp["access_token"]})
    setting.value
  end
end
