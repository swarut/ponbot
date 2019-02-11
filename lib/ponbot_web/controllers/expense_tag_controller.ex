defmodule PonbotWeb.ExpenseTagController do
  use PonbotWeb, :controller

  alias Ponbot.Finances
  alias Ponbot.Finances.ExpenseTag

  def index(conn, _params) do
    expense_tags = Finances.list_expense_tags()
    render(conn, "index.html", expense_tags: expense_tags)
  end

  def new(conn, _params) do
    changeset = Finances.change_expense_tag(%ExpenseTag{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"expense_tag" => expense_tag_params}) do
    case Finances.create_expense_tag(expense_tag_params) do
      {:ok, expense_tag} ->
        conn
        |> put_flash(:info, "Expense tag created successfully.")
        |> redirect(to: Routes.expense_tag_path(conn, :show, expense_tag))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    expense_tag = Finances.get_expense_tag!(id)
    render(conn, "show.html", expense_tag: expense_tag)
  end

  def edit(conn, %{"id" => id}) do
    expense_tag = Finances.get_expense_tag!(id)
    changeset = Finances.change_expense_tag(expense_tag)
    render(conn, "edit.html", expense_tag: expense_tag, changeset: changeset)
  end

  def update(conn, %{"id" => id, "expense_tag" => expense_tag_params}) do
    expense_tag = Finances.get_expense_tag!(id)

    case Finances.update_expense_tag(expense_tag, expense_tag_params) do
      {:ok, expense_tag} ->
        conn
        |> put_flash(:info, "Expense tag updated successfully.")
        |> redirect(to: Routes.expense_tag_path(conn, :show, expense_tag))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", expense_tag: expense_tag, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    expense_tag = Finances.get_expense_tag!(id)
    {:ok, _expense_tag} = Finances.delete_expense_tag(expense_tag)

    conn
    |> put_flash(:info, "Expense tag deleted successfully.")
    |> redirect(to: Routes.expense_tag_path(conn, :index))
  end
end
