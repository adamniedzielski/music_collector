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
end
