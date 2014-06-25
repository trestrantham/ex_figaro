defmodule Figaro.Mixfile do
  use Mix.Project

  def project do
    [
      app: :figaro,
      version: "0.0.1",
      elixir: "~> 0.14.1",
      deps: deps
    ]
  end

  def application do
    [
      applications: [:yamerl]
    ]
  end

  defp deps do
    [
      { :yamerl, github: "yakaz/yamerl" }
    ]
  end
end
