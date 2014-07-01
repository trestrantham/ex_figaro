defmodule Figaro.Env do
  @doc """
  Updates the System ENV with the configuration defined in `config`.
  `config` must be a flattened map. Nested values will be ignored.
  """
  def update(config) do
    config
    |> prepare_config
    |> System.put_env

    config |> process_nullifications
  end

  def prepare_config(config) do
    config
    |> Enum.filter(fn { key, value } -> !is_map(value) && value != nil end)
    |> format_keys
  end

  def format_keys(config) do
    config
    |> Enum.map(fn { key, value } -> { to_string(key) |> String.upcase, value } end)
  end

  def process_nullifications(config) do
    config
    |> Enum.filter(fn { key, value } -> value == nil end)
    |> format_keys
    |> Enum.each(fn { key, value } -> System.delete_env(key) end)
  end
end
