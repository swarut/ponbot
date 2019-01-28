defmodule PonbotWeb.Line.WebhookController do
  use PonbotWeb, :controller
  require IEx

  @message_endpoint "https://api.line.me/v2/bot/message/reply"
  @oauth_endpoint "https://api.line.me/v2/oauth/accessToken"

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
        reply("hi yo", reply_token, access_token)
        conn
        |> put_status(200)
        |> render("index.html")
      _ ->
        conn
        |> put_status(200)
        |> render("index.html")
    end

  end

  defp reply(message, reply_token, access_token) do
    header = [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer dsfdsf#{access_token}"}
    ]
    {:ok, body} = Jason.encode(%{
      replyToken: reply_token,
      messages: [%{
        type: "text",
        text: message
      }]
    })
    case HTTPoison.post @message_endpoint, body, header do
      {:ok, resp = %HTTPoison.Response{status_code: 401}} -> IO.puts("STATUS 401: Unauthorized --- #{inspect resp}")
      {:ok, resp = %HTTPoison.Response{status_code: 200}} -> IO.puts("SENNNTTTT #{inspect resp}")
      {:error, err} -> IO.puts("ERRRORRRR #{inspect err}")
    end
  end

  defp authenticate() do
    header = [
      {"Content-Type", "application/x-www-form-urlencoded"}
    ]
    {:ok, body} = Jason.encode(%{
      grant_type: "client_credentials",
      client_id: @channel_id,
      client_secret: @channel_secret
    })
    case HTTPoison.post @oauth_endpoint, body, header do
      {:ok, resp = %HTTPoison.Response{status_code: 400}} -> IO.puts("STATUS 400: Unauthorized --- #{inspect resp}")
      {:ok, resp = %HTTPoison.Response{status_code: 200}} -> IO.puts("SENNNTTTT #{inspect resp}")
      {:error, err} -> IO.puts("ERRRORRRR #{inspect err}")
    end
  end
end
