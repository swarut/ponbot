use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :ponbot, PonbotWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :ponbot, Ponbot.Repo,
  username: System.get_env("TEST_DB_USERNAME"),
  password: System.get_env("TEST_DB_PASSWORD"),
  database: System.get_env("TEST_DB"),
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
