defmodule MusicCollector.Repo.Migrations.CreatePlaylists do
  use Ecto.Migration

  def change do
    create table(:playlists) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
