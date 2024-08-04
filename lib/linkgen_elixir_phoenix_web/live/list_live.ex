defmodule LinkgenElixirPhoenixWeb.ListLive do
  alias LinkgenElixirPhoenixWeb.AddLinkLive
  use LinkgenElixirPhoenixWeb, :live_view
  alias LinkgenElixirPhoenix.Linkgen

  def render(assigns) do
    ~H"""
    <div class="container mx-auto py-8">
      <h1 class="text-2xl font-bold mb-4">Links</h1>
      <.live_component module={AddLinkLive} id="new_link"/>
      <ul class="bg-white shadow rounded-lg">
        <%= for item <- @links do %>
          <li class="flex justify-between items-center p-4 border-b border-gray-200">
            <div>
              <div class="text-lg font-semibold"><%= item.shortid %></div>
              <div class="text-gray-500"><%= item.originalURL %></div>
            </div>
            <button phx-click="remove_item" phx-value-id={item.shortid} class="bg-red-500 text-white p-2 rounded-full hover:bg-red-700">
              <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20 12H4" />
              </svg>
            </button>
          </li>
        <% end %>
      </ul>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    links = Linkgen.list_links()
    {:ok, assign(socket, :links, links)}
  end

  def handle_event("remove_item", %{"id" => id}, socket) do
    IO.puts(id)
    Linkgen.remove_link(id)
    links = Linkgen.list_links()
    {:noreply, assign(socket, :links, links)}
  end

  def handle_info({:link_added, link}, socket) do
    links = Linkgen.list_links()
    {:noreply, assign(socket, :links, links)}
  end
end
