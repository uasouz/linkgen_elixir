defmodule LinkgenElixirPhoenix.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      LinkgenElixirPhoenixWeb.Telemetry,
      LinkgenElixirPhoenix.Repo,
      {DNSCluster, query: Application.get_env(:linkgen_elixir_phoenix, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: LinkgenElixirPhoenix.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: LinkgenElixirPhoenix.Finch},
      # Start a worker by calling: LinkgenElixirPhoenix.Worker.start_link(arg)
      # {LinkgenElixirPhoenix.Worker, arg},
      # Start to serve requests, typically the last entry
      LinkgenElixirPhoenixWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LinkgenElixirPhoenix.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LinkgenElixirPhoenixWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
