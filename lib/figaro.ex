defmodule Figaro do
  use Application
  alias Figaro.Utils

  def start(_type, _args) do
    import Supervisor.Spec
    children = [worker(Figaro, [])]

    opts = [strategy: :one_for_one, name: Figaro.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Start a new Figaro server and set ENV with configuration
  defined in application.yml
  """
  def start_link do
    config = load_config

    set_env(config)

    Agent.start_link(fn -> config end, name: :config)
  end

  @doc """
  Get the data currently in `config`
  """
  def env do
    Agent.get(:config, fn map -> map end)
  end

  def load_config do
    config_file |> Utils.parse_yaml
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
