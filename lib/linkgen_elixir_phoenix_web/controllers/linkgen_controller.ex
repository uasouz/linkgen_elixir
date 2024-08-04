defmodule LinkgenElixirPhoenixWeb.LinkgenController do
  use Phoenix.Controller, formats: [:json]
  alias LinkgenElixirPhoenix.Linkgen

  def generate_minified_link(conn, %{"url" => url}) do
    case Linkgen.create_link(url) do
      {:ok, link} ->
        json(conn, %{code: link.shortid})

      {:error} ->
        json(conn, %{error: "failed to create link"})
    end
  end

  def redirect_to_original_url(conn, %{"code" => code}) do
    case Linkgen.get_link!(code) do
      nil ->
        json(conn, %{error: "no redirect available"})

      link ->
        redirect(conn, external: link.originalURL, permanent: true)
    end
  end

end
