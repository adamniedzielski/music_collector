defmodule MusicCollector.Repo.Migrations.AddExternalUrlsToPlaylist do
  use Ecto.Migration

  def change do
    alter table("playlists") do
      add :spotify_url, :text
      add :apple_music_url, :text
    end
  end
end
