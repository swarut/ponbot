defmodule Ponbot.Accounts.Address do
  use Ecto.Schema
  import Ecto.Changeset


  schema "addresses" do
    field :city, :string
    field :country, :string
    field :postcode, :string
    field :state, :string
    field :street_address, :string

    timestamps()
  end

  @doc false
  def changeset(address, attrs) do
    address
    |> cast(attrs, [:street_address, :postcode, :city, :country, :state])
    |> validate_required([:street_address, :postcode, :city, :country, :state])
  end
end
