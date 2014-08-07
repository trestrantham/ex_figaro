defmodule Figaro.Yaml do
  def parse_file(file) do
    {:ok, yaml} = file |> :yaml.load_file([:implicit_atoms])

    yaml
    |> List.flatten
    |> format
  end

  defp format(list) do
    list
    |> Enum.map(fn {key, value} ->
         value = cond do
           value |> is_list -> format(value)
           value == :null   -> nil
           true             -> value |> to_string
         end

         {key, value}
       end)
    |> Enum.into(Map.new)
  end
end
