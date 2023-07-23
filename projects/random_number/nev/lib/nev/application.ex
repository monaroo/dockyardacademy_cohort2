defmodule Nev.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      NevWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: Nev.PubSub},
      # Start Finch
      {Finch, name: Nev.Finch},
      # Start the Endpoint (http/https)
      NevWeb.Endpoint
      # Start a worker by calling: Nev.Worker.start_link(arg)
      # {Nev.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Nev.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    NevWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
