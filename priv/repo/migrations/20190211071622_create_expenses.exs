defmodule Ponbot.Repo.Migrations.CreateExpenses do
  use Ecto.Migration

  def change do
    create table(:expenses) do
      add :title, :string
      add :cost, :integer
      add :user_id, references(:users)

      timestamps()
    end

    create index(:expenses, [:user_id])

  end
end
