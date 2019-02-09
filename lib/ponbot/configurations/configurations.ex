defmodule Ponbot.Configurations do
  @moduledoc """
  The Configurations context.
  """

  import Ecto.Query, warn: false
  alias Ponbot.Repo

  alias Ponbot.Configurations.Setting

  @doc """
  Returns the list of settings.

  ## Examples

      iex> list_settings()
      [%Setting{}, ...]

  """
  def list_settings do
    Repo.all(Setting)
  end

  @doc """
  Gets a single setting.

  Raises `Ecto.NoResultsError` if the Setting does not exist.

  ## Examples

      iex> get_setting!(123)
      %Setting{}

      iex> get_setting!(456)
      ** (Ecto.NoResultsError)

  """
  def get_setting!(id), do: Repo.get!(Setting, id)

  def get_setting(id), do: Repo.get(Setting, id)

  @doc """
  Get a single setting by key.

  Raises `Ecto.NoResultsError` if the Setting does not exist.
  ## Examples
      iex> get_setting_by_key!("key")
      %Setting{}
  """
  def get_setting_by_key!(key), do: Repo.get_by!(Setting, key: key)
  def get_setting_by_key(key), do: Repo.get_by(Setting, key: key)

  @doc """
  Get a single setting by key or create if not exist.

  ## Examples
      iex> get_by_key_or_create(key, attrs)
      %Setting
  """
  def get_by_key_or_create(key, attrs) do
    case get_setting_by_key(key) do
      setting = %Setting{} -> setting
      _ ->
        {:ok, setting} = create_setting(attrs)
        setting
    end
  end


  @doc """
  Creates a setting.

  ## Examples

      iex> create_setting(%{field: value})
      {:ok, %Setting{}}

      iex> create_setting(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_setting(attrs \\ %{}) do
    %Setting{}
    |> Setting.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a setting.

  ## Examples

      iex> update_setting(setting, %{field: new_value})
      {:ok, %Setting{}}

      iex> update_setting(setting, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_setting(%Setting{} = setting, attrs) do
    setting
    |> Setting.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Setting.

  ## Examples

      iex> delete_setting(setting)
      {:ok, %Setting{}}

      iex> delete_setting(setting)
      {:error, %Ecto.Changeset{}}

  """
  def delete_setting(%Setting{} = setting) do
    Repo.delete(setting)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking setting changes.

  ## Examples

      iex> change_setting(setting)
      %Ecto.Changeset{source: %Setting{}}

  """
  def change_setting(%Setting{} = setting) do
    Setting.changeset(setting, %{})
  end
end
