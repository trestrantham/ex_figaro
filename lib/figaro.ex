defmodule Figaro do
  use Application
  alias Figaro.Yaml
  alias Figaro.Config
  alias Figaro.Env

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

    Env.update(config)

    Agent.start_link(fn -> config end, name: :config)
  end

  @doc """
  Get the data currently in `config`
  """
  def env do
    Agent.get(:config, fn map -> map end)
  end

  def load_config do
    config_file |> load_config
  end

  def load_config(file) do
    file
    |> Yaml.parse_file
    |> Config.process_raw
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
