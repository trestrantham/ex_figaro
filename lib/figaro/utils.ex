defmodule Figaro.Utils do
  def parse_yaml(file) do
    { :ok, yaml } = file |> :yaml.load_file([:implicit_atoms])

    yaml
    |> List.flatten
    |> format_yaml
  end

  def format_yaml(list) do
    list
    |> Enum.map(fn ({ key, value }) ->
         value = cond do
           value |> is_list -> format_yaml(value)
           true             -> value
         end

         { key, value |> to_string }
       end)
    |> Enum.into %{}
  end

  def prepare_for_env(list) do
    list |> Enum.into [], fn ({ key, value }) -> { format_env_key(key), value |> to_string } end
  end

  def format_env_key(key) do
    key |> to_string |> String.upcase
  end
end
