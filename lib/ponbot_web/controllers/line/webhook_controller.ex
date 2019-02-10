defmodule PonbotWeb.Line.WebhookController do
  use PonbotWeb, :controller
  require IEx

  alias Ponbot.Configurations

  @channel_id "1633821373"
  @channel_secret "b037fbb16634379b18158655a60ac75f"

  # https://api.line.me/v2/oauth/accessToken

  def index(conn, _params) do
    events = conn.params["events"]
    [first_event| _] = events

    handle_message(conn, first_event, first_event["type"])

    conn
    |> put_status(200)
    |> render("index.html")
  end

  def handle_message(conn, event, event_type) when event_type == "message" do
    reply_token = event["replyToken"]
    access_token = get_access_token()
    case ExLineWrapper.reply("hi yo", reply_token, access_token) do
      {:ok} ->
        IO.puts "Reply message is successful sent."
      {:error} ->
        IO.puts "Access token is invalid"
        {:ok, resp} = ExLineWrapper.authenticate(@channel_id, @channel_secret)
        ExLineWrapper.reply("hi yo", reply_token, resp["access_token"])
    end
  end

  defp get_access_token do
    access_token = case Configurations.get_setting_by_key("line_access_token") do
      %Configurations.Setting{key: "line_access_token", value: value} -> value
      nil ->
        {:ok, resp} = ExLineWrapper.authenticate(@channel_id, @channel_secret)
        {:ok, setting} = Configurations.create_setting(%{key: "line_access_token", value: resp["access_token"]})
        setting.value
    end
  end
end
