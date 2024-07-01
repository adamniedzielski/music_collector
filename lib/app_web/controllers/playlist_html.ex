defmodule MusicCollectorWeb.PlaylistHTML do
  use MusicCollectorWeb, :html

  embed_templates "playlist_html/*"

  @doc """
  Renders a playlist form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def playlist_form(assigns)
end
