defmodule Ponbot.Finances.ExpenseTag do
  use Ecto.Schema
  import Ecto.Changeset


  schema "expense_tags" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(expense_tag, attrs) do
    expense_tag
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
