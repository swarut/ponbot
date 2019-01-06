defmodule Ponbot.Tasks.ReleaseTasks do
  @start_apps [
    :postgrex,
    :ecto,
    :ecto_sql
  ]

  @repo Ponbot.Repo

  @otp_app :ponbot

  def setup do
    boot()
    create_database()
    start_connection()
    run_migrations()
  end

  defp boot() do
    IO.puts "Booting pre hook..."
    # Load app without starting it
    # :ok = Application.load(@otp_app)
    case Application.load(@otp_app) do
      :ok -> IO.puts "Ponbot is now loaded."
      {:error, {reason, :ponbot}} -> IO.puts "Load failed #{inspect reason}"
    end

    # Ensure postgrex and ecto applications started
    Enum.each(@start_apps, &Application.ensure_all_started/1)
  end

  defp create_database() do
    IO.puts("-------- database url #{inspect System.get_env("PONBOT_DB_USERNAME")}")
    IO.puts("-------- database url #{inspect System.get_env("DATABASE_URL")}")
    IO.puts "Creating the database if needed.xxxx.. #{inspect @repo.config}"
    @repo.__adapter__.storage_up(@repo.config)
  end

  defp start_connection() do
    {:ok, _ } = @repo.start_link(pool_size: 2)
  end

  defp run_migrations do
    app = Keyword.get(@repo.config, :otp_app)
    IO.puts("Running migrations for #{app}")
    migrations_path = priv_path_for(@repo, "migrations")
    Ecto.Migrator.run(@repo, migrations_path, :up, all: true)
  end

  defp priv_path_for(repo, filename) do
    app = Keyword.get(repo.config, :otp_app)

    repo_underscore =
      repo
      |> Module.split()
      |> List.last()
      |> Macro.underscore()

    priv_dir = "#{:code.priv_dir(app)}"

    Path.join([priv_dir, repo_underscore, filename])
  end
end
