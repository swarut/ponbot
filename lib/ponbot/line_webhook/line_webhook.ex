defmodule Ponbot.LineWebhook do

  alias Ponbot.Configurations

  @channel_id Application.get_env(:ponbot, :line_channel_id)
  @channel_secret Application.get_env(:ponbot, :line_channel_secret)

  def handle_webhook(event, event_type) when event_type == "message" do
    case event["message"]["type"] do
      "text" ->
        text = event["message"]["text"]
        cond do
          String.starts_with?(text, "expense:") -> reply(event, "Received: #{text}")
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

  defp reply(event, message) do
    reply_token = event["replyToken"]
    access_token = get_access_token()
    ExLineWrapper.reply(message, reply_token, access_token)
  end

  defp get_access_token do
    case Configurations.get_setting_by_key("line_access_token") do
      %Configurations.Setting{key: "line_access_token", value: value} -> value
      nil ->
        {:ok, resp} = ExLineWrapper.authenticate(@channel_id, @channel_secret)
        {:ok, setting} = Configurations.create_setting(%{key: "line_access_token", value: resp["access_token"]})
        setting.value
    end
  end
end
