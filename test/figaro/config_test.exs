defmodule FigaroConfigTest do
  use ExUnit.Case, async: true
  alias Figaro.Config

  test "Config.process_raw returns only root element configurations" do
    input  = %{foo: "bar", baz: "qux", fuz: %{foo: "baz"}}
    output = %{foo: "bar", baz: "qux"}

    assert Config.process_raw(input) == output
  end

  test "Config.process_raw applies environment-specific configurations" do
    input  = %{foo: "bar", baz: "qux", test: %{foo: "baz"}}
    output = %{foo: "baz", baz: "qux"}

    assert Config.process_raw(input) == output
  end

  test "Config.process_raw nullifies environment-specific configurations" do
    input  = %{foo: "bar", baz: "qux", test: %{foo: nil}}
    output = %{foo: nil, baz: "qux"}

    assert Config.process_raw(input) == output
  end
end
