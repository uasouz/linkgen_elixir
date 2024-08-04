defmodule LinkgenElixirPhoenixWeb.AddLinkLive do
  use LinkgenElixirPhoenixWeb, :live_component
  alias LinkgenElixirPhoenix.Linkgen

  def render(assigns) do
    ~H"""
    <div>
      <.simple_form
        for={@form}
        phx-target={@myself}
        phx-submit="new">
        <.input type="text" field={@form[:link]} />
        <button
class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 border border-blue-700 rounded"
          >Create new Short Link</button>
      </.simple_form>
    </div>
    """
  end

  def mount(socket) do
    form_fields = %{"link" => ""}
    {:ok, assign(socket, :form, to_form(form_fields))}
  end

  def handle_event("validate", %{"link" => link}, socket) do
    IO.puts(link)
    {:noreply, socket}
  end

  def handle_event("new", %{"link" => link}, socket) do
    Linkgen.create_link(link)
    send(self(), {:link_added, link})
    {:noreply, socket}
  end
end
