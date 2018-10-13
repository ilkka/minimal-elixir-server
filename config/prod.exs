use Mix.Config

case "PORT" |> System.get_env() do
  nil -> nil
  port -> config :minserver, Minserver.Endpoint, port: String.to_integer(port)
end
