defmodule LinkgenElixirPhoenix.LinkgenFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `LinkgenElixirPhoenix.Linkgen` context.
  """

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        originalURL: "some originalURL",
        shortid: "some shortid"
      })
      |> LinkgenElixirPhoenix.Linkgen.create_link()

    link
  end
end
