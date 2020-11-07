defmodule CrmBackend.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CrmBackend.Repo,
      # Start the Telemetry supervisor
      CrmBackendWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CrmBackend.PubSub},
      # Start the Endpoint (http/https)
      CrmBackendWeb.Endpoint
      # Start a worker by calling: CrmBackend.Worker.start_link(arg)
      # {CrmBackend.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CrmBackend.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CrmBackendWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
