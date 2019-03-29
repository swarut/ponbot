defmodule PonbotWeb.Router do
  use PonbotWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :line_webhook do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    # plug PonbotWeb.LineWebhookPlug, mount: ["line", "webhook"], line_secret: "b037fbb16634379b18158655a60ac75f"
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/line" do
    pipe_through :line_webhook

    get "/chat", PonbotWeb.Line.ChatController, :index
    post "/webhook", PonbotWeb.Line.WebhookController, :index
  end

  scope "/", PonbotWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/users", UserController
    resources "/addresses", AddressController
    resources "/settings", SettingController
    resources "/expenses", ExpenseController
    resources "/expense_tags", ExpenseTagController
  end

  # Other scopes may use custom stacks.
  # scope "/api", PonbotWeb do
  #   pipe_through :api
  # end
end
