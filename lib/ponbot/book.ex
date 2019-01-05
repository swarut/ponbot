defmodule Ponbot.Book do
  use Ecto.Schema
  import Ecto.Changeset


  schema "books" do
    field :name, :string
    field :price, :integer

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
