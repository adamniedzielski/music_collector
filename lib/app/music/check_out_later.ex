defmodule MusicCollector.Music.CheckOutLater do
  use Ecto.Schema
  import Ecto.Changeset

  schema "check_out_laters" do
    field :name, :string
    field :url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(check_out_later, attrs) do
    check_out_later
    |> cast(attrs, [:name, :url])
    |> validate_required([:name, :url])
  end
end
