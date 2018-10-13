defmodule Minserver.MixProject do
  use Mix.Project

  def project do
    [
      app: :minserver,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Minserver.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 4.0"},
      {:plug, "~> 1.6"},
      {:cowboy, "~> 2.5"}
    ]
  end
end
