defmodule Ponbot.Repo.Migrations.AddMoreFieldToUser do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :display_name, :string
      add :picture_url, :string
    end
  end
end
