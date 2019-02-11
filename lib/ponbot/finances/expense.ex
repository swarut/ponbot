defmodule Ponbot.Finances.Expense do
  use Ecto.Schema
  import Ecto.Changeset


  schema "expenses" do
    field :cost, :integer
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:title, :cost])
    |> validate_required([:title, :cost])
  end
end
