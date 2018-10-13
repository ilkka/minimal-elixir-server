defmodule Minserver.Endpoint do
  use Plug.Router
  require Logger

  plug(:match)

  plug(Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Poison)

  plug(:dispatch)

  forward("/bot", to: Minserver.Router)

  match _ do
    send_resp(conn, 404, "Not found")
  end

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  def start_link(_opts) do
    with({:ok, [port: port] = config} <- Application.fetch_env(:minserver, __MODULE__)) do
      Logger.info("Starting server at http://localhost:#{port}/")
      Plug.Adapters.Cowboy2.http(__MODULE__, [], config)
    end
  end
end
