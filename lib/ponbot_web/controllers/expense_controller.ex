defmodule PonbotWeb.ExpenseController do
  use PonbotWeb, :controller

  alias Ponbot.Finances
  alias Ponbot.Finances.Expense

  def index(conn, _params) do
    expenses = Finances.list_expenses()
    render(conn, "index.html", expenses: expenses)
  end

  def new(conn, _params) do
    changeset = Finances.change_expense(%Expense{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"expense" => expense_params}) do
    case Finances.create_expense(expense_params) do
      {:ok, expense} ->
        conn
        |> put_flash(:info, "Expense created successfully.")
        |> redirect(to: Routes.expense_path(conn, :show, expense))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    expense = Finances.get_expense!(id)
    render(conn, "show.html", expense: expense)
  end

  def edit(conn, %{"id" => id}) do
    expense = Finances.get_expense!(id)
    changeset = Finances.change_expense(expense)
    render(conn, "edit.html", expense: expense, changeset: changeset)
  end

  def update(conn, %{"id" => id, "expense" => expense_params}) do
    expense = Finances.get_expense!(id)

    case Finances.update_expense(expense, expense_params) do
      {:ok, expense} ->
        conn
        |> put_flash(:info, "Expense updated successfully.")
        |> redirect(to: Routes.expense_path(conn, :show, expense))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", expense: expense, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    expense = Finances.get_expense!(id)
    {:ok, _expense} = Finances.delete_expense(expense)

    conn
    |> put_flash(:info, "Expense deleted successfully.")
    |> redirect(to: Routes.expense_path(conn, :index))
  end
end
