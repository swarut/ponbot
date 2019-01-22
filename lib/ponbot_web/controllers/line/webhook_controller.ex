defmodule PonbotWeb.Line.WebhookController do
  use PonbotWeb, :controller
  require IEx

  def status(conn, _params) do
    # IEx.pry
    events = conn.params["events"]
    [first_event| _] = events
    case first_event["type"] do
      "message" ->

        reply_token = first_event["replyToken"]
        IO.puts("GOT MESSAGE -- #{reply_token}")

        message_endpoint = "https://api.line.me/v2/bot/message/reply"
        header = [
          {"Content-Type", "application/json"},
          {"Authorization", "Bearer vyBv9sYAvEbd8Gie+BRYaigCw/1SdpSCcnqJ38LernVL9ASCEjyM92JsSR5bv802NtxfnL9uzgWssp/f05zHHzJKUyZcAqYw1O9bDiHwRKhJchw3rhwmuhocQ5MLKqQ+2Rh2q24Loa7FIWPIIykeFgdB04t89/1O/w1cDnyilFU="}
        ]
        {:ok, body} = Jason.encode(%{
          replyToken: reply_token,
          messages: [%{
            type: "text",
            text: "hello from reply"
          }]
        })
        case HTTPoison.post message_endpoint, body, header do
          {:ok, resp} -> IO.puts("SENNNTTTT #{inspect resp}")
          {:error, err} -> IO.puts("ERRRORRRR #{inspect err}")
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
end
