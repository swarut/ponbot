defmodule Ponbot.Repo.Migrations.CreateUser do
  use Ecto.Migration

  def change do
    create table(:user) do
      add :username, :string
      add :line_id, :string
      add :last_login, :time

      timestamps()
    end

  end
end
