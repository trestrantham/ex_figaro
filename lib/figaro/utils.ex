defmodule Figaro.Utils do
  def cleanse_yaml(list) do
    list
    |> Enum.map(fn ({ key, value }) ->
         { key |> to_string |> String.to_atom, value |> to_string }
       end)
  end

  def prepare_for_env(list) do
    list
    |> Enum.into([], fn ({ key, value }) ->
         { key |> to_string |> String.upcase, value |> to_string }
       end)
  end
end
