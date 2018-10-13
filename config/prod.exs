config :minserver, Minserver.Endpoint, port: "PORT" |> System.get_env() |> String.to_integer()
