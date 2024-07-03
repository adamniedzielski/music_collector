defmodule MusicCollectorWeb.PlaylistController do
  use MusicCollectorWeb, :controller

  alias MusicCollector.Music
  alias MusicCollector.Music.Playlist

  def index(conn, params) do
    playlists =
      case params["q"] do
        "apple_music_only" -> Music.list_in_apple_music_only()
        "spotify_only" -> Music.list_in_spotify_only()
        _ -> Music.list_playlists()
      end

    render(conn, :index, playlists: playlists)
  end

  def new(conn, _params) do
    changeset = Music.change_playlist(%Playlist{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"playlist" => playlist_params}) do
    case Music.create_playlist(playlist_params) do
      {:ok, playlist} ->
        conn
        |> put_flash(:info, "Playlist created successfully.")
        |> redirect(to: ~p"/playlists/#{playlist}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    playlist = Music.get_playlist!(id)
    bought_tracks = Music.list_bought_tracks
    changeset = Music.change_playlist_bought_track(%MusicCollector.Music.PlaylistBoughtTrack{})
    render(conn, :show, playlist: playlist, bought_tracks: bought_tracks, changeset: changeset)
  end

  def edit(conn, %{"id" => id}) do
    playlist = Music.get_playlist!(id)
    changeset = Music.change_playlist(playlist)
    render(conn, :edit, playlist: playlist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "playlist" => playlist_params}) do
    playlist = Music.get_playlist!(id)

    case Music.update_playlist(playlist, playlist_params) do
      {:ok, playlist} ->
        conn
        |> put_flash(:info, "Playlist updated successfully.")
        |> redirect(to: ~p"/playlists/#{playlist}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, playlist: playlist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    playlist = Music.get_playlist!(id)
    {:ok, _playlist} = Music.delete_playlist(playlist)

    conn
    |> put_flash(:info, "Playlist deleted successfully.")
    |> redirect(to: ~p"/playlists")
  end
end
