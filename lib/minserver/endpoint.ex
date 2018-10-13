defmodule Minserver.Endpoint do
  use Plug.Router

  plug(:match)

  plug(Plug.Parsers, parsers: [:json], pass: ["application/json"], json_decoder: Poison)

  plug(:dispatch)

  forward("/bot", to: Minserver.Router)

  match _ do
    send_resp(conn, 404, "Not found")
  end
end
