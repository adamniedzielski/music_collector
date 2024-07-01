defmodule MusicCollector.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MusicCollectorWeb.Telemetry,
      MusicCollector.Repo,
      {DNSCluster, query: Application.get_env(:app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MusicCollector.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MusicCollector.Finch},
      # Start a worker by calling: MusicCollector.Worker.start_link(arg)
      # {MusicCollector.Worker, arg},
      # Start to serve requests, typically the last entry
      MusicCollectorWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MusicCollector.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MusicCollectorWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
