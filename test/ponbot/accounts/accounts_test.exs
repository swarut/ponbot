defmodule Ponbot.AccountsTest do
  use Ponbot.DataCase

  alias Ponbot.Accounts

  describe "user" do
    alias Ponbot.Accounts.User

    @valid_attrs %{last_login: ~T[14:00:00], line_id: "some line_id", username: "some username"}
    @update_attrs %{last_login: ~T[15:01:01], line_id: "some updated line_id", username: "some updated username"}
    @invalid_attrs %{last_login: nil, line_id: nil, username: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_user/0 returns all user" do
      user = user_fixture()
      assert Accounts.list_user() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.last_login == ~T[14:00:00]
      assert user.line_id == "some line_id"
      assert user.username == "some username"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.last_login == ~T[15:01:01]
      assert user.line_id == "some updated line_id"
      assert user.username == "some updated username"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "addresses" do
    alias Ponbot.Accounts.Address

    @valid_attrs %{city: "some city", country: "some country", postcode: "some postcode", state: "some state", street_address: "some street_address"}
    @update_attrs %{city: "some updated city", country: "some updated country", postcode: "some updated postcode", state: "some updated state", street_address: "some updated street_address"}
    @invalid_attrs %{city: nil, country: nil, postcode: nil, state: nil, street_address: nil}

    def address_fixture(attrs \\ %{}) do
      {:ok, address} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_address()

      address
    end

    test "list_addresses/0 returns all addresses" do
      address = address_fixture()
      assert Accounts.list_addresses() == [address]
    end

    test "get_address!/1 returns the address with given id" do
      address = address_fixture()
      assert Accounts.get_address!(address.id) == address
    end

    test "create_address/1 with valid data creates a address" do
      assert {:ok, %Address{} = address} = Accounts.create_address(@valid_attrs)
      assert address.city == "some city"
      assert address.country == "some country"
      assert address.postcode == "some postcode"
      assert address.state == "some state"
      assert address.street_address == "some street_address"
    end

    test "create_address/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_address(@invalid_attrs)
    end

    test "update_address/2 with valid data updates the address" do
      address = address_fixture()
      assert {:ok, %Address{} = address} = Accounts.update_address(address, @update_attrs)
      assert address.city == "some updated city"
      assert address.country == "some updated country"
      assert address.postcode == "some updated postcode"
      assert address.state == "some updated state"
      assert address.street_address == "some updated street_address"
    end

    test "update_address/2 with invalid data returns error changeset" do
      address = address_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_address(address, @invalid_attrs)
      assert address == Accounts.get_address!(address.id)
    end

    test "delete_address/1 deletes the address" do
      address = address_fixture()
      assert {:ok, %Address{}} = Accounts.delete_address(address)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_address!(address.id) end
    end

    test "change_address/1 returns a address changeset" do
      address = address_fixture()
      assert %Ecto.Changeset{} = Accounts.change_address(address)
    end
  end
end
