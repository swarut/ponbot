defmodule PonbotWeb.PageController do
  use PonbotWeb, :controller

  def index(conn, _params) do
    conn
    |> assign(:env, Application.get_env(:ponbot, :environment))
    |> render("index.html")
  end
end
