defmodule MusicCollectorWeb.CheckOutLaterHTML do
  use MusicCollectorWeb, :html

  embed_templates "check_out_later_html/*"

  @doc """
  Renders a check_out_later form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def check_out_later_form(assigns)
end
