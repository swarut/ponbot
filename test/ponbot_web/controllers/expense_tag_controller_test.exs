defmodule PonbotWeb.ExpenseTagControllerTest do
  use PonbotWeb.ConnCase

  alias Ponbot.Finances

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  def fixture(:expense_tag) do
    {:ok, expense_tag} = Finances.create_expense_tag(@create_attrs)
    expense_tag
  end

  describe "index" do
    test "lists all expense_tags", %{conn: conn} do
      conn = get(conn, Routes.expense_tag_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Expense tags"
    end
  end

  describe "new expense_tag" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.expense_tag_path(conn, :new))
      assert html_response(conn, 200) =~ "New Expense tag"
    end
  end

  describe "create expense_tag" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.expense_tag_path(conn, :create), expense_tag: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.expense_tag_path(conn, :show, id)

      conn = get(conn, Routes.expense_tag_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Expense tag"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.expense_tag_path(conn, :create), expense_tag: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Expense tag"
    end
  end

  describe "edit expense_tag" do
    setup [:create_expense_tag]

    test "renders form for editing chosen expense_tag", %{conn: conn, expense_tag: expense_tag} do
      conn = get(conn, Routes.expense_tag_path(conn, :edit, expense_tag))
      assert html_response(conn, 200) =~ "Edit Expense tag"
    end
  end

  describe "update expense_tag" do
    setup [:create_expense_tag]

    test "redirects when data is valid", %{conn: conn, expense_tag: expense_tag} do
      conn = put(conn, Routes.expense_tag_path(conn, :update, expense_tag), expense_tag: @update_attrs)
      assert redirected_to(conn) == Routes.expense_tag_path(conn, :show, expense_tag)

      conn = get(conn, Routes.expense_tag_path(conn, :show, expense_tag))
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, expense_tag: expense_tag} do
      conn = put(conn, Routes.expense_tag_path(conn, :update, expense_tag), expense_tag: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Expense tag"
    end
  end

  describe "delete expense_tag" do
    setup [:create_expense_tag]

    test "deletes chosen expense_tag", %{conn: conn, expense_tag: expense_tag} do
      conn = delete(conn, Routes.expense_tag_path(conn, :delete, expense_tag))
      assert redirected_to(conn) == Routes.expense_tag_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.expense_tag_path(conn, :show, expense_tag))
      end
    end
  end

  defp create_expense_tag(_) do
    expense_tag = fixture(:expense_tag)
    {:ok, expense_tag: expense_tag}
  end
end
