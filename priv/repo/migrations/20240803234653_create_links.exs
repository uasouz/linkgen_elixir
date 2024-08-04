defmodule LinkgenElixirPhoenix.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :shortid, :string
      add :originalURL, :string

      timestamps(type: :utc_datetime)
    end
  end
end
