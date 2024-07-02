defmodule MusicCollector.Repo.Migrations.CreateCheckOutLaters do
  use Ecto.Migration

  def change do
    create table(:check_out_laters) do
      add :name, :string
      add :url, :string

      timestamps(type: :utc_datetime)
    end
  end
end
