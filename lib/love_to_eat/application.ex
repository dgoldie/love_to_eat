defmodule LoveToEat.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LoveToEatWeb.Telemetry,
      # Start the Ecto repository
      LoveToEat.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: LoveToEat.PubSub},
      # Start Finch
      {Finch, name: LoveToEat.Finch},
      # Start the Endpoint (http/https)
      LoveToEatWeb.Endpoint
      # Start a worker by calling: LoveToEat.Worker.start_link(arg)
      # {LoveToEat.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LoveToEat.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LoveToEatWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
