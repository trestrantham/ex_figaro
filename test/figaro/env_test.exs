defmodule FigaroEnvTest do
  use ExUnit.Case, async: true
  alias Figaro.Env

  test "Env.prepare_config converts config to a list" do
    input  = %{foo: "bar", baz: "qux"}

    assert is_list(Env.prepare_config(input))
  end

  test "Env.prepare_config converts configs keys to uppercase" do
    input  = %{foo: "bar", baz: "qux"}
    output = [{"FOO", "bar"}, {"BAZ", "qux"}] |> Enum.reverse

    assert Env.prepare_config(input) == output
  end
end
