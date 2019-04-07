defmodule PonbotWeb.Line.ChatController do
  use PonbotWeb, :controller
  plug :put_layout, "chat.html"

  def index(conn, _params) do
    conn |> render("index.html")
  end

  def ping(conn, _params) do
    IO.puts "Trying to ping the channel"
    conn |> render("index.html")
  end

end
