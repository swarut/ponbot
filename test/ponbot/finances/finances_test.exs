defmodule Ponbot.FinancesTest do
  use Ponbot.DataCase

  alias Ponbot.Finances

  describe "expenses" do
    alias Ponbot.Finances.Expense

    @valid_attrs %{cost: 42, title: "some title"}
    @update_attrs %{cost: 43, title: "some updated title"}
    @invalid_attrs %{cost: nil, title: nil}

    def expense_fixture(attrs \\ %{}) do
      {:ok, expense} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Finances.create_expense()

      expense
    end

    test "list_expenses/0 returns all expenses" do
      expense = expense_fixture()
      assert Finances.list_expenses() == [expense]
    end

    test "get_expense!/1 returns the expense with given id" do
      expense = expense_fixture()
      assert Finances.get_expense!(expense.id) == expense
    end

    test "create_expense/1 with valid data creates a expense" do
      assert {:ok, %Expense{} = expense} = Finances.create_expense(@valid_attrs)
      assert expense.cost == 42
      assert expense.title == "some title"
    end

    test "create_expense/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finances.create_expense(@invalid_attrs)
    end

    test "update_expense/2 with valid data updates the expense" do
      expense = expense_fixture()
      assert {:ok, %Expense{} = expense} = Finances.update_expense(expense, @update_attrs)
      assert expense.cost == 43
      assert expense.title == "some updated title"
    end

    test "update_expense/2 with invalid data returns error changeset" do
      expense = expense_fixture()
      assert {:error, %Ecto.Changeset{}} = Finances.update_expense(expense, @invalid_attrs)
      assert expense == Finances.get_expense!(expense.id)
    end

    test "delete_expense/1 deletes the expense" do
      expense = expense_fixture()
      assert {:ok, %Expense{}} = Finances.delete_expense(expense)
      assert_raise Ecto.NoResultsError, fn -> Finances.get_expense!(expense.id) end
    end

    test "change_expense/1 returns a expense changeset" do
      expense = expense_fixture()
      assert %Ecto.Changeset{} = Finances.change_expense(expense)
    end
  end

  describe "expense_tags" do
    alias Ponbot.Finances.ExpenseTag

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def expense_tag_fixture(attrs \\ %{}) do
      {:ok, expense_tag} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Finances.create_expense_tag()

      expense_tag
    end

    test "list_expense_tags/0 returns all expense_tags" do
      expense_tag = expense_tag_fixture()
      assert Finances.list_expense_tags() == [expense_tag]
    end

    test "get_expense_tag!/1 returns the expense_tag with given id" do
      expense_tag = expense_tag_fixture()
      assert Finances.get_expense_tag!(expense_tag.id) == expense_tag
    end

    test "create_expense_tag/1 with valid data creates a expense_tag" do
      assert {:ok, %ExpenseTag{} = expense_tag} = Finances.create_expense_tag(@valid_attrs)
      assert expense_tag.name == "some name"
    end

    test "create_expense_tag/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finances.create_expense_tag(@invalid_attrs)
    end

    test "update_expense_tag/2 with valid data updates the expense_tag" do
      expense_tag = expense_tag_fixture()
      assert {:ok, %ExpenseTag{} = expense_tag} = Finances.update_expense_tag(expense_tag, @update_attrs)
      assert expense_tag.name == "some updated name"
    end

    test "update_expense_tag/2 with invalid data returns error changeset" do
      expense_tag = expense_tag_fixture()
      assert {:error, %Ecto.Changeset{}} = Finances.update_expense_tag(expense_tag, @invalid_attrs)
      assert expense_tag == Finances.get_expense_tag!(expense_tag.id)
    end

    test "delete_expense_tag/1 deletes the expense_tag" do
      expense_tag = expense_tag_fixture()
      assert {:ok, %ExpenseTag{}} = Finances.delete_expense_tag(expense_tag)
      assert_raise Ecto.NoResultsError, fn -> Finances.get_expense_tag!(expense_tag.id) end
    end

    test "change_expense_tag/1 returns a expense_tag changeset" do
      expense_tag = expense_tag_fixture()
      assert %Ecto.Changeset{} = Finances.change_expense_tag(expense_tag)
    end
  end
end
