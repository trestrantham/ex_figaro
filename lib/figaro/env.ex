defmodule Figaro.Env do
  def prepare_config(config) do
    config |> Enum.into([], fn { key, value } -> { format_key(key), value } end)
  end

  def format_key(key) do
    key |> to_string |> String.upcase
  end
end
