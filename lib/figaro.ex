defmodule Figaro do
  def load do
    config_file
    |> :yamerl_constr.file
    |> List.flatten
    |> Enum.each(fn var -> System.put_env(format_env_key(var), format_env_value(var)) end)
  end

  def get(key) do
    key
    |> to_string
    |> String.upcase
    |> System.get_env
  end

  defp config_file do
    file = File.cwd!
           |> Path.join("config")
           |> Path.join("application.yml")

    cond do
      File.exists?(file) -> file
      true               -> raise "application.yml not found"
    end
  end

  defp format_env_key(env_key) do
    env_key
    |> elem(0)
    |> to_string
    |> String.upcase
  end

  defp format_env_value(env_value) do
    env_value
    |> elem(1)
    |> to_string
  end
end
