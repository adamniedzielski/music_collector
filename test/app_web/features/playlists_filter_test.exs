defmodule MusicCollectorWeb.Features.PlaylistsFilterTest do
  use MusicCollector.DataCase
  use Wallaby.Feature

  import MusicCollector.MusicFixtures

  import Wallaby.Query, only: [link: 1]

  feature "users can filter for Only in Apple Music", %{session: session} do
    playlist_fixture(%{apple_music_url: "http://apple.music", name: "Classix Rock"})

    session
    |> visit("/playlists")
    |> click(link("Only in Apple Music"))
    |> assert_text("Classix Rock")
  end
end
