defmodule LinkgenElixirPhoenix.LinkgenTest do
  use LinkgenElixirPhoenix.DataCase

  alias LinkgenElixirPhoenix.Linkgen

  describe "links" do
    alias LinkgenElixirPhoenix.Linkgen.Link

    import LinkgenElixirPhoenix.LinkgenFixtures

    @invalid_attrs %{id: nil, originalURL: nil, shortid: nil}

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert Linkgen.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert Linkgen.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      valid_attrs = %{id: 42, originalURL: "some originalURL", shortid: "some shortid"}

      assert {:ok, %Link{} = link} = Linkgen.create_link(valid_attrs)
      assert link.id == 42
      assert link.originalURL == "some originalURL"
      assert link.shortid == "some shortid"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Linkgen.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      update_attrs = %{id: 43, originalURL: "some updated originalURL", shortid: "some updated shortid"}

      assert {:ok, %Link{} = link} = Linkgen.update_link(link, update_attrs)
      assert link.id == 43
      assert link.originalURL == "some updated originalURL"
      assert link.shortid == "some updated shortid"
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = Linkgen.update_link(link, @invalid_attrs)
      assert link == Linkgen.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = Linkgen.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> Linkgen.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = Linkgen.change_link(link)
    end
  end
end
