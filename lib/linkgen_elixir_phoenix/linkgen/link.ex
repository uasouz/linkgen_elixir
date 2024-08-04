defmodule LinkgenElixirPhoenix.Linkgen.Link do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "links" do
    field :originalURL, :string
    field :shortid, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(link, attrs) do
    link
    |> cast(attrs, [:shortid, :originalURL])
    |> validate_required([:shortid, :originalURL])
  end
end
