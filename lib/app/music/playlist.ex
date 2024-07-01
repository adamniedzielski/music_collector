defmodule MusicCollector.Music.Playlist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "playlists" do
    field :name, :string
    field :spotify_url, :string
    field :apple_music_url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(playlist, attrs) do
    playlist
    |> cast(attrs, [:name, :spotify_url, :apple_music_url])
    |> validate_required([:name])
  end
end
