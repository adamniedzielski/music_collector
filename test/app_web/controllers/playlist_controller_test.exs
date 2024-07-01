defmodule MusicCollectorWeb.PlaylistControllerTest do
  use MusicCollectorWeb.ConnCase

  import MusicCollector.MusicFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all playlists", %{conn: conn} do
      conn = get(conn, ~p"/playlists")
      assert html_response(conn, 200) =~ "Listing Playlists"
    end
  end

  describe "new playlist" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/playlists/new")
      assert html_response(conn, 200) =~ "New Playlist"
    end
  end

  describe "create playlist" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/playlists", playlist: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/playlists/#{id}"

      conn = get(conn, ~p"/playlists/#{id}")
      assert html_response(conn, 200) =~ "Playlist #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/playlists", playlist: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Playlist"
    end
  end

  describe "edit playlist" do
    setup [:create_playlist]

    test "renders form for editing chosen playlist", %{conn: conn, playlist: playlist} do
      conn = get(conn, ~p"/playlists/#{playlist}/edit")
      assert html_response(conn, 200) =~ "Edit Playlist"
    end
  end

  describe "update playlist" do
    setup [:create_playlist]

    test "redirects when data is valid", %{conn: conn, playlist: playlist} do
      conn = put(conn, ~p"/playlists/#{playlist}", playlist: @update_attrs)
      assert redirected_to(conn) == ~p"/playlists/#{playlist}"

      conn = get(conn, ~p"/playlists/#{playlist}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, playlist: playlist} do
      conn = put(conn, ~p"/playlists/#{playlist}", playlist: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Playlist"
    end
  end

  describe "delete playlist" do
    setup [:create_playlist]

    test "deletes chosen playlist", %{conn: conn, playlist: playlist} do
      conn = delete(conn, ~p"/playlists/#{playlist}")
      assert redirected_to(conn) == ~p"/playlists"

      assert_error_sent 404, fn ->
        get(conn, ~p"/playlists/#{playlist}")
      end
    end
  end

  defp create_playlist(_) do
    playlist = playlist_fixture()
    %{playlist: playlist}
  end
end
