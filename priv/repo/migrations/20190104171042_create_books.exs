defmodule Ponbot.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :name, :string
      add :price, :integer

      timestamps()
    end

  end
end
