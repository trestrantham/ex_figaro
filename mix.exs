defmodule Figaro.Mixfile do
  use Mix.Project

  def project do
    [
      app: :figaro,
      version: "0.0.1",
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
      applications: [:yamerl]
    ]
  end

  defp deps do
    [
      { :yamerl, github: "yakaz/yamerl" },
      { :excoveralls, github: "parroty/excoveralls" }
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
