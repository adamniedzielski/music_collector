defmodule MusicCollector.Music do
  @moduledoc """
  The Music context.
  """

  import Ecto.Query, warn: false
  alias MusicCollector.Repo

  alias MusicCollector.Music.Playlist

  @doc """
  Returns the list of playlists.

  ## Examples

      iex> list_playlists()
      [%Playlist{}, ...]

  """
  def list_playlists do
    Repo.all(Playlist |> order_by(asc: :name))
  end

  def list_in_apple_music_only do
    Repo.all(from p in Playlist, where: is_nil(p.spotify_url))
  end

  def list_in_spotify_only do
    Repo.all(from p in Playlist, where: is_nil(p.apple_music_url))
  end

  @doc """
  Gets a single playlist.

  Raises `Ecto.NoResultsError` if the Playlist does not exist.

  ## Examples

      iex> get_playlist!(123)
      %Playlist{}

      iex> get_playlist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_playlist!(id),
    do: Repo.get!(Playlist, id) |> Repo.preload(playlist_bought_tracks: :bought_track)

  @doc """
  Creates a playlist.

  ## Examples

      iex> create_playlist(%{field: value})
      {:ok, %Playlist{}}

      iex> create_playlist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_playlist(attrs \\ %{}) do
    %Playlist{}
    |> Playlist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a playlist.

  ## Examples

      iex> update_playlist(playlist, %{field: new_value})
      {:ok, %Playlist{}}

      iex> update_playlist(playlist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_playlist(%Playlist{} = playlist, attrs) do
    playlist
    |> Playlist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a playlist.

  ## Examples

      iex> delete_playlist(playlist)
      {:ok, %Playlist{}}

      iex> delete_playlist(playlist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_playlist(%Playlist{} = playlist) do
    Repo.delete(playlist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking playlist changes.

  ## Examples

      iex> change_playlist(playlist)
      %Ecto.Changeset{data: %Playlist{}}

  """
  def change_playlist(%Playlist{} = playlist, attrs \\ %{}) do
    Playlist.changeset(playlist, attrs)
  end

  alias MusicCollector.Music.PlaylistBoughtTrack

  def change_playlist_bought_track(%PlaylistBoughtTrack{} = playlist_bought_track, attrs \\ %{}) do
    PlaylistBoughtTrack.changeset(playlist_bought_track, attrs)
  end

  alias MusicCollector.Music.CheckOutLater

  @doc """
  Returns the list of check_out_laters.

  ## Examples

      iex> list_check_out_laters()
      [%CheckOutLater{}, ...]

  """
  def list_check_out_laters do
    Repo.all(CheckOutLater)
  end

  @doc """
  Gets a single check_out_later.

  Raises `Ecto.NoResultsError` if the Check out later does not exist.

  ## Examples

      iex> get_check_out_later!(123)
      %CheckOutLater{}

      iex> get_check_out_later!(456)
      ** (Ecto.NoResultsError)

  """
  def get_check_out_later!(id), do: Repo.get!(CheckOutLater, id)

  @doc """
  Creates a check_out_later.

  ## Examples

      iex> create_check_out_later(%{field: value})
      {:ok, %CheckOutLater{}}

      iex> create_check_out_later(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_check_out_later(attrs \\ %{}) do
    %CheckOutLater{}
    |> CheckOutLater.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a check_out_later.

  ## Examples

      iex> update_check_out_later(check_out_later, %{field: new_value})
      {:ok, %CheckOutLater{}}

      iex> update_check_out_later(check_out_later, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_check_out_later(%CheckOutLater{} = check_out_later, attrs) do
    check_out_later
    |> CheckOutLater.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a check_out_later.

  ## Examples

      iex> delete_check_out_later(check_out_later)
      {:ok, %CheckOutLater{}}

      iex> delete_check_out_later(check_out_later)
      {:error, %Ecto.Changeset{}}

  """
  def delete_check_out_later(%CheckOutLater{} = check_out_later) do
    Repo.delete(check_out_later)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking check_out_later changes.

  ## Examples

      iex> change_check_out_later(check_out_later)
      %Ecto.Changeset{data: %CheckOutLater{}}

  """
  def change_check_out_later(%CheckOutLater{} = check_out_later, attrs \\ %{}) do
    CheckOutLater.changeset(check_out_later, attrs)
  end

  alias MusicCollector.Music.BoughtTrack

  @doc """
  Returns the list of bought_tracks.

  ## Examples

      iex> list_bought_tracks()
      [%BoughtTrack{}, ...]

  """
  def list_bought_tracks do
    Repo.all(BoughtTrack)
  end

  @doc """
  Gets a single bought_track.

  Raises `Ecto.NoResultsError` if the Bought track does not exist.

  ## Examples

      iex> get_bought_track!(123)
      %BoughtTrack{}

      iex> get_bought_track!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bought_track!(id), do: Repo.get!(BoughtTrack, id)

  @doc """
  Creates a bought_track.

  ## Examples

      iex> create_bought_track(%{field: value})
      {:ok, %BoughtTrack{}}

      iex> create_bought_track(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bought_track(attrs \\ %{}) do
    %BoughtTrack{}
    |> BoughtTrack.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bought_track.

  ## Examples

      iex> update_bought_track(bought_track, %{field: new_value})
      {:ok, %BoughtTrack{}}

      iex> update_bought_track(bought_track, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bought_track(%BoughtTrack{} = bought_track, attrs) do
    bought_track
    |> BoughtTrack.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bought_track.

  ## Examples

      iex> delete_bought_track(bought_track)
      {:ok, %BoughtTrack{}}

      iex> delete_bought_track(bought_track)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bought_track(%BoughtTrack{} = bought_track) do
    Repo.delete(bought_track)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bought_track changes.

  ## Examples

      iex> change_bought_track(bought_track)
      %Ecto.Changeset{data: %BoughtTrack{}}

  """
  def change_bought_track(%BoughtTrack{} = bought_track, attrs \\ %{}) do
    BoughtTrack.changeset(bought_track, attrs)
  end
end
