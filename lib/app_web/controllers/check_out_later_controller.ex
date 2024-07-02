defmodule MusicCollectorWeb.CheckOutLaterController do
  use MusicCollectorWeb, :controller

  alias MusicCollector.Music
  alias MusicCollector.Music.CheckOutLater

  def index(conn, _params) do
    check_out_laters = Music.list_check_out_laters()
    render(conn, :index, check_out_laters: check_out_laters)
  end

  def new(conn, _params) do
    changeset = Music.change_check_out_later(%CheckOutLater{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"check_out_later" => check_out_later_params}) do
    case Music.create_check_out_later(check_out_later_params) do
      {:ok, check_out_later} ->
        conn
        |> put_flash(:info, "Check out later created successfully.")
        |> redirect(to: ~p"/check_out_laters/#{check_out_later}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    check_out_later = Music.get_check_out_later!(id)
    render(conn, :show, check_out_later: check_out_later)
  end

  def edit(conn, %{"id" => id}) do
    check_out_later = Music.get_check_out_later!(id)
    changeset = Music.change_check_out_later(check_out_later)
    render(conn, :edit, check_out_later: check_out_later, changeset: changeset)
  end

  def update(conn, %{"id" => id, "check_out_later" => check_out_later_params}) do
    check_out_later = Music.get_check_out_later!(id)

    case Music.update_check_out_later(check_out_later, check_out_later_params) do
      {:ok, check_out_later} ->
        conn
        |> put_flash(:info, "Check out later updated successfully.")
        |> redirect(to: ~p"/check_out_laters/#{check_out_later}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, check_out_later: check_out_later, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    check_out_later = Music.get_check_out_later!(id)
    {:ok, _check_out_later} = Music.delete_check_out_later(check_out_later)

    conn
    |> put_flash(:info, "Check out later deleted successfully.")
    |> redirect(to: ~p"/check_out_laters")
  end
end
