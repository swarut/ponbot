defmodule Ponbot.Finances do
  @moduledoc """
  The Finances context.
  """

  import Ecto.Query, warn: false
  alias Ponbot.Repo

  alias Ponbot.Finances.Expense

  @doc """
  Returns the list of expenses.

  ## Examples

      iex> list_expenses()
      [%Expense{}, ...]

  """
  def list_expenses do
    Repo.all(Expense)
  end

  @doc """
  Gets a single expense.

  Raises `Ecto.NoResultsError` if the Expense does not exist.

  ## Examples

      iex> get_expense!(123)
      %Expense{}

      iex> get_expense!(456)
      ** (Ecto.NoResultsError)

  """
  def get_expense!(id), do: Repo.get!(Expense, id)

  @doc """
  Creates a expense.

  ## Examples

      iex> create_expense(%{field: value})
      {:ok, %Expense{}}

      iex> create_expense(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_expense(attrs \\ %{}) do
    %Expense{}
    |> Expense.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a expense.

  ## Examples

      iex> update_expense(expense, %{field: new_value})
      {:ok, %Expense{}}

      iex> update_expense(expense, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_expense(%Expense{} = expense, attrs) do
    expense
    |> Expense.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Expense.

  ## Examples

      iex> delete_expense(expense)
      {:ok, %Expense{}}

      iex> delete_expense(expense)
      {:error, %Ecto.Changeset{}}

  """
  def delete_expense(%Expense{} = expense) do
    Repo.delete(expense)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking expense changes.

  ## Examples

      iex> change_expense(expense)
      %Ecto.Changeset{source: %Expense{}}

  """
  def change_expense(%Expense{} = expense) do
    Expense.changeset(expense, %{})
  end

  alias Ponbot.Finances.ExpenseTag

  @doc """
  Returns the list of expense_tags.

  ## Examples

      iex> list_expense_tags()
      [%ExpenseTag{}, ...]

  """
  def list_expense_tags do
    Repo.all(ExpenseTag)
  end

  @doc """
  Gets a single expense_tag.

  Raises `Ecto.NoResultsError` if the Expense tag does not exist.

  ## Examples

      iex> get_expense_tag!(123)
      %ExpenseTag{}

      iex> get_expense_tag!(456)
      ** (Ecto.NoResultsError)

  """
  def get_expense_tag!(id), do: Repo.get!(ExpenseTag, id)

  @doc """
  Creates a expense_tag.

  ## Examples

      iex> create_expense_tag(%{field: value})
      {:ok, %ExpenseTag{}}

      iex> create_expense_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_expense_tag(attrs \\ %{}) do
    %ExpenseTag{}
    |> ExpenseTag.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a expense_tag.

  ## Examples

      iex> update_expense_tag(expense_tag, %{field: new_value})
      {:ok, %ExpenseTag{}}

      iex> update_expense_tag(expense_tag, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_expense_tag(%ExpenseTag{} = expense_tag, attrs) do
    expense_tag
    |> ExpenseTag.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a ExpenseTag.

  ## Examples

      iex> delete_expense_tag(expense_tag)
      {:ok, %ExpenseTag{}}

      iex> delete_expense_tag(expense_tag)
      {:error, %Ecto.Changeset{}}

  """
  def delete_expense_tag(%ExpenseTag{} = expense_tag) do
    Repo.delete(expense_tag)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking expense_tag changes.

  ## Examples

      iex> change_expense_tag(expense_tag)
      %Ecto.Changeset{source: %ExpenseTag{}}

  """
  def change_expense_tag(%ExpenseTag{} = expense_tag) do
    ExpenseTag.changeset(expense_tag, %{})
  end
end
