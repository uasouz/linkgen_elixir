defmodule LinkgenElixirPhoenix.Linkgen do
  @moduledoc """
  The Linkgen context.
  """

  import Ecto.Query, warn: false
  alias LinkgenElixirPhoenix.Repo

  alias LinkgenElixirPhoenix.Linkgen.Link

  @doc """
  Returns the list of links.

  ## Examples

      iex> list_links()
      [%Link{}, ...]

  """
  def list_links do
    Repo.all(Link)
  end

  @doc """
  Gets a single link.

  Raises `Ecto.NoResultsError` if the Link does not exist.

  ## Examples

      iex> get_link!(123)
      %Link{}

      iex> get_link!(456)
      ** (Ecto.NoResultsError)

  """
  def get_link!(id) do
    query = from l in Link, where: l.shortid == ^id
    Repo.one(query)
  end

  @doc """
  Creates a link.

  ## Examples

      iex> create_link(%{field: value})
      {:ok, %Link{}}

      iex> create_link(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_link(url) do
    %Link{}
    |> Link.changeset(%{
      shortid: Ecto.UUID.generate(),
      originalURL: url
    })
    |> Repo.insert()
  end
end
