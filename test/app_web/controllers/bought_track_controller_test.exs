defmodule MusicCollectorWeb.BoughtTrackControllerTest do
  use MusicCollectorWeb.ConnCase

  import MusicCollector.MusicFixtures

  @create_attrs %{name: "some name", artist: "some artist", platform: "some platform"}
  @update_attrs %{
    name: "some updated name",
    artist: "some updated artist",
    platform: "some updated platform"
  }
  @invalid_attrs %{name: nil, artist: nil, platform: nil}

  describe "index" do
    test "lists all bought_tracks", %{conn: conn} do
      conn = get(conn, ~p"/bought_tracks")
      assert html_response(conn, 200) =~ "Listing Bought tracks"
    end
  end

  describe "new bought_track" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/bought_tracks/new")
      assert html_response(conn, 200) =~ "New Bought track"
    end
  end

  describe "create bought_track" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/bought_tracks", bought_track: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/bought_tracks/#{id}"

      conn = get(conn, ~p"/bought_tracks/#{id}")
      assert html_response(conn, 200) =~ "Bought track #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/bought_tracks", bought_track: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bought track"
    end
  end

  describe "edit bought_track" do
    setup [:create_bought_track]

    test "renders form for editing chosen bought_track", %{conn: conn, bought_track: bought_track} do
      conn = get(conn, ~p"/bought_tracks/#{bought_track}/edit")
      assert html_response(conn, 200) =~ "Edit Bought track"
    end
  end

  describe "update bought_track" do
    setup [:create_bought_track]

    test "redirects when data is valid", %{conn: conn, bought_track: bought_track} do
      conn = put(conn, ~p"/bought_tracks/#{bought_track}", bought_track: @update_attrs)
      assert redirected_to(conn) == ~p"/bought_tracks/#{bought_track}"

      conn = get(conn, ~p"/bought_tracks/#{bought_track}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, bought_track: bought_track} do
      conn = put(conn, ~p"/bought_tracks/#{bought_track}", bought_track: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bought track"
    end
  end

  describe "delete bought_track" do
    setup [:create_bought_track]

    test "deletes chosen bought_track", %{conn: conn, bought_track: bought_track} do
      conn = delete(conn, ~p"/bought_tracks/#{bought_track}")
      assert redirected_to(conn) == ~p"/bought_tracks"

      assert_error_sent 404, fn ->
        get(conn, ~p"/bought_tracks/#{bought_track}")
      end
    end
  end

  defp create_bought_track(_) do
    bought_track = bought_track_fixture()
    %{bought_track: bought_track}
  end
end
