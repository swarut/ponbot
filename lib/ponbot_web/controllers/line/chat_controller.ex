defmodule PonbotWeb.Line.ChatController do
  use PonbotWeb, :controller

  def index(conn, _params) do
    conn |> render("index.html")
  end

end
