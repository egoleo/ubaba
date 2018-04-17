defmodule Ubaba.Router do
  @moduledoc false

  use Plug.Router

  plug :match
  plug :dispatch
end

get "/result" do
  conn |> ok(to_string(Ubaba.CalcServer.result()))
end

post "/add" do
  fetch_number(conn)
  |> Ubaba.CalcServer.add()

  conn |> ok
end


