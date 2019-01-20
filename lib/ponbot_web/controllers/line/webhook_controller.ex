defmodule PonbotWeb.Line.WebhookController do
  use PonbotWeb, :controller
  require IEx

  def status(conn, _params) do
    IEx.pry
    conn
    |> put_status(200)
    |> render("index.html")
  end
end
