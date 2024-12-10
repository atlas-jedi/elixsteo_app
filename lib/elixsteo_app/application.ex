defmodule ElixsteoApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      ElixsteoAppWeb.Telemetry,
      ElixsteoApp.Repo,
      {DNSCluster, query: Application.get_env(:elixsteo_app, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: ElixsteoApp.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: ElixsteoApp.Finch},
      # Start a worker by calling: ElixsteoApp.Worker.start_link(arg)
      # {ElixsteoApp.Worker, arg},
      # Start to serve requests, typically the last entry
      ElixsteoAppWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ElixsteoApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ElixsteoAppWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
