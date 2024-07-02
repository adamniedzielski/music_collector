defmodule MusicCollectorWeb.CheckOutNowController do
  use MusicCollectorWeb, :controller

  alias MusicCollector.Music
  alias MusicCollector.Music.CheckOutLater

  def index(conn, _params) do
    check_out_later = Music.list_check_out_laters() |> Enum.random
    render(conn, :index, check_out_later: check_out_later)
  end
end
