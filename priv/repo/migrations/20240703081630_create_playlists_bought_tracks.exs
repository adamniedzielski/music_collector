defmodule MusicCollector.Repo.Migrations.CreatePlaylistsBoughtTracks do
  use Ecto.Migration

  def change do
    create table(:playlists_bought_tracks) do
      add :playlist_id, references(:playlists)
      add :bought_track_id, references(:bought_tracks)

      timestamps(type: :utc_datetime)
    end

    create unique_index(:playlists_bought_tracks, [:playlist_id, :bought_track_id])
  end
end
