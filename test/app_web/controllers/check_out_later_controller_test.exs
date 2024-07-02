defmodule MusicCollectorWeb.CheckOutLaterControllerTest do
  use MusicCollectorWeb.ConnCase

  import MusicCollector.MusicFixtures

  @create_attrs %{name: "some name", url: "some url"}
  @update_attrs %{name: "some updated name", url: "some updated url"}
  @invalid_attrs %{name: nil, url: nil}

  describe "index" do
    test "lists all check_out_laters", %{conn: conn} do
      conn = get(conn, ~p"/check_out_laters")
      assert html_response(conn, 200) =~ "Listing Check out laters"
    end
  end

  describe "new check_out_later" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/check_out_laters/new")
      assert html_response(conn, 200) =~ "New Check out later"
    end
  end

  describe "create check_out_later" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/check_out_laters", check_out_later: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/check_out_laters/#{id}"

      conn = get(conn, ~p"/check_out_laters/#{id}")
      assert html_response(conn, 200) =~ "Check out later #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/check_out_laters", check_out_later: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Check out later"
    end
  end

  describe "edit check_out_later" do
    setup [:create_check_out_later]

    test "renders form for editing chosen check_out_later", %{conn: conn, check_out_later: check_out_later} do
      conn = get(conn, ~p"/check_out_laters/#{check_out_later}/edit")
      assert html_response(conn, 200) =~ "Edit Check out later"
    end
  end

  describe "update check_out_later" do
    setup [:create_check_out_later]

    test "redirects when data is valid", %{conn: conn, check_out_later: check_out_later} do
      conn = put(conn, ~p"/check_out_laters/#{check_out_later}", check_out_later: @update_attrs)
      assert redirected_to(conn) == ~p"/check_out_laters/#{check_out_later}"

      conn = get(conn, ~p"/check_out_laters/#{check_out_later}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, check_out_later: check_out_later} do
      conn = put(conn, ~p"/check_out_laters/#{check_out_later}", check_out_later: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Check out later"
    end
  end

  describe "delete check_out_later" do
    setup [:create_check_out_later]

    test "deletes chosen check_out_later", %{conn: conn, check_out_later: check_out_later} do
      conn = delete(conn, ~p"/check_out_laters/#{check_out_later}")
      assert redirected_to(conn) == ~p"/check_out_laters"

      assert_error_sent 404, fn ->
        get(conn, ~p"/check_out_laters/#{check_out_later}")
      end
    end
  end

  defp create_check_out_later(_) do
    check_out_later = check_out_later_fixture()
    %{check_out_later: check_out_later}
  end
end
