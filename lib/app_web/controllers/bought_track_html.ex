defmodule MusicCollectorWeb.BoughtTrackHTML do
  use MusicCollectorWeb, :html

  embed_templates "bought_track_html/*"

  @doc """
  Renders a bought_track form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def bought_track_form(assigns)
end
