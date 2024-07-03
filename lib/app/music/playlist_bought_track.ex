defmodule MusicCollector.Music.PlaylistBoughtTrack do
  use Ecto.Schema
  import Ecto.Changeset

  schema "playlists_bought_tracks" do
    belongs_to :bought_track, MusicCollector.Music.BoughtTrack
    belongs_to :playlist, MusicCollector.Music.Playlist

    timestamps(type: :utc_datetime)
  end

  def changeset(playlist_bought_track, attrs) do
    playlist_bought_track
    |> cast(attrs, [:bought_track_id, :playlist_id])
  end
end
