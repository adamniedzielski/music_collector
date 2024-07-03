defmodule MusicCollectorWeb.PlaylistBoughtTrackController do
  use MusicCollectorWeb, :controller

  alias MusicCollector.Music
  alias MusicCollector.Music.PlaylistBoughtTrack
  alias MusicCollector.Repo

  def create(conn, %{
        "playlist_id" => playlist_id,
        "playlist_bought_track" => playlist_bought_track_params
      }) do
    playlist = Music.get_playlist!(playlist_id)

    %PlaylistBoughtTrack{playlist_id: playlist.id}
    |> PlaylistBoughtTrack.changeset(playlist_bought_track_params)
    |> Repo.insert()

    conn
    |> put_flash(:info, "Playlist updated successfully.")
    |> redirect(to: ~p"/playlists/#{playlist}")
  end
end
