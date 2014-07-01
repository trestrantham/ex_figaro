defmodule Figaro.Config do
  def process_raw(config) do
    env_config = config |> get_env_config

    config
    |> get_default_config
    |> Map.merge(env_config)
  end

  defp get_default_config(config) do
    config
    |> Enum.filter(fn { key, value } -> !is_map(value) end)
    |> Enum.into(Map.new)
  end

  defp get_env_config(config) do
    env_config = config
                 |> Enum.filter(fn { key, value } -> key == Mix.env && is_map(value) end)
                 |> List.last # last one wins

    cond do
      env_config == nil         -> %{}
      { key, map } = env_config -> map
    end
  end
end
