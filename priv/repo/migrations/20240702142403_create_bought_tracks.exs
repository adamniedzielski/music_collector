defmodule MusicCollector.Repo.Migrations.CreateBoughtTracks do
  use Ecto.Migration

  def change do
    create table(:bought_tracks) do
      add :name, :string
      add :artist, :string
      add :platform, :string

      timestamps(type: :utc_datetime)
    end
  end
end
