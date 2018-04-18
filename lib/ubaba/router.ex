defmodule Ubaba.Router do
  @moduledoc false

  import Plug.Conn
  use Plug.Router

  plug :match
  plug :dispatch

  get "/result" do
    conn |> ok(to_string(Ubaba.CalcServer.result))
  end

  post "/add" do
    IO.puts("I am adding")
    fetch_number(conn) |> Ubaba.CalcServer.add()

    conn |> ok
  end

  defp fetch_number(conn) do
    Plug.Conn.fetch_query_params(conn).params["number"]
    |> String.to_integer()

    #conn |> String.to_integer() |> IO.puts()
    #Plug.Conn.fetch_query_params(conn)
    #|> String.to_integer()

  end

  defp ok(conn, data \\ "OK") do
    send_resp(conn, 200, data)
  end
end