defmodule PonbotWeb.Router do
  use PonbotWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/line" do
    pipe_through :browser

    post "/webhook", PonbotWeb.Line.WebhookController, :status
    get "/webhook", PonbotWeb.Line.WebhookController, :status
  end

  scope "/", PonbotWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/addresses", AddressController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PonbotWeb do
  #   pipe_through :api
  # end
end
