defmodule PonbotWeb.Line.WebhookController do
  use PonbotWeb, :controller
  require IEx


  def status(conn, _params) do
    IEx.pry
    events = conn.params["events"]
    [first_event| _] = events
    case first_event["type"] do
      "message" ->
        reply_token = first_event["replyToken"]
        access_token = "b+rw+B8C44Nbb+pb7Naf1Gvt7b42OydZDfOHlO0IBp+GP4JOZX8HtiKN6mrfjvNcNtxfnL9uzgWssp/f05zHHzJKUyZcAqYw1O9bDiHwRKgLpQJMEGqqdPjec9q682dcAeawxEmY7AZ/kW9rXXE7LwdB04t89/1O/w1cDnyilFU="
        IO.puts("GOT MESSAGE -- #{reply_token}")
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
    message_endpoint = "https://api.line.me/v2/bot/message/reply"
    header = [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{access_token}"}
    ]
    {:ok, body} = Jason.encode(%{
      replyToken: reply_token,
      messages: [%{
        type: "text",
        text: message
      }]
    })
    case HTTPoison.post message_endpoint, body, header do
      {:ok, resp} -> IO.puts("SENNNTTTT #{inspect resp}")
      {:error, err} -> IO.puts("ERRRORRRR #{inspect err}")
    end
  end
end
