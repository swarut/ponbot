# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :ponbot,
  ecto_repos: [Ponbot.Repo]

# Configures the endpoint
config :ponbot, PonbotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "KlfII6g5tBu2Th0VXnxkVEU4scPYIzQtomKdKpwebGj75neOa7/MN/iz/r2jJVNQ",
  render_errors: [view: PonbotWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Ponbot.PubSub, adapter: Phoenix.PubSub.PG2]

config :ponbot, environment: Mix.env

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
