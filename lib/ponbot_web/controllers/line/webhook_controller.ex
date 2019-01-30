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
    access_token = "b+rw+B8C44Nbb+pb7Naf1Gvt7b42OydZDfOHlO0IBp+GP4JOZX8HtiKN6mrfjvNcNtxfnL9uzgWssp/f05zHHzJKUyZcAqYw1O9bDiHwRKgLpQJMEGqqdPjec9q682dcAeawxEmY7AZ/kW9rXXE7LwdB04t89/1O/w1cDnyilFU="
    case first_event["type"] do
      "message" ->
        ExLineWrapper.reply("hi yo", reply_token, access_token)
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
    ExLineWrapper.authenticate(@channel_id, @channel_secret)
  end
end
