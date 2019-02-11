defmodule Ponbot.Repo.Migrations.CreateExpensesExpenseTags do
  use Ecto.Migration

  def change do
    create table(:expenses_expense_tags) do
      add :expense_id, references(:expenses, on_delete: :nothing)
      add :expense_tag_id, references(:expense_tags, on_delete: :nothing)

      timestamps()
    end

    create index(:expenses_expense_tags, [:expense_id])
    create index(:expenses_expense_tags, [:expense_tag_id])
  end
end
