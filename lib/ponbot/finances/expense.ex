defmodule Ponbot.Finances.Expense do
  use Ecto.Schema
  import Ecto.Changeset


  schema "expenses" do
    field :cost, :integer
    field :title, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(expense, attrs) do
    expense
    |> cast(attrs, [:title, :cost, :user_id])
    |> validate_required([:title, :cost, :user_id])
  end
end
