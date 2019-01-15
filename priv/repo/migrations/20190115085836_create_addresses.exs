defmodule Ponbot.Repo.Migrations.CreateAddresses do
  use Ecto.Migration

  def change do
    create table(:addresses) do
      add :street_address, :string
      add :postcode, :string
      add :city, :string
      add :country, :string
      add :state, :string

      timestamps()
    end

  end
end
