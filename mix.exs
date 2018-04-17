defmodule Ubaba.MixProject do
  use Mix.Project

  def project do
    [
      app: :ubaba,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Ubaba.Application, []},

      env: [ # <===
        key: :value
      ]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      #Add dependencies

      #{:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"},
      {:poison, "~> 3.1"},
      {:cowboy, "~> 1.1"},
      {:plug, "~> 1.4"}
    ]
  end
end
