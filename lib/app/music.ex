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
  def get_playlist!(id), do: Repo.get!(Playlist, id)

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
end
