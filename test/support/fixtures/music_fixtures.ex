defmodule MusicCollector.MusicFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `MusicCollector.Music` context.
  """

  @doc """
  Generate a playlist.
  """
  def playlist_fixture(attrs \\ %{}) do
    {:ok, playlist} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> MusicCollector.Music.create_playlist()

    playlist
  end

  @doc """
  Generate a check_out_later.
  """
  def check_out_later_fixture(attrs \\ %{}) do
    {:ok, check_out_later} =
      attrs
      |> Enum.into(%{
        name: "some name",
        url: "some url"
      })
      |> MusicCollector.Music.create_check_out_later()

    check_out_later
  end

  @doc """
  Generate a bought_track.
  """
  def bought_track_fixture(attrs \\ %{}) do
    {:ok, bought_track} =
      attrs
      |> Enum.into(%{
        artist: "some artist",
        name: "some name",
        platform: "some platform"
      })
      |> MusicCollector.Music.create_bought_track()

    bought_track
  end
end
