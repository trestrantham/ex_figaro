defmodule Figaro do
  use Application

  alias Figaro.Utils

  def start(_type, _args) do
    Figaro.Supervisor.start_link
  end

  @doc """
  Starts a new Figaro server and sets the ENV with variables
  defined in config/application.yml
  """
  def start_link do
    config = load_config

    set_env(config)

    Agent.start_link(fn -> config end, name: :config)
  end

  @doc """
  Gets the ENV variable defined in config/application.yml
  """
  def env do
    Agent.get(:config, fn map -> map end)
  end

  def load_config do
    config_file
    |> :yamerl_constr.file
    |> List.flatten
    |> Utils.cleanse_yaml
    |> Enum.into(Map.new)
  end

  def set_env(config) do
    config
    |> Utils.prepare_for_env
    |> System.put_env
  end

  def config_file do
    file = File.cwd!
           |> Path.join("config")
           |> Path.join("application.yml")

    cond do
      File.exists?(file) -> file
      true               -> raise "application.yml not found"
    end
  end
end
