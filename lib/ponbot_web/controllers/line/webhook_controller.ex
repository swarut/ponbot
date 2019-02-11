defmodule PonbotWeb.Line.WebhookController do
  use PonbotWeb, :controller
  require IEx

  alias Ponbot.Configurations

  @channel_id "1633821373"
  @channel_secret "b037fbb16634379b18158655a60ac75f"

  # https://api.line.me/v2/oauth/accessToken

  def index(conn, _params) do
    Enum.each(conn.params["events"], fn(event) ->
      Task.async(fn() -> handle_webhook(event, event["type"]) end)
    end)

    conn |> put_status(200) |> render("index.html")
  end

  def handle_webhook(event, event_type) when event_type == "message" do
    reply_token = event["replyToken"]
    access_token = get_access_token()
    case event["message"]["type"] do
      "text" ->
        ExLineWrapper.reply("hi yo", reply_token, access_token)
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
    IO.puts "Bot got unfollowed T_T"
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
