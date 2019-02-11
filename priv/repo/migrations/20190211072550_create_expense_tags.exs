defmodule Ponbot.Repo.Migrations.CreateExpenseTags do
  use Ecto.Migration

  def change do
    create table(:expense_tags) do
      add :name, :string

      timestamps()
    end

  end
end
