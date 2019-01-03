defmodule Ponbot.Repo do
  use Ecto.Repo,
    otp_app: :ponbot,
    adapter: Ecto.Adapters.Postgres
end
