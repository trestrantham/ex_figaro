defmodule Figaro.Mixfile do
  use Mix.Project

  def project do
    [
      app: :figaro,
      version: "0.1.0",
      elixir: "~> 0.14.1",
      deps: deps,
      test_coverage: [tool: ExCoveralls],
      build_per_environment: true,
      description: "Simple Elixir project configuration",
      package: package
    ]
  end

  def application do
    [
      mod: { Figaro, [] },
      applications: []
    ]
  end

  defp deps do
    [
      { :yamler, github: "goertzenator/yamler", branch: 'master_before_maps' },
      { :excoveralls, github: "parroty/excoveralls", only: [:dev, :test] }
    ]
  end

  defp package do
    [
      files: ["lib", "mix.exs", "README*", "readme*", "LICENSE*", "license*"],
      contributors: ["Tres Trantham", "Steve Richert"],
      licenses: ["MIT"],
      links: %{ "GitHub" => "https://github.com/trestrantham/ex_figaro" }
    ]
  end
end
