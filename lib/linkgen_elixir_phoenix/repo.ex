defmodule LinkgenElixirPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :linkgen_elixir_phoenix,
    adapter: Ecto.Adapters.Postgres
end
