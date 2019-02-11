defmodule Ponbot.Finances.ExpensesExpenseTags do
  use Ecto.Schema
  import Ecto.Changeset


  schema "expenses_expense_tags" do
    field :expense_id, :id
    field :expense_tag_id, :id

    timestamps()
  end

  @doc false
  def changeset(expenses_expense_tags, attrs) do
    expenses_expense_tags
    |> cast(attrs, [])
    |> validate_required([])
  end
end
