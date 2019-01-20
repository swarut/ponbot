defmodule PonbotWeb.PageController do
  use PonbotWeb, :controller
  require IEx

  def index(conn, _params) do
    conn
    |> assign(:env, Application.get_env(:ponbot, :environment))
    |> render("index.html")
  end

  def status(conn, _params) do
    IEx.pry
    conn
    |> put_status(200)
    |> render("index.html")
  end
end
