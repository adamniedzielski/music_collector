defmodule MusicCollectorWeb.WebfingerController do
  use MusicCollectorWeb, :controller

  def index(conn, params) do
    [account, domain] = String.split(params["resource"], "@")

    if domain != conn.host || account != "acct:adam" do
      conn |> put_status(:not_found) |> json(%{})
    else
      json(conn, %{subject: params["resource"], links: links(conn)})
    end
  end

  defp links(conn) do
    [
      %{
        "rel" => "self",
        "type" => "application/activity+json",
        "href" => "http://#{conn.host}/api/users/adam"
      }
    ]
  end
end
