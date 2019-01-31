defmodule PonbotWeb.Line.WebhookController do
  use PonbotWeb, :controller
  require IEx

  @channel_id "1633821373"
  @channel_secret "b037fbb16634379b18158655a60ac75f"

  # https://api.line.me/v2/oauth/accessToken

  def status(conn, _params) do
    events = conn.params["events"]
    [first_event| _] = events
    reply_token = first_event["replyToken"]
    access_token = "sss"
    case first_event["type"] do
      "message" ->
        case ExLineWrapper.reply("hi yo", reply_token, access_token) do
          {:ok} ->
            IO.puts "Reply message is successful sent."
          {:error} ->
            IO.puts "Access token is invalid"
            {:ok, resp} = ExLineWrapper.authenticate(@channel_id, @channel_secret)
            ExLineWrapper.reply("hi yo", reply_token, resp["access_token"])
        end
        conn
        |> put_status(200)
        |> render("index.html")
      _ ->
        conn
        |> put_status(200)
        |> render("index.html")
    end

  end

  def authenticate() do

  end

end
