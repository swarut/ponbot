defmodule PonbotWeb.PageController do
  use PonbotWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
