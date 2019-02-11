defmodule Ponbot.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :title, :string
      add :cost, :integer

      timestamps()
    end

  end
end
