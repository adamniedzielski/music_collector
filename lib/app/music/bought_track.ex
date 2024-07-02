defmodule MusicCollector.Music.BoughtTrack do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bought_tracks" do
    field :name, :string
    field :artist, :string
    field :platform, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bought_track, attrs) do
    bought_track
    |> cast(attrs, [:name, :artist, :platform])
    |> validate_required([:name, :artist, :platform])
  end
end