defmodule Ponbot.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :last_login, :time
    field :line_id, :string
    field :username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :line_id, :last_login])
    |> validate_required([:username, :line_id])
  end
end
