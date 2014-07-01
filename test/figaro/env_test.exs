defmodule FigaroEnvTest do
  use ExUnit.Case, async: true
  alias Figaro.Env

  setup do
    on_exit fn ->
      System.delete_env("FOO")
      System.delete_env("BAZ")
    end
  end

  test "Env.update applies the given `config` to the ENV" do
    input  = %{foo: "bar", baz: "qux"}

    assert :ok = Env.update(input)
    assert System.get_env("FOO") == "bar"
    assert System.get_env("BAZ") == "qux"
  end

  test "Env.update unsets ENV variables appropriately" do
    input  = %{foo: nil, baz: "qux"}
    System.put_env("FOO", "foo")

    assert System.get_env("FOO") == "foo"

    assert :ok = Env.update(input)
    assert System.get_env("FOO") == nil
    assert System.get_env("BAZ") == "qux"
  end
end
