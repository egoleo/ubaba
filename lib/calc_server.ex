defmodule Ubaba.CalcServer do
  @moduledoc false

    use GenServer

    def start_link(initial_value) do
      GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
    end

    def init(initial_value) when is_number(initial_value) do
      {:ok, initial_value}
    end

    def init(_) do
      {:stop, "The value must be an integer!"}
    end

    def add(number) do
      GenServer.cast(__MODULE__, {:add, number})
    end

    def result() do
      IO.puts("I am in RESULT")
      GenServer.call(__MODULE__, :result)
    end

    def handle_call(:result, _, state) do
      {:reply, state, state}
    end

    def handle_cast(operation, state) do
      IO.puts("I am starting from here....")

      case operation do
        {:add, number} ->
          IO.puts("I am testing #{number+1} ")

          is_integer(number) |> IO.puts()

        _ -> {:stop, "Not implemented", state}
      end
    end

    def terminate(_reason, _state) do
      IO.puts("The server is terminated.")
    end
end
