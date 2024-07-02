defmodule MusicCollectorWeb.BoughtTrackController do
  use MusicCollectorWeb, :controller

  alias MusicCollector.Music
  alias MusicCollector.Music.BoughtTrack

  def index(conn, _params) do
    bought_tracks = Music.list_bought_tracks()
    render(conn, :index, bought_tracks: bought_tracks)
  end

  def new(conn, _params) do
    changeset = Music.change_bought_track(%BoughtTrack{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"bought_track" => bought_track_params}) do
    case Music.create_bought_track(bought_track_params) do
      {:ok, bought_track} ->
        conn
        |> put_flash(:info, "Bought track created successfully.")
        |> redirect(to: ~p"/bought_tracks/#{bought_track}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bought_track = Music.get_bought_track!(id)
    render(conn, :show, bought_track: bought_track)
  end

  def edit(conn, %{"id" => id}) do
    bought_track = Music.get_bought_track!(id)
    changeset = Music.change_bought_track(bought_track)
    render(conn, :edit, bought_track: bought_track, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bought_track" => bought_track_params}) do
    bought_track = Music.get_bought_track!(id)

    case Music.update_bought_track(bought_track, bought_track_params) do
      {:ok, bought_track} ->
        conn
        |> put_flash(:info, "Bought track updated successfully.")
        |> redirect(to: ~p"/bought_tracks/#{bought_track}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, bought_track: bought_track, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bought_track = Music.get_bought_track!(id)
    {:ok, _bought_track} = Music.delete_bought_track(bought_track)

    conn
    |> put_flash(:info, "Bought track deleted successfully.")
    |> redirect(to: ~p"/bought_tracks")
  end
end
