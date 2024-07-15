defmodule MusicCollectorWeb.UsersController do
  use MusicCollectorWeb, :controller

  def index(conn, params) do
    conn = put_resp_content_type(conn, "application/activity+json")

    json(conn, %{
      "id" => "http://#{conn.host}/api/users/adam",
      "@context" => ["https://www.w3.org/ns/activitystreams"],
      "type" => "Person",
      "preferredUsername" => "adam",
      "inbox" => "http://#{conn.host}/api/users/adam/inbox"
    })
  end
end
