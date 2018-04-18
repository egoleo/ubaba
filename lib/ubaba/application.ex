defmodule Ubaba.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do

    IO.puts("I am starting")

    #This is from the ubaba.exs
    Ubaba.hello()
    |> IO.puts()

    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Ubaba.Worker.start_link(arg)
      # {Ubaba.Worker, arg},

      Plug.Adapters.Cowboy.child_spec(
        :http, Ubaba.Router, [], [port: Application.fetch_env!(:ubaba, :port)]
      ),

      {Ubaba.CalcServer, 0}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Ubaba.Supervisor]
    Supervisor.start_link(children, opts)
  end
end